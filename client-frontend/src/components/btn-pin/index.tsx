import React, { FC } from 'react'
import { createStyles, makeStyles, Theme, darken } from '@material-ui/core/styles'
import { IconButton } from '@material-ui/core'
import { Link } from 'react-router-dom'
import { IBtnPin } from './types'

const useStyles = makeStyles((theme: Theme) =>
	createStyles({
		default: {
			color: '#fff',
			backgroundColor: theme.palette.secondary.main,
			transition: 'background 0.3s ease',
			padding: theme.spacing(1),
			'&:hover': {
				backgroundColor: darken(theme.palette.secondary.main, 0.15),
			},
			'&.Mui-disabled': {
				backgroundColor: theme.palette.secondary.main,
				color: 'inherit',
				opacity: 0.6,
			},
		},
	}),
)

export const BtnPin: FC<IBtnPin> = ({ children, disabled, to, theme = 'default' }) => {
	const classes: { [key: string]: string } = useStyles()
	const component = to ? Link : 'button'

	return (
		<IconButton disabled={disabled} component={component} to={to} className={classes[theme]}>
			{children}
		</IconButton>
	)
}
