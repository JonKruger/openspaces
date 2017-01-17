import * as types from '../constants/ActionTypes';
import sessionService from '../services/SessionService';

export function viewSessionList() {
  return (dispatch) => dispatch({ type: types.VIEW_SESSION_LIST });
}

export function loadSessionListData() {
  return (dispatch) => {
    sessionService.loadSessionListData()
      .then(data => {
        dispatch(
          {
            type: types.LOAD_SESSIONS,
            data
          }
        );
      });
  };
}

export function editSession(sessionId) {
  return (dispatch) => dispatch({ type: types.EDIT_SESSION, sessionId });
}

export function editSessionDataChanged(fieldName, value) {
  return (dispatch) => dispatch({ type: types.EDIT_SESSION_DATA_CHANGED, fieldName, value });
}

export function saveSession() {
  return (dispatch) => {
    dispatch({ type: types.SAVE_SESSION })
    .then(() => viewSessionList()(dispatch));
  };
}
