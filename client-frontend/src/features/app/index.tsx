import React from 'react'
import { Layout } from '../../components/layout'
import { Switch, Route, Redirect } from 'react-router-dom'
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
		<Route exact path="/recipient/shipping-requests/:shippingRequestId/enquiries" component={RecipientEnquiries} />
		<Route exact path="/recipient/shipping-requests" component={RecipientShippingRequests} />
		<Route exact path="/agent/routes/transport-orders" component={AgentTransportOrders} />
		<Route exact path="/agent/routes/freight-bills" component={AgentFreightBills} />
		<Route exact path="/agent/routes" component={AgentRoutes} />
	</Layout>
)

export default App
