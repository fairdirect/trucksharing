import React, { useState, useEffect, useContext, createContext, FC } from 'react'
import { useHistory } from 'react-router-dom'
import { ROUTES } from '../../constants'

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
  const history = useHistory()
  const [user, setUser] = useState<IUserInfo>(initialUser)
  const fakeToken = process.env.REACT_APP_DUMMY_TOKEN_RECIPIENT
  const [token, setToken] = useState(fakeToken)

  const signIn = async () => {
    // TODO: ... add logic to validate token
    console.log('Signing in')
    setToken(fakeToken)
    const fakeResponse = {
      role: 'recipient',
      authorized: Boolean(fakeToken),
      token: fakeToken ?? '',
    }

    setUser(fakeResponse)

    return fakeResponse
  }

  const signOut = () => {
    setUser(initialUser)
    setToken(undefined)
    history.push(ROUTES.VISITOR.ROOT)
  }

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
