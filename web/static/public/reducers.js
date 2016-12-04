import { combineReducers } from 'redux';

const companiesReducer = (state = [], action) => {
  switch (action.type) {
    case 'FETCH_COMPANY':
      return [action.payload.data, ...state];
    default:
      return state;
  }
}

const rootReducer = combineReducers({
  companies: companiesReducer
});

export default rootReducer;
