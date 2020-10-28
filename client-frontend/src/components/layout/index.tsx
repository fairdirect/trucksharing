import React, { FunctionComponent } from 'react'
import { theme } from './mui-theme'
import { ThemeProvider } from '@material-ui/core/styles'
import { CssBaseline, AppBar, Toolbar, IconButton, Typography, Box } from '@material-ui/core'
import AccountIcon from '@material-ui/icons/AccountCircle'
import { Link } from 'react-router-dom'

// TODO: Add React Helmet to head scripts
export const Layout: FunctionComponent = ({ children }) => {
	return (
		<ThemeProvider theme={theme}>
			<CssBaseline />
			<AppBar>
				<Toolbar>
					<IconButton color="inherit">
						<AccountIcon />
					</IconButton>

					{/* TODO: Add dynaminc route name */}
					<Typography>Route name</Typography>

					<Box ml="auto">
						<Link to="/recipient/shipping-requests">requests</Link>
						<Link to="/recipient/shipping-requests/1/enquiries">planner</Link>
					</Box>
				</Toolbar>
			</AppBar>

			<Box my={12} mx={4}>
				{children}
			</Box>
		</ThemeProvider>
	)
}
