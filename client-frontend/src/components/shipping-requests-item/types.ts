export interface IShippingRequestItem {
	id: string
	attributes: {
		[key: string]: string | number
	}
	isLast: boolean
	isEven: boolean
	onClick: (id: string) => void
	classes: { [key: string]: string }
}

export interface INestedStringObj {
	className: string
	collection: { [key: string]: string }
}
