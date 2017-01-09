import React, {PropTypes} from 'react';

class SessionListForm extends React.Component {
  constructor(props, context) {
    super(props, context);

    // this.save = this.save.bind(this);
    // this.onTimeframeChange = this.onTimeframeChange.bind(this);
    // this.fuelSavingsKeypress = this.fuelSavingsKeypress.bind(this);
  }

  renderSessions(sessions) {
    if (!sessions)
      return "";

    return sessions.map((s, i) => (
      <div key={i}>{s}</div>
    ));   
  }

  render() {
    const {sessions} = this.props;
    const sessionHtml = this.renderSessions(sessions);

    return (
      <div>
        <div>yo</div>
        <div>{sessionHtml}</div>
      </div>

    );
  }
}

SessionListForm.propTypes = {
  sessions: PropTypes.array
};

export default SessionListForm;
