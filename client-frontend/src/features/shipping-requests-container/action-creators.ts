import { AppThunk, AppDispatch } from '../app/types'
import { shippingRequestSlice } from './redux-slice'
import { getAllShippingRequests } from '../../api/recipient'

export const fetchShippingRequests = (token: string): AppThunk => async (dispatch: AppDispatch) => {
  // TODO: Think about caching the responses
  getAllShippingRequests(token)
    .then((data) => {
      dispatch(shippingRequestSlice.actions.fetchShippingRequests(data))
      // TODO: Add user facing success notification
    })
    .catch((error) => {
      // TODO: Add user facing error notification
      throw new Error(error)
    })
}
