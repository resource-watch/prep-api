import React from 'react';
import { connect } from 'react-redux';
import HomePage from './containers/pages/HomePage';
import DataPage from './containers/pages/DataPage';
import DashboardsPage from './containers/pages/DashboardsPage';
import DashboardDetailPage from './containers/pages/DashboardDetailPage';
import { Router, Route } from 'react-router';

function Routes(props) {
  return (
    <Router history={props.history}>
      <Route path="/" component={HomePage} />
      <Route path="data" component={DataPage} />
      <Route path="dashboards" component={DashboardsPage} />
      <Route path="dashboards/:slug(/:tab)" component={DashboardDetailPage} />
    </Router>
  );
}

Routes.propTypes = {
  history: React.PropTypes.object.isRequired
};

const mapStateToProps = () => ({});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(Routes);
