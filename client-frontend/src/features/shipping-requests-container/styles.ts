import { makeStyles } from '@material-ui/core/styles'
import { fade, lighten } from '@material-ui/core/styles/colorManipulator'

export const useTableStyles = makeStyles(({ palette: { grey, primary, text, common, success, error } }) => ({
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
    backgroundColor: lighten(grey[500], 0.9),
    color: grey[500],
  },
  'chip--enquiry-pending': {
    backgroundColor: lighten(grey[700], 0.9),
    color: grey[700],
  },
  'chip--enquiry-settled': {
    backgroundColor: lighten(grey[900], 0.9),
    color: grey[900],
  },
  'chip--delivery-pending': {
    backgroundColor: lighten(primary.main, 0.9),
    color: primary.main,
  },
  'chip--delivery-confirmed': {
    backgroundColor: lighten(error.main, 0.9),
    color: error.main,
  },
  'chip--delivery-complete': {
    backgroundColor: lighten(success.main, 0.9),
    color: success.main,
  },
}))
