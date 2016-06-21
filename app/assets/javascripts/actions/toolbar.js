import { SET_MODAL_SHARE } from '../constants';

export function openShare() {
  return {
    type: SET_MODAL_SHARE,
    payload: true
  };
}
