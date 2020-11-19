import React, { Suspense, useEffect } from 'react'
import { Layout, RouteAuthorized } from '../../components'
import { Route, Switch, useLocation, useHistory } from 'react-router-dom'
import { ROUTES } from '../../constants'
import { useAuth } from '../../utils/hooks/use-auth'

const VisitorDefault = React.lazy(() => import('../../routes/visitor/visitor-default'))
const RecipientEnquiries = React.lazy(() => import('../../routes/recipient/recipient-enquiries'))
const RecipientShippingRequests = React.lazy(() => import('../../routes/recipient/recipient-shipping-requests'))
const AgentFreightBills = React.lazy(() => import('../../routes/agent/agent-freight-bills'))
const AgentRoutes = React.lazy(() => import('../../routes/agent/agent-routes'))
const AgentTransportOrders = React.lazy(() => import('../../routes/agent/agent-transport-orders'))
const PageNotFound = React.lazy(() => import('../../routes/page-not-found'))

const App = () => {
  const { user } = useAuth()
  const history = useHistory()
  const locationInfo = useLocation()

  const handleUserChange = () => {
    if (user.authorized && user.role === 'recipient') return history.push(ROUTES.RECIPIENT.SHIPPING_REQUESTS)
    if (user.authorized && user.role === 'agent') return history.push(ROUTES.AGENT.ROUTES_LIST)

    return null
  }

  useEffect(() => {
    locationInfo.pathname === ROUTES.VISITOR.ROOT && handleUserChange()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user])

  return (
    <Layout>
      <Suspense fallback={<div>loading...</div>}>
        <Switch>
          <Route exact path="/" component={VisitorDefault} />
          <RouteAuthorized exact path={ROUTES.RECIPIENT.ENQUIRY_PLANNER} Component={RecipientEnquiries} />
          <RouteAuthorized exact path={ROUTES.RECIPIENT.SHIPPING_REQUESTS} Component={RecipientShippingRequests} />
          <RouteAuthorized exact path={ROUTES.AGENT.TRANSPORT_ORDERS} Component={AgentTransportOrders} />
          <RouteAuthorized exact path={ROUTES.AGENT.FREIGHT_BILLS} Component={AgentFreightBills} />
          <RouteAuthorized exact path={ROUTES.AGENT.ROUTES_LIST} Component={AgentRoutes} />
          <Route component={PageNotFound} />
        </Switch>
      </Suspense>
    </Layout>
  )
}

export default App
