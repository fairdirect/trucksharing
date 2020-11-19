import './routes'
import { ROUTES } from './routes'

export const USER_ROLE = {
  RECIPIENT: 'recipient',
  AGENT: 'agent',
  VISITOR: 'visitor',
} as const

export const USER_ACCESS = {
  recipient: Object.values(ROUTES.RECIPIENT),
  agent: Object.values(ROUTES.RECIPIENT),
  visitor: Object.values(ROUTES.VISITOR),
} as const
