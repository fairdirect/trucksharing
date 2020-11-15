import React, { useState, useContext, createContext } from 'react'
import { useHistory } from 'react-router-dom'
import { useSelector } from 'react-redux'
import { Add as IconAdd, Done as IconDone, Clear as IconCancel, Phone as IconContact } from '@material-ui/icons'
import { BtnPin } from '../../components'
import { getActiveRequestDetailsSelector } from '../../store/recipient-selectors'
import { ROUTES, SHIPPING_REQUEST_STATUS } from '../../constants'

const ActionsContainerContext = createContext({} as any)

const CreateEnquiry = () => {
  const history = useHistory()
  const {
    shippingRequest: { id },
    callback,
  } = useContext(ActionsContainerContext)
  const enquiryUrl = id && ROUTES.RECIPIENT.ENQUIRY_PLANNER.replace(':shippingRequestId', id)
  const handleClick = () => {
    enquiryUrl && history.push(enquiryUrl)
    callback(true)
  }

  return (
    <BtnPin disabled={!Boolean(enquiryUrl)} onClick={handleClick}>
      <IconAdd />
    </BtnPin>
  )
}

const CancelEnquiry = () => {
  const handleClick = () => {
    console.log('Perform cancel enquiry action')
  }

  return (
    <BtnPin onClick={handleClick} theme="error">
      <IconCancel />
    </BtnPin>
  )
}

const ConfirmDelivery = () => {
  const handleClick = () => {
    console.log('Confirm delivery')
  }

  return (
    <BtnPin onClick={handleClick} theme="success">
      <IconDone />
    </BtnPin>
  )
}

const ContactDetails = () => {
  const handleClick = () => {
    console.log('Show contact details')
  }

  return (
    <BtnPin onClick={handleClick}>
      <IconContact />
    </BtnPin>
  )
}

export const ActionsRecipient = () => {
  const [enquiryPlanner, setEnquiryPlanner] = useState(false)
  const shippingRequest = useSelector(getActiveRequestDetailsSelector)
  const shippingRequestStatus = shippingRequest?.attributes.status
  const { IDLE, ENQUIRY_PENDING, ENQUIRY_SETTLED, DELIVERY_CONFIRMED, DELIVERY_PENDING, DELIVERY_COMPLETE } = SHIPPING_REQUEST_STATUS

  const ShippingRequestActions = () => {
    switch (shippingRequestStatus) {
      case IDLE:
        return <CreateEnquiry />
      case ENQUIRY_PENDING:
      case ENQUIRY_SETTLED:
        return <CancelEnquiry />
      case DELIVERY_COMPLETE:
      case DELIVERY_PENDING:
        return <ContactDetails />
      case DELIVERY_CONFIRMED:
        return <ConfirmDelivery />
    }

    return null
  }

  return (
    <ActionsContainerContext.Provider
      value={{
        shippingRequest: shippingRequest,
        callback: setEnquiryPlanner,
      }}
    >
      {!enquiryPlanner && <ShippingRequestActions />}
    </ActionsContainerContext.Provider>
  )
}
