import { RootState } from '../features/app/types'

export const getShippingRequestsSelector = (state: RootState) => state.shippingRequests
export const getActiveShippingSelector = (state: RootState) => state.activeShippingRequest
