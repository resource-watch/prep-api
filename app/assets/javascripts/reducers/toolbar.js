import { SET_MODAL_SHARE } from '../constants';

const initialState = false;

export default function (state = initialState, action) {
  switch (action.type) {
    case SET_MODAL_SHARE:
      console.log('TODO: handle modal share:', action.payload);
      return action.payload;
    default:
      return state;
  }
}
