import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import ReduxPromise from 'redux-promise';
import { applyMiddleware, bindActionCreators, createStore } from 'redux';
import { Provider } from 'react-redux';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import { syncHistoryWithStore } from 'react-router-redux';

import rootReducer from './reducers';
import EnhancedPublicApp from './components/PublicApp';
import EnhancedJobDetail from './components/JobDetail';

const createStoreWithMiddleware = applyMiddleware(ReduxPromise)(createStore);
const store = createStoreWithMiddleware(rootReducer);
const history = syncHistoryWithStore(browserHistory, store);

ReactDOM.render(
  <Provider store={store}>
    <Router history={history}>
      <Route path="/companies/:subdomain" component={EnhancedPublicApp} />
      <Route path="/companies/:subdomain/jobs/:jobId" component={EnhancedJobDetail} />
    </Router>
  </Provider>,
  document.querySelector('.company_container')
);
