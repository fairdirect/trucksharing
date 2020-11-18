import React from 'react'
import { useSelector } from 'react-redux'
import { fade, createStyles, Theme, makeStyles } from '@material-ui/core'
import { Table } from '../../components'
import { getActiveRequestDetailsSelector } from '../../store/recipient-selectors'
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

const tableHeaders = ['Order number (ID)', 'From', 'To', 'Cargo type', 'Cargo volume', 'Weight', 'Unloading device', 'Delivery deadline']
// const tableRouteHeaders = ['Date', 'From', 'To', 'Stops', 'Space', 'Weight', 'Unloading device', 'Company', 'Price', 'Status']

export const RecipientEnquiries = () => {
  const classes = useStyles()
  const requestDetails = useSelector(getActiveRequestDetailsSelector)
  const attributes = requestDetails?.attributes
  const defaultValue = '-'

  return (
    <>
      <Box mb={3}>
        <Breadcrumbs>
          <Link className={classes.link} component={RouterLink} to="/recipient/shipping-requests">
            Shipping requests
          </Link>

          <Typography>ID: {attributes?.order_number || defaultValue}</Typography>
        </Breadcrumbs>
      </Box>

      <Table headers={tableHeaders}>
        <TableRow className={classes.details}>
          <TableCell className={`${classes.borderless}`}>{attributes?.order_number || defaultValue}</TableCell>

          <TableCell className={`${classes.borderless}`}>
            {attributes?.pickup_street || defaultValue} {attributes?.pickup_house}, {attributes?.pickup_zip || defaultValue}{' '}
            {attributes?.pickup_city}
          </TableCell>

          <TableCell className={`${classes.borderless}`}>
            {attributes?.delivery_street} {attributes?.delivery_house || defaultValue}, {attributes?.delivery_zip || defaultValue}
            {attributes?.delivery_city}
          </TableCell>

          <TableCell className={`${classes.borderless}`}>-</TableCell>

          <TableCell className={`${classes.borderless}`}>-</TableCell>

          <TableCell className={`${classes.borderless}`}>{attributes?.weight || defaultValue}</TableCell>

          <TableCell className={`${classes.borderless}`}>-</TableCell>

          <TableCell className={`${classes.borderless}`}>{attributes?.delivery_deadline || defaultValue}</TableCell>
        </TableRow>
      </Table>

      <Box my={4}>
        <Typography className={classes.header} variant="h1">
          Browse available routes
        </Typography>
      </Box>
    </>
  )
}
