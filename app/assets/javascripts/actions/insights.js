import {
  LIST_INSIGHTS_RECEIVED,
  DETAIL_INSIGHTS_RECEIVED
} from '../constants';

export function getInsightsList() {
  return dispatch => {
    fetch('/api/dashboards')
      .then(response => (response.json()))
      .then(data => {
        dispatch({
          type: LIST_INSIGHTS_RECEIVED,
          payload: { data }
        });
      }
    );
  };
}
export function getInsightBySlug(slug) {
  return dispatch => {
    fetch(`/api/dashboards/${slug}`)
      .then(response => (response.json()))
      .then(data => {
        dispatch({
          type: DETAIL_INSIGHTS_RECEIVED,
          payload: { data }
        });
      }
    );
  };
}
