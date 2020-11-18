import React, { Suspense } from 'react'
import { Layout } from '../../components'
import { Route, Switch } from 'react-router-dom'
import { ROUTES } from '../../constants'

const VisitorDefault = React.lazy(() => import('../../routes/visitor/visitor-default'))
const RecipientEnquiries = React.lazy(() => import('../../routes/recipient/recipient-enquiries'))
const RecipientShippingRequests = React.lazy(() => import('../../routes/recipient/recipient-shipping-requests'))
const AgentFreightBills = React.lazy(() => import('../../routes/agent/agent-freight-bills'))
const AgentRoutes = React.lazy(() => import('../../routes/agent/agent-routes'))
const AgentTransportOrders = React.lazy(() => import('../../routes/agent/agent-transport-orders'))

const App = () => (
  <Layout>
    <Suspense fallback={<div>loading...</div>}>
      <Switch>
        <Route exact path="/" component={VisitorDefault} />
        <Route path={ROUTES.RECIPIENT.ENQUIRY_PLANNER} component={RecipientEnquiries} />
        <Route path={ROUTES.RECIPIENT.SHIPPING_REQUESTS} component={RecipientShippingRequests} />
        <Route path={ROUTES.AGENT.TRANSPORT_ORDERS} component={AgentTransportOrders} />
        <Route path={ROUTES.AGENT.FREIGHT_BILLS} component={AgentFreightBills} />
        <Route path={ROUTES.AGENT.ROUTES} component={AgentRoutes} />
      </Switch>
    </Suspense>
  </Layout>
)

export default App
