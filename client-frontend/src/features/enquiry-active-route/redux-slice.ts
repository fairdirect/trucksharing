import { createSlice, PayloadAction } from '@reduxjs/toolkit'

const initialState = ''

export const enquiryActiveRouteSlice = createSlice({
  name: 'enquiryActiveRoute',
  initialState,
  reducers: {
    setEnquiryActiveRoute(state, action: PayloadAction<string>) {
      if (state !== action.payload) return action.payload

      return state
    },
  },
})

export const { setEnquiryActiveRoute } = enquiryActiveRouteSlice.actions

export default enquiryActiveRouteSlice.reducer
