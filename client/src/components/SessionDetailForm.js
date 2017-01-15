import React, {PropTypes} from 'react';
import {Link} from 'react-router';

class SessionDetailForm extends React.Component {
  constructor(props, context) {
    super(props, context);

    // this.save = this.save.bind(this);
  }

  render() {
    const session = this.props.session;
    if (!session)
      return <div>edit page</div>;

    return (<div>{session.title}</div>);
  }
}

SessionDetailForm.propTypes = {
  session: PropTypes.object
};

export default SessionDetailForm;
