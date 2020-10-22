import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import { IShippingRequest } from '../shipping-requests-container/types'

const initialState: Partial<IShippingRequest> = {}

export const activeShippingRequestSlice = createSlice({
	name: 'activeShippingRequest',
	initialState,
	reducers: {
		setActiveShippingRequest(state, action: PayloadAction<IShippingRequest>) {
			if (state !== action.payload) return action.payload

			return state
		},
	},
})

export const { setActiveShippingRequest } = activeShippingRequestSlice.actions

export default activeShippingRequestSlice.reducer
