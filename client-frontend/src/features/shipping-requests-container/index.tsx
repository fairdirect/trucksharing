import React, { useEffect, useCallback } from 'react'
import { getShippingRequestsSelector } from '../../store/selectors'
import { useDispatch, useSelector } from 'react-redux'
import { IShippingRequest } from './types'
import { fetchShippingRequests } from './action-creators'
import { Table, ShippingRequestsItem } from '../../components'
import { setActiveShippingRequest } from '../../features/active-shipping-request/redux-slice'
import { useTableStyles } from './styles'

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
	const classes = useTableStyles()
	const dispatch = useDispatch()
	const getAllRequests = useCallback(() => {
		dispatch(fetchShippingRequests())
	}, [dispatch])
	const shippingRequests: IShippingRequest[] = useSelector(getShippingRequestsSelector)
	const handleItemClick = (id: string) => {
		dispatch(setActiveShippingRequest(id))
	}

	useEffect(() => {
		getAllRequests()
	}, [])

	const shippingRequestsList = shippingRequests.map(({ id, attributes }: IShippingRequest, index) => (
		<ShippingRequestsItem
			key={id}
			id={id}
			attributes={attributes}
			isLast={shippingRequests.length - 1 === index}
			isEven={index % 2 === 0}
			onClick={handleItemClick}
			classes={classes}
		/>
	))

	return (
		<>
			<button onClick={getAllRequests}>Fetch new requests</button>
			<Table headers={tableHeaders}>{shippingRequestsList}</Table>
		</>
	)
}

export default ShippingRequestsContainer
