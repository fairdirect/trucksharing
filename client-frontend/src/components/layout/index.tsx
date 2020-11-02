import React, { FC } from 'react'
import { theme } from './mui-theme'
import { ThemeProvider } from '@material-ui/core/styles'
import { CssBaseline, Box } from '@material-ui/core'
import { PrimaryBar } from '../primary-bar'

// TODO: Add React Helmet to head scripts
export const Layout: FC = ({ children }) => {
	return (
		<ThemeProvider theme={theme}>
			<CssBaseline />
			<PrimaryBar />

			<Box my={12} mx={4}>
				{children}
			</Box>
		</ThemeProvider>
	)
}
