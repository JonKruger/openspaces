import * as types from '../constants/ActionTypes';

// example of a thunk using the redux-thunk middleware
export function loadSessionData() {
  return function (dispatch) {
    // thunks allow for pre-processing actions, calling apis, and dispatching multiple actions
    return fetch("http://localhost:3000/sessions", {
        method: 'get'
      })
    .then(response => { return response.json(); })
    .then(data => {
      	dispatch(
	      {
	      	type: types.LOAD_SESSIONS,
	      	data
	    	}
	    )});
  };
}

export function editSession(session) {
  return (dispatch) => dispatch({type: types.EDIT_SESSION, session});
}