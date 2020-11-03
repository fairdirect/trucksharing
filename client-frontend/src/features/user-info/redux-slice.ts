import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import { IUserInfo } from './types'

// FIXME: Should be empty, for now it's just a mock
const initialState: IUserInfo = {
	role: 'recipient',
}

export const userInfoSlice = createSlice({
	name: 'userInfo',
	initialState,
	reducers: {
		setUserInfo(state, action: PayloadAction<IUserInfo>) {
			if (state !== action.payload) return action.payload

			return state
		},
	},
})

export default userInfoSlice.reducer
