import { combineReducers } from '@reduxjs/toolkit'
import shippingRequests from '../features/shipping-requests-container/redux-slice'

const rootReducer = combineReducers({
	shippingRequests,
})

export default rootReducer
