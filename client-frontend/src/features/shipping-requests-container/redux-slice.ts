import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import { unionById } from '../../utils/array'
import { IShippingRequest } from './types'

const initialState: IShippingRequest[] = []

export const shippingRequestSlice = createSlice({
	name: 'shippingRequests',
	initialState,
	reducers: {
		fetchShippingRequests(state, action: PayloadAction<IShippingRequest[]>) {
			return unionById(state, action.payload)
		},
	},
})

export default shippingRequestSlice.reducer
