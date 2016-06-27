import {
  LIST_DASHBOARD_RECEIVED,
  DETAIL_DASHBOARD_RECEIVED
} from '../constants';

export function getDashboardList() {
  return dispatch => {
    fetch('/data/dashboards-list.json')
      .then(response => (response.json()))
      .then(data => {
        dispatch({
          type: LIST_DASHBOARD_RECEIVED,
          payload: {
            data: data.data
          }
        });
      }
    );
  };
}
export function getDashboardBySlug(slug) {
  return dispatch => {
    fetch(`/data/${slug}.json`)
      .then(response => (response.json()))
      .then(data => {
        dispatch({
          type: DETAIL_DASHBOARD_RECEIVED,
          payload: { data }
        });
      }
    );
  };
}
