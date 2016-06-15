import React from 'react';
import { connect } from 'react-redux';
import HomePage from './containers/HomePage';
import { Router, Route } from 'react-router';

function Routes(props) {
  return (
    <Router history={props.history}>
      <Route path="/" component={HomePage} />
    </Router>
  );
}

Routes.propTypes = {
  history: React.PropTypes.object.isRequired,
};

const mapStateToProps = () => ({});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(Routes);
