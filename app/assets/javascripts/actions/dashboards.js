import {
  DATA_DASHBOARD_RECEIVED
} from '../constants';

export function getDashboardBySlug(slug) {
  return dispatch => {
    fetch(`/data/${slug}.json`)
      .then(response => (response.json()))
      .then(data => {
        dispatch({
          type: DATA_DASHBOARD_RECEIVED,
          payload: { data }
        });
      }
    );
  };
}
