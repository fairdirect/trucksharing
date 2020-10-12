export interface IShippingRequest {
	id: string
	orderNumber: string
	deliveryCity: string
	deliveryStreet: string
	deliveryHouse: string
	pickupCity: string
	pickupStreet: string
	pickupHouse: string
	showDetails: boolean
}
