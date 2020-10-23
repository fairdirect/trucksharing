import { makeStyles } from '@material-ui/core/styles'
import { fade } from '@material-ui/core/styles/colorManipulator'

export const useTableStyles = makeStyles(({ palette: { primary, text, common } }) => ({
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
	openIcon: {
		color: primary.main,
	},
	chip: {
		borderRadius: '12px',
	},
	'chip--idle': {
		backgroundColor: 'rgba(158, 158, 158, 0.15)',
		color: '#9E9E9E',
	},
	'chip--pendingEnquiry': {
		backgroundColor: 'rgba(98, 0, 234, 0.15)',
		color: '#6200EA',
	},
	'chip--delivery': {
		backgroundColor: 'rgba(106, 137, 204, 0.1)',
		color: '#6A89CC',
	},
	'chip--delivery-confirmed': {
		backgroundColor: 'rgba(230, 126, 34, 0.15)',
		color: '#E67E22',
	},
	'chip--complete': {
		backgroundColor: 'rgba(39, 174, 96, 0.15)',
		color: '#20BF6B',
	},
}))
