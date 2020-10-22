import React, { useEffect, useCallback } from 'react'
import { getShippingRequestsSelector, getActiveShippingSelector } from './selectors'
import { useDispatch, useSelector } from 'react-redux'
import { IShippingRequest } from './types'
import { fetchShippingRequests } from './action-creators'
import { Table, ShippingRequestsItem } from '../../components'
import { setActiveShippingRequest } from '../../features/active-shipping-request/redux-slice'

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
	const getAllRequests = useCallback(() => {
		dispatch(fetchShippingRequests())
	}, [dispatch])
	const shippingRequests: IShippingRequest[] = useSelector(getShippingRequestsSelector)
	const activeShippingRequest: Partial<IShippingRequest> = useSelector(getActiveShippingSelector)
	const onItemClickCallback = (request: IShippingRequest) => dispatch(setActiveShippingRequest(request))

	useEffect(() => {
		getAllRequests()
	}, [getAllRequests])

	const shippingRequestsList = () =>
		shippingRequests.map(({ id, attributes }: IShippingRequest, index) => (
			<ShippingRequestsItem
				key={id}
				id={id}
				attributes={attributes}
				isOpen={id === activeShippingRequest.id}
				isLast={shippingRequests.length - 1 === index}
				isEven={index % 2 === 0}
				onClick={onItemClickCallback}
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
