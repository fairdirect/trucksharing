import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { BrowserRouter as Router } from 'react-router-dom'
import { ProvideAuth } from './utils/hooks'

import store from './store'

const render = () => {
  const App = require('./features/app').default

  ReactDOM.render(
    <Provider store={store}>
      <ProvideAuth>
        <Router basename="transport">
          <App />
        </Router>
      </ProvideAuth>
    </Provider>,
    document.getElementById('root'),
  )
}

render()

if (process.env.NODE_ENV === 'development' && module.hot) {
  module.hot.accept('./features/app', render)
}
