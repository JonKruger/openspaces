import * as types from '../constants/ActionTypes';

// example of a thunk using the redux-thunk middleware
export function loadSessionData() {
  return function (dispatch) {
    // thunks allow for pre-processing actions, calling apis, and dispatching multiple actions
    return dispatch({
      type: types.LOAD_SESSIONS,
    });
  };
}