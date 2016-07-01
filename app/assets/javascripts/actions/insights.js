import {
  LIST_INSIGHTS_RECEIVED,
  DETAIL_INSIGHTS_RECEIVED
} from '../constants';

export function getInsightsList() {
  return dispatch => {
    fetch('/data/insights/list.json')
      .then(response => (response.json()))
      .then(data => {
        dispatch({
          type: LIST_INSIGHTS_RECEIVED,
          payload: {
            data: data.data
          }
        });
      }
    );
  };
}
export function getInsightBySlug(slug) {
  return dispatch => {
    fetch(`/data/insights/${slug}.json`)
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
