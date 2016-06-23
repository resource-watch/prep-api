import { DATA_DASHBOARD_RECEIVED } from '../constants';

const initialState = {
  list: [],
  detail: {}
};

export default function (state = initialState, action) {
  switch (action.type) {
    case DATA_DASHBOARD_RECEIVED: {
      const obj = {};
      obj[action.payload.data.slug] = action.payload.data;
      return Object.assign({}, state, { detail: obj });
    }
    default:
      return state;
  }
}
