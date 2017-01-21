
export function loadSessionListData() {
  return fetch("http://localhost:3000/sessions", {
    method: 'get'
  })
    .then(response => { return response.json(); });
}

export function saveSession(session) {
  // TODO: call the server to save stuff
  return Promise.resolve(session);
}

