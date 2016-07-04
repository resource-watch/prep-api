import {
  MAP_DATA_RECEIVED,
  SWITCH_CHANGED,
  SET_SWITCH_STATUS
} from '../constants';

const initialState = {
  layers: [],
};

export default function (state = initialState, action) {
  switch (action.type) {
    case MAP_DATA_RECEIVED: {
      return Object.assign({}, state, { layers: action.payload.data });
    }
    case SWITCH_CHANGED: {
      const layers = state.layers.slice(0);
      for (let i = 0, length = layers.length; i < length; i++) {
        if (layers[i].id === action.payload.id) {
          layers[i].active = !layers[i].active;
          break;
        }
      }
      return Object.assign({}, state, { layers });
    }
    case SET_SWITCH_STATUS: {
      const layers = state.layers.slice(0);
      for (let i = 0, length = layers.length; i < length; i++) {
        if (layers[i].id === action.payload.id) {
          layers[i].active = action.payload.status;
          break;
        }
      }
      return Object.assign({}, state, { layers });
    }
    default:
      return state;
  }
}
