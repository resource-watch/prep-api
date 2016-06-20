import { connect } from 'react-redux';
import DashboardsPage from '../components/DashboardDetailPage';

const mapStateToProps = (state, location) => ({
  currentPage: location.route.path,
  dashboardSlug: location.params.slug
});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(DashboardsPage);
