import { AppThunk, AppDispatch } from '../app/types'
import { shippingRequestSlice } from './redux-slice'
import { getAllShippingRequests } from '../../api/recipient'

export const fetchShippingRequests = (): AppThunk => async (dispatch: AppDispatch) => {
	// TODO: Think about caching the responses
	getAllShippingRequests()
		.then((response) => {
			response.data && dispatch(shippingRequestSlice.actions.fetchShippingRequests(response.data))
			// TODO: Add user facing success notification
		})
		.catch((error) => {
			// TODO: Add user facing error notification
			throw new Error(error)
		})
}
