import React, { useState, useEffect, useContext, createContext, FC } from 'react'
interface IAuthContext {
  [key: string]: any
}

interface IUserInfo {
  role: string
  authorized: boolean
  token: string
}

const initialUser = {
  role: 'visitor',
  authorized: false,
  token: '',
}

export const AuthContext = createContext<IAuthContext>({})

// TODO: Add cookie parse and get token from cookie
const useProvideAuth = () => {
  const [user, setUser] = useState<IUserInfo>(initialUser)

  // FIXME: Replace with real token from cookie
  const token = process.env.REACT_APP_DUMMY_TOKEN_RECIPIENT

  const signIn = async () => {
    // TODO: ... add logic to validate token
    const fakeResponse = {
      role: token ? 'recipient' : '',
      authorized: true,
      token: token ?? '',
    }
    setUser(fakeResponse)

    return fakeResponse
  }

  const signOut = () => setUser(initialUser)

  useEffect(() => {
    if (!user.authorized && token) signIn()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return {
    user,
    signIn,
    signOut,
  }
}

export const ProvideAuth: FC = ({ children }): JSX.Element => {
  const auth = useProvideAuth()

  return <AuthContext.Provider value={auth}>{children}</AuthContext.Provider>
}

export const useAuth = () => useContext(AuthContext)
