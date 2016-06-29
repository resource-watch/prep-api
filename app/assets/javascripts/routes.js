import React from 'react';
import { connect } from 'react-redux';
import HomePage from './containers/pages/HomePage';
import DashboardsPage from './containers/pages/DashboardsPage';
import DashboardDetailPage from './containers/pages/DashboardDetailPage';
import PartnersPage from './containers/pages/PartnersPage';
import AboutPage from './containers/pages/AboutPage';
import FAQsPage from './containers/pages/FAQsPage';
import ContactPage from './containers/pages/ContactPage';
import { Router, Route } from 'react-router';

function Routes(props) {
  return (
    <Router history={props.history}>
      <Route path="/" component={HomePage} />
      <Route path="dashboards" component={DashboardsPage} />
      <Route path="dashboards/:slug(/:tab)" component={DashboardDetailPage} />
      <Route path="partners" component={PartnersPage} />
      <Route path="about" component={AboutPage} />
      <Route path="faqs" component={FAQsPage} />
      <Route path="contact" component={ContactPage} />
    </Router>
  );
}

Routes.propTypes = {
  history: React.PropTypes.object.isRequired
};

const mapStateToProps = () => ({});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(Routes);
