import React, { useEffect } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { RootState } from '../app/types'
import { IShippingRequest } from './types'
import { fetchShippingRequests } from './action-creators'
import ShippingRequestItem from '../../components/shipping-requests-item'

const ShippingRequestsContainer: React.FunctionComponent = () => {
	const dispatch = useDispatch()
	const getAllRequests = () => dispatch(fetchShippingRequests())

	const shippingRequests = useSelector((state: RootState) => state.shippingRequests)

	useEffect(() => {
		getAllRequests()
	}, [])

	return (
		<div>
			<button onClick={getAllRequests}>Fetch new requests</button>
			<div>
				{shippingRequests.map((request: IShippingRequest) => (
					<ShippingRequestItem key={request.id} {...request} />
				))}
			</div>
		</div>
	)
}

export default ShippingRequestsContainer
