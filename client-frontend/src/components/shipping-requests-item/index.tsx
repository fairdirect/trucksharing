import React from 'react'
import { IShippingRequest } from '../../features/shipping-requests-container/types'

const ShippingRequestItem = (props: IShippingRequest) => {
	const handleSelect = () => {
		console.log('Select')
	}

	return (
		<div>
			{props.id} <button onClick={handleSelect}>Select</button>
		</div>
	)
}

export default ShippingRequestItem
