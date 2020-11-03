import React from 'react'
import { useSelector } from 'react-redux'
import { withRouter } from 'react-router'
import { getActiveRequestDetailsSelector } from '../../store/recipient-selectors'
import { getUserInfo } from '../../store/selectors'

const UserActionsContainer = () => {
  const requestDetails = useSelector(getActiveRequestDetailsSelector)

  return <div>Actions</div>
}

export default UserActionsContainer
