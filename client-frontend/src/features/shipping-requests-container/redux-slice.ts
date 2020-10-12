import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import unionArrayById from '../../utils/union-by-id'
import { IShippingRequest } from './types'

const initialState: IShippingRequest[] = []

export const shippingRequestSlice = createSlice({
	name: 'shippingRequests',
	initialState,
	reducers: {
		fetchShippingRequests(state, action: PayloadAction<IShippingRequest[]>) {
			return unionArrayById(state, action.payload)
		},
	},
})

export default shippingRequestSlice.reducer
