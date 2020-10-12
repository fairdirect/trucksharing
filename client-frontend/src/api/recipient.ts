import { IShippingRequest } from '../features/shipping-requests-container/types'
import recipientInstance from './recipient-instance'

// TODO: add pagination support
// TODO: add TS types once the response shape settles
export const getAllShippingRequests = async () => {
	try {
		const response = await recipientInstance.get('/shipping_requests')
		const {
			data: { data },
			statusText,
			status,
		}: { data: { data: IShippingRequest[] }; statusText: string; status: number } = response
		const isOk: boolean = statusText === 'OK'

		return isOk ? { status, data } : { status, statusText }
	} catch (error) {
		throw new Error(error)
	}
}
