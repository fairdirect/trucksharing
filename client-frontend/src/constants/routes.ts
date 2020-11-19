export const ROUTES = {
  RECIPIENT: {
    SHIPPING_REQUESTS: '/recipient/shipping-requests',
    ENQUIRY_PLANNER: '/recipient/create-enquiry/:shippingRequestId',
  },
  AGENT: {
    ROUTES_LIST: '/agent/routes',
    FREIGHT_BILLS: '/agent/freight-bills',
    TRANSPORT_ORDERS: '/agent/transport-orders',
  },
  VISITOR: {
    ROOT: '/',
  },
} as const
