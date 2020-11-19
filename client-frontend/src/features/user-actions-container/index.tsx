import React from 'react'
import { USER_ROLE } from '../../constants'
import { ActionsRecipient } from './actions-recipient'

const UserActionsContainer = () => {
  // FIXME: Replace with real context data
  const isRecipient = USER_ROLE.RECIPIENT === 'recipient'
  // const isAgent = USER_ROLE.AGENT === role

  return (
    <>
      {isRecipient && <ActionsRecipient />}
      {/* {isAgent && <p>Agent actions</p>} */}
    </>
  )
}

export default UserActionsContainer
