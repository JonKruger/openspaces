export default {
  loadSessionListData() {
    return fetch("http://localhost:3000/sessions", {
      method: 'get'
    })
      .then(response => { return response.json(); });
  }
}
