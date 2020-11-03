import React, { FC } from 'react'
import { useSelector } from 'react-redux'
import { getActiveShippingSelector } from '../../store/recipient-selectors'
import { fade, createStyles, Theme, makeStyles } from '@material-ui/core'
import { AppBar, Toolbar, IconButton, Typography, Box, InputBase } from '@material-ui/core'
import { AccountCircle as IconAccount, Search as IconSearch, FilterList as IconFilters, Add as IconAdd } from '@material-ui/icons'
import { Link } from 'react-router-dom'
import { BtnPin } from '../btn-pin'

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    search: {
      position: 'relative',
      alignItems: 'center',
      borderRadius: theme.shape.borderRadius,
      transition: 'background-color 0.3s ease',
      '&:hover': {
        backgroundColor: fade(theme.palette.common.white, 0.25),
      },
      paddingRight: theme.spacing(1),
      marginRight: theme.spacing(2),
      marginLeft: 0,
      width: '100%',
      [theme.breakpoints.up('sm')]: {
        marginLeft: theme.spacing(3),
        width: 'auto',
      },
      display: 'inline-flex',
    },
    searchIcon: {
      padding: theme.spacing(0, 1),
      height: '100%',
      // position: 'absolute',
      pointerEvents: 'none',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
    },
    inputRoot: {
      color: 'inherit',
    },
    inputInput: {
      padding: theme.spacing(1, 1, 1, 0),
      // vertical padding + font size from searchIcon
      borderBottom: '1px solid #fff',
      marginBottom: theme.spacing(1),
      paddingBottom: theme.spacing(0.5),
      transition: theme.transitions.create('width'),
      width: '100%',
      [theme.breakpoints.up('md')]: {
        width: '20ch',
      },
      '&::placeholder': {
        color: '#fff',
      },
    },
  }),
)

export const PrimaryBar: FC = () => {
  const classes = useStyles()
  const activeShippingRequestId: string = useSelector(getActiveShippingSelector)
  const isRequestSelected = Boolean(activeShippingRequestId)

  return (
    <AppBar>
      <Toolbar>
        <IconButton color="inherit">
          <IconAccount />
        </IconButton>

        {/* TODO: Add dynaminc route name */}
        <Typography>Route name</Typography>

        <Box flexGrow="1" justifyContent="center" alignItems="center" display="flex">
          <div className={classes.search}>
            <div className={classes.searchIcon}>
              <IconSearch />
            </div>
            <InputBase
              placeholder="Search…"
              classes={{
                root: classes.inputRoot,
                input: classes.inputInput,
              }}
              inputProps={{ 'aria-label': 'search' }}
            />
          </div>

          <BtnPin>
            <IconFilters />
          </BtnPin>
        </Box>

        <Box ml="auto">
          <Link to="/recipient/shipping-requests">requests</Link>
          <BtnPin disabled={!isRequestSelected} to={`/recipient/shipping-requests/${activeShippingRequestId}/enquiries`}>
            <IconAdd />
          </BtnPin>
        </Box>
      </Toolbar>
    </AppBar>
  )
}
