import { createSelector } from 'reselect'
import { RootState } from '../features/app/types'
import { IShippingRequest } from '../features/shipping-requests-container/types'
import { IRoute } from '../features/enquiry-routes/types'

export const getShippingRequestsSelector = (state: RootState) => state.shippingRequests
export const getActiveShippingSelector = (state: RootState) => state.activeShippingRequest

export const getActiveRequestDetailsSelector = createSelector<RootState, string, IShippingRequest[], IShippingRequest | undefined>(
  getActiveShippingSelector,
  getShippingRequestsSelector,
  (id, requests) => requests.find((request) => request.id === id),
)

export const getEnquiryRoutesSelector = (state: RootState) => state.enquiryRoutes
export const getEnquiryActiveRouteSelector = (state: RootState) => state.enquiryActiveRoute

export const getEnquiryActiveRouteDetailsSelector = createSelector<RootState, string, IRoute[], IRoute | undefined>(
  getEnquiryActiveRouteSelector,
  getEnquiryRoutesSelector,
  (id, requests) => requests.find((request) => request.id === id),
)
