import React, {PropTypes} from 'react';
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import SessionDetailForm from '../components/SessionDetailForm';

export const SessionDetailPage = (props) => {
  return (
    <SessionDetailForm session={props.session}/>
  );
};

SessionDetailPage.propTypes = {
  session: PropTypes.object
};

function mapStateToProps(state) {
  return {
    session: state.sessionBeginEdited
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
)(SessionDetailPage);
