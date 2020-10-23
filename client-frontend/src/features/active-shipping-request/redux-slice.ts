import { createSlice, PayloadAction } from '@reduxjs/toolkit'

const initialState = ''

export const activeShippingRequestSlice = createSlice({
	name: 'activeShippingRequest',
	initialState,
	reducers: {
		setActiveShippingRequest(state, action: PayloadAction<string>) {
			if (state !== action.payload) return action.payload

			return state
		},
	},
})

export const { setActiveShippingRequest } = activeShippingRequestSlice.actions

export default activeShippingRequestSlice.reducer
