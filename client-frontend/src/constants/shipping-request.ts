export const SHIPPING_REQUEST_STATUS = {
	idle: 'not requested',
	pendingEnquiry: 'pending',
	delivery: 'delivery in progress',
	deliveryConfirmed: 'awaiting confirmation',
	complete: 'delivery successful',
} as const
