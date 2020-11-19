import { apiInstance } from './instances'
import { API_ROUTES } from '../constants'

// TODO: add pagination support
// FIXME: remove dummy token
export const getAllShippingRequests = async (token: string) => {
  try {
    const response = await apiInstance.get(API_ROUTES.RECIPIENT.SHIPPING_REQUESTS, {
      headers: {
        Authorisation: token,
      },
    })
    return response.data.data
  } catch (error) {
    throw new Error(error)
  }
}
