import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import ReduxPromise from 'redux-promise';
import { applyMiddleware, bindActionCreators, createStore } from 'redux';
import { Provider } from 'react-redux'

import rootReducer from './reducers';
import EnhancedPublicApp from './components/PublicApp';

const createStoreWithMiddleware = applyMiddleware(ReduxPromise)(createStore);

ReactDOM.render(
  <Provider store={createStoreWithMiddleware(rootReducer)}>
    <EnhancedPublicApp />
  </Provider>,
  document.querySelector('.company_container')
);
