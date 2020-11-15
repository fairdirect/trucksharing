import React, { FunctionComponent, useMemo } from 'react'
import { SHIPPING_REQUEST_STATUS } from '../../constants'
import Chip from '@material-ui/core/Chip'

export const StatusChip: FunctionComponent<{ label: string; classes: { [key: string]: string } }> = React.memo(({ label, classes }) => {
  const values: Array<string> = Object.values(SHIPPING_REQUEST_STATUS)

  if (!values.includes(label)) console.error('Unknown shipping request status.')

  const index: number = values.findIndex((el) => el === label)
  const currentStatus: string = Object.keys(SHIPPING_REQUEST_STATUS)[index]
  const variant: string = useMemo(() => currentStatus.toLowerCase().replace('_', '-'), [currentStatus])
  const className = classes[`chip--${variant}` as keyof typeof classes]
  return <Chip className={`${classes.chip} ${className}`} label={label} />
})
