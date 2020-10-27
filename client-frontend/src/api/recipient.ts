import recipientInstance from './recipient-instance'

// TODO: add pagination support
// TODO: add TS types once the response shape settles
export const getAllShippingRequests = async () => {
	try {
		const response = await recipientInstance.get('/shipping_requests')
		return response.data.data
	} catch (error) {
		throw new Error(error)
	}
}
