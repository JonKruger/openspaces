
export function loadSessionListData() {
  return fetch("http://localhost:3000/sessions", {
    method: 'get'
  })
    .then(response => { return response.json(); });
}

export function saveSession(session) {
  // TODO: call the server to save stuff
  return fetch("http://localhost:3000/sessions/save", {
    method: 'post',
    headers: new Headers({'Content-Type': 'application/json'}),
    body: JSON.stringify(session)
  })
    .then(response => { return response.json(); });
}

