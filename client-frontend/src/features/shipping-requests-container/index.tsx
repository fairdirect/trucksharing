import React, { useEffect, useCallback } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { RootState } from '../app/types'
import { IShippingRequest } from './types'
import { fetchShippingRequests } from './action-creators'
import { Table, ShippingRequestsItem } from '../../components'

const tableHeaders = [
	'Status',
	'Donation date',
	'Order number (ID)',
	'Cargo type',
	'Cargo volume',
	'Weight (tare incl.)',
	'Unloading device',
	'Delivery deadline',
	'',
]

const ShippingRequestsContainer: React.FunctionComponent = () => {
	const dispatch = useDispatch()
	const getAllRequests = useCallback(() => dispatch(fetchShippingRequests()), [dispatch])
	const shippingRequestsArray = useSelector((state: RootState) => state.shippingRequests)

	useEffect(() => {
		getAllRequests()
	}, [getAllRequests])

	const shippingRequestsList = () =>
		shippingRequestsArray.map(({ id, attributes }: IShippingRequest, index) => (
			<ShippingRequestsItem
				key={id}
				id={id}
				attributes={attributes}
				isOpen={true}
				isLast={shippingRequestsArray.length - 1 === index}
				isEven={index % 2 === 0}
				onClick={() => console.log('click')}
			/>
		))

	return (
		<div>
			<button onClick={getAllRequests}>Fetch new requests</button>
			<Table headers={tableHeaders} componentBody={shippingRequestsList} />
		</div>
	)
}

export default ShippingRequestsContainer
