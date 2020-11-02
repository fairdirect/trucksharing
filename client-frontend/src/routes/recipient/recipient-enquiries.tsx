import React from 'react'
import { useSelector } from 'react-redux'
import { fade, createStyles, Theme, makeStyles } from '@material-ui/core'
import { Table } from '../../components'
import { getActiveShippingSelector, getShippingRequestsSelector } from '../../store/selectors'
import { Box, Breadcrumbs, Link, Typography, TableRow, TableCell } from '@material-ui/core'
import { Link as RouterLink } from 'react-router-dom'

const useStyles = makeStyles((theme: Theme) =>
	createStyles({
		link: {
			display: 'inline-flex',
			alignItems: 'center',
		},
		details: {
			backgroundColor: fade(theme.palette.primary.dark, 0.03),
		},
		borderless: {
			borderBottom: 'none',
		},
		header: {
			fontWeight: 700,
			color: theme.palette.primary.main,
			marginBottom: theme.spacing(2),
		},
	}),
)

const tableHeaders = [
	'Order number (ID)',
	'From',
	'To',
	'Cargo type',
	'Cargo volume',
	'Weight',
	'Unloading device',
	'Delivery deadline',
]

export const RecipientEnquiries = () => {
	const classes = useStyles()
	const activeShippingRequestId: string = useSelector(getActiveShippingSelector)
	const { attributes } = useSelector(getShippingRequestsSelector).filter(
		(request) => request.id === activeShippingRequestId,
	)[0]

	return (
		<>
			<Box mb={3}>
				<Breadcrumbs>
					<Link className={classes.link} component={RouterLink} to="/recipient/shipping-requests">
						Shipping requests
					</Link>

					<Typography>ID: {attributes.order_number}</Typography>
				</Breadcrumbs>
			</Box>

			<Table headers={tableHeaders}>
				<TableRow className={classes.details}>
					<TableCell className={`${classes.borderless}`}>{attributes.order_number}</TableCell>

					<TableCell className={`${classes.borderless}`}>
						{attributes.pickup_street} {attributes.pickup_house}, {attributes.pickup_zip} {attributes.pickup_city}
					</TableCell>

					<TableCell className={`${classes.borderless}`}>
						{attributes.delivery_street} {attributes.delivery_house}, {attributes.delivery_zip}{' '}
						{attributes.delivery_city}
					</TableCell>

					<TableCell className={`${classes.borderless}`}>-</TableCell>

					<TableCell className={`${classes.borderless}`}>-</TableCell>

					<TableCell className={`${classes.borderless}`}>{attributes.weight}</TableCell>

					<TableCell className={`${classes.borderless}`}>-</TableCell>

					<TableCell className={`${classes.borderless}`}>{attributes.delivery_deadline}</TableCell>
				</TableRow>
			</Table>

			<Box my={4}>
				<Typography className={classes.header} variant="h1">
					Browser available routes
				</Typography>
			</Box>
		</>
	)
}
