import React from 'react'
import { Layout } from '../../components'
import { Route } from 'react-router-dom'
import { ROUTES } from '../../constants'
import {
  VisitorDefault,
  RecipientEnquiries,
  RecipientShippingRequests,
  AgentFreightBills,
  AgentRoutes,
  AgentTransportOrders,
} from '../../routes'

const App = () => (
  <Layout>
    <Route exact path="/" component={VisitorDefault} />
    <Route exact path={ROUTES.RECIPIENT.ENQUIRY_PLANNER} component={RecipientEnquiries} />
    <Route exact path={ROUTES.RECIPIENT.SHIPPING_REQUESTS} component={RecipientShippingRequests} />
    <Route exact path={ROUTES.AGENT.TRANSPORT_ORDERS} component={AgentTransportOrders} />
    <Route exact path={ROUTES.AGENT.FREIGHT_BILLS} component={AgentFreightBills} />
    <Route exact path={ROUTES.AGENT.ROUTES} component={AgentRoutes} />
  </Layout>
)

export default App
