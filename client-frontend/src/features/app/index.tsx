import React, { Suspense } from 'react'
import { Layout, RouteAuthorized } from '../../components'
import { Route, Switch } from 'react-router-dom'
import { ROUTES } from '../../constants'

const VisitorDefault = React.lazy(() => import('../../routes/visitor/visitor-default'))
const RecipientEnquiries = React.lazy(() => import('../../routes/recipient/recipient-enquiries'))
const RecipientShippingRequests = React.lazy(() => import('../../routes/recipient/recipient-shipping-requests'))
const AgentFreightBills = React.lazy(() => import('../../routes/agent/agent-freight-bills'))
const AgentRoutes = React.lazy(() => import('../../routes/agent/agent-routes'))
const AgentTransportOrders = React.lazy(() => import('../../routes/agent/agent-transport-orders'))
const PageNotFound = React.lazy(() => import('../../routes/page-not-found'))

const App = () => (
  <Layout>
    <Suspense fallback={<div>loading...</div>}>
      <Switch>
        <Route exact path="/" component={VisitorDefault} />
        <RouteAuthorized path={ROUTES.RECIPIENT.ENQUIRY_PLANNER} Component={RecipientEnquiries} />
        <RouteAuthorized path={ROUTES.RECIPIENT.SHIPPING_REQUESTS} Component={RecipientShippingRequests} />
        <RouteAuthorized path={ROUTES.AGENT.TRANSPORT_ORDERS} Component={AgentTransportOrders} />
        <RouteAuthorized path={ROUTES.AGENT.FREIGHT_BILLS} Component={AgentFreightBills} />
        <RouteAuthorized path={ROUTES.AGENT.ROUTES} Component={AgentRoutes} />
        <Route component={PageNotFound} />
      </Switch>
    </Suspense>
  </Layout>
)

export default App
