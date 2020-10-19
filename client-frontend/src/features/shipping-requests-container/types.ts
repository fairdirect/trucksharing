export interface IShippingRequest {
	id: string
	attributes: {
		[key: string]: string | number
	}
}
