import { createMuiTheme } from '@material-ui/core/styles'
import { fade } from '@material-ui/core/styles/colorManipulator'

export const theme = createMuiTheme({
	palette: {
		primary: {
			main: '#1E3799',
			dark: '#1F3A93',
		},
		secondary: {
			main: '#6A89CC',
		},
		text: {
			secondary: fade('#000000', 0.6),
		},
	},
	typography: {
		h1: {
			fontSize: '24px',
			lineHeight: '34px',
		},
		h2: {
			fontSize: '20px',
			lineHeight: '32px',
		},
		h6: {
			fontSize: '12px',
			lineHeight: '22px',
		},
		body1: {
			fontSize: '16px',
			lineHeight: '20px',
		},
		body2: {
			fontSize: '14px',
			lineHeight: '22px',
		},
	},
})
