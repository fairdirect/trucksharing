import { combineReducers } from '@reduxjs/toolkit'
import shippingRequests from '../features/shipping-requests-container/redux-slice'
import activeShippingRequest from '../features/active-shipping-request/redux-slice'
import userInfo from '../features/user-info/redux-slice'
import enquiryRoutes from '../features/enquiry-routes/redux-slice'
import enquiryActiveRoute from '../features/enquiry-active-route/redux-slice'

const rootReducer = combineReducers({
  shippingRequests,
  activeShippingRequest,
  userInfo,
  enquiryRoutes,
  enquiryActiveRoute,
})

export default rootReducer
