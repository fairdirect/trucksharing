import React, { FunctionComponent, useMemo } from 'react'
import { makeStyles } from '@material-ui/core/styles'
import { fade } from '@material-ui/core/styles/colorManipulator'
import { KeyboardArrowUp, KeyboardArrowDown } from '@material-ui/icons'
import { Grid, IconButton, Box, Collapse, TextField, TableRow, TableCell, Typography } from '@material-ui/core'

type Attribute = string | number

interface IShippingRequestItem {
	id: string
	attributes: {
		[key: string]: Attribute
	}
	isOpen: boolean
	isLast: boolean
	isEven: boolean
	onClick: Function
}

const useStyles = makeStyles(({ palette: { primary, text, common } }) => ({
	head: {
		cursor: 'pointer',
	},
	columnHeadLast: {
		textAlign: 'right',
	},
	even: {
		backgroundColor: fade(primary.dark, 0.03),
	},
	lastRowContent: {
		'& > td.MuiTableCell-root': {
			borderBottom: 'none',
		},
	},
	borderless: {
		borderBottom: 'none',
	},
	wrapper: {
		paddingTop: 0,
		paddingBottom: 0,
	},
	columnHead: {
		color: primary.main,
		fontWeight: 700,
		marginBottom: '20px',
	},
	detailsWrapper: {
		display: 'flex',
		flexDirection: 'column',
		'&:nth-child(odd)': {
			paddingRight: '8px',
		},
		'&:nth-child(even)': {
			paddingLeft: '8px',
		},
	},
	detail: {
		marginBottom: '16px',
		width: '100%',
		'& .MuiInputBase-root': {
			backgroundColor: fade(primary.dark, 0.06),
		},
		'& .MuiFormLabel-root': {
			color: text.secondary,
		},
		'& .MuiFilledInput-underline:before': {
			borderBottomColor: fade(common.black, 0.38),
			borderBottomStyle: 'solid',
		},
		'& .MuiInputBase-input': {
			color: text.primary,
		},
	},
	active: {
		// backgroundColor: fade(primary.dark, 0.06),
	},
}))

const capitalize = (string: string) => string.slice(0, 1).toUpperCase() + string.substr(1)

const Details: FunctionComponent<{ [key: string]: any }> = ({ collection }) => {
	const { detail } = useStyles()
	return (
		<>
			{Object.values(collection).map((value, index) => (
				<TextField
					key={index}
					className={detail}
					label={capitalize(Object.keys(collection)[index])}
					variant="filled"
					disabled={true}
					value={value}
				/>
			))}
		</>
	)
}

export const ShippingRequestsItem: FunctionComponent<IShippingRequestItem> = ({
	id,
	attributes,
	isOpen,
	onClick,
	isLast,
	isEven,
}) => {
	const {
		columnHeadLast,
		head,
		borderless,
		wrapper,
		lastRowContent,
		even,
		columnHead,
		active,
		detailsWrapper,
	} = useStyles()
	// TODO: Connect with redux store, dispatch proper action
	const handleClick = () => console.log('open')
	const requestEnum = {
		status: attributes.status,
		date: attributes.donation_date,
		number: attributes.order_number,
		type: '-',
		volume: '-',
		weight: attributes.weight,
		unloadingDevice: '-',
		deadline: '-',
		toggle: <IconButton size="small">{isOpen ? <KeyboardArrowUp /> : <KeyboardArrowDown />}</IconButton>,
	}
	const colSpan = Object.keys(requestEnum).length

	const { pickup, delivery } = {
		pickup: {
			name: attributes.pickup_company_name,
			address: `${attributes.pickup_street} ${attributes.pickup_house}, ${attributes.pickup_zip} ${attributes.pickup_city}, ${attributes.pickup_country}`,
		},
		delivery: {
			name: attributes.delivery_company_name,
			address: `${attributes.delivery_street} ${attributes.delivery_house}, ${attributes.delivery_zip} ${attributes.delivery_city}, ${attributes.delivery_country}`,
		},
	}

	return (
		<>
			<TableRow onClick={handleClick} className={`${head} ${isEven && even} ${isOpen && active}`}>
				{/* FIXME: Add missing attributes, once included in API */}
				{Object.values(requestEnum).map((prop, index) => (
					<TableCell key={index} className={`${borderless} ${index === colSpan && columnHeadLast}`}>
						{prop}
					</TableCell>
				))}
			</TableRow>

			<TableRow className={`${isLast && lastRowContent} ${isEven && even} ${isOpen && active}`}>
				<TableCell colSpan={colSpan} className={wrapper}>
					<Collapse in={isOpen} timeout="auto" unmountOnExit>
						<Box paddingBottom={2}>
							<Grid container>
								<Grid item xs={6} className={detailsWrapper}>
									<Typography className={columnHead} variant="h2" component="p">
										Consignor details
									</Typography>
									<Details collection={pickup} />
								</Grid>
								<Grid item xs={6} className={detailsWrapper}>
									<Typography className={columnHead} variant="h2" component="p">
										Recipient details
									</Typography>
									<Details collection={delivery} />
								</Grid>
							</Grid>
						</Box>
					</Collapse>
				</TableCell>
			</TableRow>
		</>
	)
}
