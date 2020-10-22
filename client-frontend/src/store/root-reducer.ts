import { combineReducers } from '@reduxjs/toolkit'
import shippingRequests from '../features/shipping-requests-container/redux-slice'
import activeShippingRequest from '../features/active-shipping-request/redux-slice'

const rootReducer = combineReducers({
	shippingRequests,
	activeShippingRequest,
})

export default rootReducer
