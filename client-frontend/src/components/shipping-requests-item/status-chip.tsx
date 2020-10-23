import React, { FunctionComponent } from 'react'
import { SHIPPING_REQUEST_STATUS } from '../../constants'
import Chip from '@material-ui/core/Chip'

export const StatusChip: FunctionComponent<{ label: string; classes: { [key: string]: string } }> = React.memo(
	({ label, classes }) => {
		const values: Array<string> = Object.values(SHIPPING_REQUEST_STATUS)

		if (!values.includes(label)) console.error('Unknown shipping request status.')

		const index: number = values.findIndex((el) => el === label)
		const className = classes[`chip--${Object.keys(SHIPPING_REQUEST_STATUS)[index]}` as keyof typeof classes]
		return <Chip className={`${classes.chip} ${className}`} label={label} />
	},
)
