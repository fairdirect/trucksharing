import React from 'react'
import { useSelector } from 'react-redux'
import { USER_ROLE } from '../../constants'
import { getUserInfo } from '../../store/selectors'
import { ActionsRecipient } from './actions-recipient'

const UserActionsContainer = () => {
  const { role } = useSelector(getUserInfo)
  const isRecipient = USER_ROLE.RECIPIENT === role
  const isAgent = USER_ROLE.AGENT === role

  return (
    <>
      {isRecipient && <ActionsRecipient />}
      {isAgent && <p>Agent actions</p>}
    </>
  )
}

export default UserActionsContainer
