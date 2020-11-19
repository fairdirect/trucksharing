import React, { useState, useContext, createContext } from 'react'
import { useHistory } from 'react-router-dom'
import { useSelector } from 'react-redux'
import { Add as IconAdd, Done as IconDone, Clear as IconCancel, Phone as IconContact, LocalShipping as IconTruck } from '@material-ui/icons'
import { BtnPin } from '../../components'
import { getActiveRequestDetailsSelector } from '../../store/recipient-selectors'
import { ROUTES, SHIPPING_REQUEST_STATUS } from '../../constants'

const ActionsContainerContext = createContext({} as any)

const TriggerEnquiryPlanner = () => {
  // TODO: Add useCallback to functions passed as props or context
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
      <IconTruck />
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

const CreateEnquiry = () => {
  const handleClick = () => {
    console.log('Show contact details')
  }

  return (
    <BtnPin onClick={handleClick}>
      <IconAdd />
    </BtnPin>
  )
}

const ShippingRequestActions = () => {
  const { IDLE, ENQUIRY_PENDING, ENQUIRY_SETTLED, DELIVERY_CONFIRMED, DELIVERY_PENDING, DELIVERY_COMPLETE } = SHIPPING_REQUEST_STATUS
  const { shippingRequestStatus } = useContext(ActionsContainerContext)

  switch (shippingRequestStatus) {
    case IDLE:
      return <TriggerEnquiryPlanner />
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

const EnquiryActions = () => {
  const { shippingRequestStatus } = useContext(ActionsContainerContext)

  if (shippingRequestStatus !== SHIPPING_REQUEST_STATUS.IDLE) return <ContactDetails />

  return (
    <>
      <ContactDetails />
      <CreateEnquiry />
    </>
  )
}

export const ActionsRecipient = () => {
  const [enquiryPlanner, setEnquiryPlanner] = useState(false)
  const shippingRequest = useSelector(getActiveRequestDetailsSelector)
  const shippingRequestStatus = shippingRequest?.attributes.status

  return (
    <ActionsContainerContext.Provider
      value={{
        shippingRequestStatus: shippingRequestStatus,
        shippingRequest: shippingRequest,
        callback: setEnquiryPlanner,
      }}
    >
      {enquiryPlanner ? <EnquiryActions /> : <ShippingRequestActions />}
      {}
    </ActionsContainerContext.Provider>
  )
}
