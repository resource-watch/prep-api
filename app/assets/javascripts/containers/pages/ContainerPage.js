import { connect } from 'react-redux';
import ContainerPage from '../../components/pages/ContainerPage';

const mapStateToProps = (state, location) => ({
  currentPage: location.route.path
});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(ContainerPage);
