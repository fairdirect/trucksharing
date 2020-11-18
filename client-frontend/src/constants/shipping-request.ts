export const SHIPPING_REQUEST_STATUS = {
  IDLE: 'not requested', //= > recipient request was fetch from openfoodbank.net and awaits to be assigned
  ENQUIRY_PENDING: 'pending enquiry', //= > recipient triggered enquiry planner and sent a transport request to service provider agent
  ENQUIRY_SETTLED: 'enquiry settled', //= > agent agreed, they have agreement
  DELIVERY_PENDING: 'pending delivery', //= > agent is delivering it as we speak
  DELIVERY_CONFIRMED: 'confirm success', //= > agent claims the package was delivered
  DELIVERY_COMPLETE: 'delivery successful', //= > recipient confirms everything is fine, and the package was delivered successfuly
} as const

export const SHIPPING_REQUEST_ROUTE_STATUS = {
  AVAILABLE: 'available',
  NOT_AVAILABLE: 'unavailable',
  ENQUIRY_PENDING: 'pending enquiry',
  ENQUIRY_REJECTED: 'enquiry rejected',
  ENQUIRY_SETTLED: 'enquiry settled',
} as const
