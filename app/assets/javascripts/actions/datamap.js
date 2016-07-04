import {
  MAP_DATA_RECEIVED,
  SWITCH_CHANGED,
  SET_SWITCH_STATUS
} from '../constants';

export function getDataMap() {
  return dispatch => {
    fetch('/data/map/map-data-layers.json')
      .then(response => (response.json()))
      .then(data => {
        dispatch({
          type: MAP_DATA_RECEIVED,
          payload: {
            data: data.layers
          }
        });
      }
    );
  };
}

export function switchChange(id) {
  return {
    type: SWITCH_CHANGED,
    payload: { id }
  };
}

export function setSwitchStatus(id, status) {
  return {
    type: SET_SWITCH_STATUS,
    payload: { id, status }
  };
}
