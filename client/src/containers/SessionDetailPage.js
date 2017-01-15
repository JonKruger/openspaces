import React, {PropTypes} from 'react';
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import SessionDetailForm from '../components/SessionDetailForm';
import * as actions from '../actions/SessionActions';

class SessionDetailPage extends React.Component
{
  constructor(props, context) {
    super(props, context);

    // this.save = this.save.bind(this);
  }

  componentWillMount() {
    this.props.actions.editSession(this.props.params.id);
  }

  render() {
    return (
      <SessionDetailForm 
        session={this.props.session}/>
    );
  }
 };
 
SessionDetailPage.propTypes = {
  session: PropTypes.object,
  actions: PropTypes.object
};
 
function mapStateToProps(state) {
  return {
    session: state.sessions.sessionBeingEdited
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(actions, dispatch)
  };
}
 
export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionDetailPage);
