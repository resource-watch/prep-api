import { connect } from 'react-redux';
import DashboardsPage from '../../components/pages/DashboardDetailPage';

import { getDashboardBySlug } from '../../actions/dashboards';

const mapStateToProps = (state, { params, route }) => ({
  currentPage: route.path,
  dashboardSlug: params.slug,
  dashboardTab: params.tab || 'indicators',
  data: state.dashboards.detail[params.slug] || null
});

const mapDispatchToProps = (dispatch) => ({
  getDashboardBySlug: (slug) => dispatch(getDashboardBySlug(slug))
});

export default connect(mapStateToProps, mapDispatchToProps)(DashboardsPage);
