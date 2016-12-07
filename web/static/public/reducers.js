import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';

const companiesReducer = (state = [], action) => {
  switch (action.type) {
    case 'FETCH_COMPANY':
      return [action.payload.data, ...state];
    default:
      return state;
  }
}

const resumesReducer = (state = [], action) => {
  switch (action.type) {
    case 'SUBMIT_RESUME':
      return [action.payload.data, ...state];
    default:
      return state;
  }
}

const rootReducer = combineReducers({
  companies: companiesReducer,
  resumes: resumesReducer,
  routing: routerReducer
});

export default rootReducer;
