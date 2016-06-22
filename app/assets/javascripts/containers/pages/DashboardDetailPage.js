import { connect } from 'react-redux';
import DashboardsPage from '../../components/pages/DashboardDetailPage';

const mapStateToProps = (state, { params, route }) => ({
  currentPage: route.path,
  dashboardSlug: params.slug,
  dashboardTab: params.tab || 'indicators'
});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(DashboardsPage);
