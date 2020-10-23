import React, { FunctionComponent } from 'react'
import { IShippingRequestItem, INestedStringObj } from './types'
import { getActiveShippingSelector } from '../../store/selectors'

import { useSelector } from 'react-redux'
import { KeyboardArrowUp, KeyboardArrowDown } from '@material-ui/icons'
import { Grid, IconButton, Box, Collapse, TextField, TableRow, TableCell, Typography } from '@material-ui/core'
import { capitalize } from '../../utils/string'
import { StatusChip } from './status-chip'

const DetailsList: FunctionComponent<INestedStringObj> = ({ collection, className }) => (
	<>
		{Object.entries(collection).map(([key, value], index) => (
			<TextField key={index} className={className} label={capitalize(key)} variant="filled" disabled value={value} />
		))}
	</>
)

export const ShippingRequestsItem: FunctionComponent<IShippingRequestItem> = ({
	id,
	attributes,
	onClick,
	isLast,
	isEven,
	classes,
}) => {
	// TODO: Connect with redux store, dispatch proper action
	const handleClick = () => onClick(id)
	const activeShippingRequestId: string = useSelector(getActiveShippingSelector)
	const isOpen = activeShippingRequestId === id
	const request = {
		status: <StatusChip label={attributes.status as string} classes={classes} />,
		date: attributes.donation_date,
		number: attributes.order_number,
		type: '-',
		volume: '-',
		weight: attributes.weight,
		unloadingDevice: '-',
		deadline: attributes.delivery_deadline,
		toggle: (
			<IconButton className={classes.openIcon} size="small">
				{isOpen ? <KeyboardArrowUp /> : <KeyboardArrowDown />}
			</IconButton>
		),
	}
	const colSpan = Object.keys(request).length

	const { pickup, delivery } = {
		pickup: {
			name: `${attributes.pickup_company_name}`,
			address: `${attributes.pickup_street} ${attributes.pickup_house}, ${attributes.pickup_zip} ${attributes.pickup_city}, ${attributes.pickup_country}`,
		},
		delivery: {
			name: `${attributes.delivery_company_name}`,
			address: `${attributes.delivery_street} ${attributes.delivery_house}, ${attributes.delivery_zip} ${attributes.delivery_city}, ${attributes.delivery_country}`,
		},
	}

	return (
		<>
			<TableRow
				onClick={handleClick}
				className={`${classes.head} ${isEven && classes.even} ${isOpen && classes.active}`}
			>
				{/* FIXME: Add missing attributes, once included in API */}
				{Object.values(request).map((prop, index) => (
					<TableCell key={index} className={`${classes.borderless} ${index === colSpan && classes.columnHeadLast}`}>
						{prop}
					</TableCell>
				))}
			</TableRow>

			<TableRow className={`${isLast && classes.lastRowContent} ${isEven && classes.even} ${isOpen && classes.active}`}>
				<TableCell colSpan={colSpan} className={classes.wrapper}>
					<Collapse in={isOpen} timeout="auto" unmountOnExit>
						<Box paddingBottom={2}>
							<Grid container>
								<Grid item xs={6} className={classes.detailsWrapper}>
									<Typography className={classes.columnHead} variant="h2" component="p">
										Consignor details
									</Typography>
									<DetailsList collection={pickup} className={classes.detail} />
								</Grid>
								<Grid item xs={6} className={classes.detailsWrapper}>
									<Typography className={classes.columnHead} variant="h2" component="p">
										Recipient details
									</Typography>
									<DetailsList collection={delivery} className={classes.detail} />
								</Grid>
							</Grid>
						</Box>
					</Collapse>
				</TableCell>
			</TableRow>
		</>
	)
}
