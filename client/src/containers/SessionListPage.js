import React, {PropTypes} from 'react';
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import SessionListForm from '../components/SessionListForm';

export const SessionListPage = (props) => {
  return (
    <SessionListForm sessions={props.sessions}/>
  );
};

SessionListPage.propTypes = {
  sessions: PropTypes.object.isRequired
};

function mapStateToProps(state) {
  return {
    sessions: state.sessions
  };
}

function mapDispatchToProps(dispatch) {
  return {
    // actions: bindActionCreators(actions, dispatch)
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionListPage);
