import React, { FC } from 'react'
import { fade, createStyles, Theme, makeStyles } from '@material-ui/core'
import { AppBar, Toolbar, IconButton, Typography, Box, InputBase } from '@material-ui/core'
import {
  AccountCircle as IconAccount,
  Search as IconSearch,
  FilterList as IconFilters,
  PowerSettingsNew as IconOnOff,
} from '@material-ui/icons'
import { BtnPin } from '../btn-pin'
import UserActionsContainer from '../../features/user-actions-container'
import { useAuth } from '../../utils/hooks'

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    buttonLogin: {
      backgroundColor: theme.palette.success.main,
      '&:hover': {
        backgroundColor: theme.palette.success.dark,
      },
    },
    buttonLogout: {
      backgroundColor: theme.palette.error.main,
      '&:hover': {
        backgroundColor: theme.palette.error.dark,
      },
    },
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
  const { user, signOut, signIn } = useAuth()
  const handleClickSwitch = () => {
    user.authorized ? signOut() : signIn()
  }

  return (
    <AppBar>
      <Toolbar>
        <IconButton
          onClick={handleClickSwitch}
          size="small"
          color="inherit"
          className={`${user.authorized ? classes.buttonLogout : classes.buttonLogin}`}
        >
          <IconOnOff />
        </IconButton>

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
          <UserActionsContainer />
        </Box>
      </Toolbar>
    </AppBar>
  )
}
