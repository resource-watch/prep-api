import { connect } from 'react-redux';
import DashboardsPage from '../components/DashboardDetailPage';

const mapStateToProps = (state, { params, route }) => ({
  currentPage: route.path,
  dashboardSlug: params.slug,
  dashboardTab: params.tab || 'indicators'
});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(DashboardsPage);
