export const ROUTES = {
  RECIPIENT: {
    SHIPPING_REQUESTS: '/recipient/shipping-requests',
    ENQUIRY_PLANNER: '/recipient/create-enquiry/:shippingRequestId',
  },
  AGENT: {
    ROUTES: '/agent/routes',
    FREIGHT_BILLS: '/agent/freight-bills',
    TRANSPORT_ORDERS: '/agent/transport-orders',
  },
} as const