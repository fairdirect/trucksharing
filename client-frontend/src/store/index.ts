import { configureStore } from '@reduxjs/toolkit'
import rootReducer from './root-reducer'

export const store = configureStore({
	reducer: rootReducer,
})

if (process.env.NODE_ENV === 'development' && module.hot) {
	module.hot.accept('./root-reducer', () => {
		// FIXME: Find a way to improve the code later on
		// eslint-disable-next-line global-require
		const newRootReducer = require('./root-reducer').default
		store.replaceReducer(newRootReducer)
	})
}

export default store
