import { createSelector } from 'reselect'
import { RootState } from '../features/app/types'
import { IShippingRequest } from '../features/shipping-requests-container/types'

export const getShippingRequestsSelector = (state: RootState) => state.shippingRequests
export const getActiveShippingSelector = (state: RootState) => state.activeShippingRequest

export const getActiveRequestDetailsSelector = createSelector<RootState, string, IShippingRequest[], IShippingRequest | undefined>(
  getActiveShippingSelector,
  getShippingRequestsSelector,
  (id, requests) => requests.find((request) => request.id === id),
)
