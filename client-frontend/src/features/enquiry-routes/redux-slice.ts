import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import { unionById } from '../../utils/array'
import { IShippingRequest } from '../shipping-requests-container/types'
import { IRoute } from './types'

const initialState: IRoute[] = [
  {
    id: '14341',
    route_date_start: '28/02/2020',
    route_city_start: 'Berlin, 80881 Berlin',
    route_city_end: 'Dusseldorf, 80881 Dusseldorf',
    route_stops: {
      url: 'string',
      label: '4 stops',
    },
    route_space_available: '5 palettes',
    route_weight_available: '380 kg',
    route_unloading_device: 'YES',
    route_service_provider: 'Dachser',
    route_status: 'available',
    route_price: '980 EUR',
  },
  {
    id: '143412',
    route_date_start: '28/02/2020',
    route_city_start: 'Berlin, 80881 Berlin',
    route_city_end: 'Dusseldorf, 80881 Dusseldorf',
    route_stops: {
      url: 'string',
      label: '4 stops',
    },
    route_space_available: '5 palettes',
    route_weight_available: '380 kg',
    route_unloading_device: 'YES',
    route_service_provider: 'Dachser',
    route_status: 'unavailable',
    route_price: '980 EUR',
  },
  {
    id: '14346',
    route_date_start: '28/02/2020',
    route_city_start: 'Berlin, 80881 Berlin',
    route_city_end: 'Dusseldorf, 80881 Dusseldorf',
    route_stops: {
      url: 'string',
      label: '4 stops',
    },
    route_space_available: '5 palettes',
    route_weight_available: '380 kg',
    route_unloading_device: 'YES',
    route_service_provider: 'Dachser',
    route_status: 'pending enquiry',
    route_price: '980 EUR',
  },
  {
    id: '14341',
    route_date_start: '28/02/2020',
    route_city_start: 'Berlin, 80881 Berlin',
    route_city_end: 'Dusseldorf, 80881 Dusseldorf',
    route_stops: {
      url: 'string',
      label: '4 stops',
    },
    route_space_available: '5 palettes',
    route_weight_available: '380 kg',
    route_unloading_device: 'YES',
    route_service_provider: 'Dachser',
    route_status: 'available',
    route_price: '980 EUR',
  },
]

export const enquiryRoutesSlice = createSlice({
  name: 'enquiryRoutes',
  initialState,
  reducers: {
    fetchRoutes(state, action: PayloadAction<IShippingRequest[]>) {
      return unionById(state, action.payload)
    },
  },
})

export default enquiryRoutesSlice.reducer
