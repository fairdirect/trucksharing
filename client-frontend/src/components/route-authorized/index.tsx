import React from 'react'
import { RouteComponentProps, Route, Redirect } from 'react-router-dom'
import { ROUTES } from '../../constants'
import { useAuth } from '../../utils/hooks/use-auth'

interface IRouteAuthorized {
  Component: React.FC<RouteComponentProps>
  path: string
  exact?: boolean
}

export const RouteAuthorized = ({ Component, path, exact = false }: IRouteAuthorized): JSX.Element => {
  // TODO: Replace with real token, once available + add access logic
  const { user } = useAuth()

  // TODO: add state with location, so users can return easily after login in
  const handleRender = (props: RouteComponentProps) => (user.authorized ? <Component {...props} /> : <Redirect to={ROUTES.VISITOR.ROOT} />)

  return <Route exact={exact} path={path} render={handleRender} />
}
