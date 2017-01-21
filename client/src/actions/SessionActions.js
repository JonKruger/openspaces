import * as types from '../constants/ActionTypes';
import * as sessionService from '../services/SessionService';
import { browserHistory } from 'react-router';

export function viewSessionList() {
  return (dispatch) => {
    browserHistory.push('/');
    dispatch({ type: types.VIEW_SESSION_LIST });
  }
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
  return (dispatch) => {
    dispatch({ type: types.EDIT_SESSION, sessionId });
    browserHistory.push(`/sessions/${sessionId}`)
  }
}

export function editSessionDataChanged(fieldName, value) {
  return (dispatch) => dispatch({ type: types.EDIT_SESSION_DATA_CHANGED, fieldName, value });
}

export function saveSession(session) {
  return (dispatch) => {
    sessionService.saveSession(session)
      .then(data => {
        dispatch({ type: types.SAVE_SESSION, data });
        viewSessionList()(dispatch);
  })};
}
