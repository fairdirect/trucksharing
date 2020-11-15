import React, { FC } from 'react'
import { createStyles, makeStyles, Theme } from '@material-ui/core/styles'
import { IconButton } from '@material-ui/core'
import { IBtnPin } from './types'

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    shared: {
      transition: 'background 0.3s ease',
      padding: theme.spacing(1),
      '&.Mui-disabled': {
        color: 'inherit',
        opacity: 0.6,
      },
    },
    secondary: {
      color: theme.palette.secondary.contrastText,
      backgroundColor: theme.palette.secondary.main,
      '&:hover': {
        backgroundColor: theme.palette.secondary.dark,
      },
      '&.Mui-disabled': {
        backgroundColor: theme.palette.secondary.main,
      },
    },
    success: {
      color: theme.palette.secondary.contrastText,
      backgroundColor: theme.palette.success.main,
      '&:hover': {
        backgroundColor: theme.palette.success.dark,
      },
      '&.Mui-disabled': {
        backgroundColor: theme.palette.success.main,
      },
    },
    error: {
      color: theme.palette.secondary.contrastText,
      backgroundColor: theme.palette.error.main,
      '&:hover': {
        backgroundColor: theme.palette.error.dark,
      },
      '&.Mui-disabled': {
        backgroundColor: theme.palette.error.main,
      },
    },
  }),
)

export const BtnPin: FC<IBtnPin> = ({ children, disabled, theme = 'secondary', onClick }) => {
  const classes: { [key: string]: string } = useStyles()

  return (
    <IconButton disabled={disabled} component="button" className={`${classes.shared} ${classes[theme]}`} onClick={onClick}>
      {children}
    </IconButton>
  )
}
