import { connect } from 'react-redux';
import DataPage from '../../components/pages/DataPage';

const mapStateToProps = (state, location) => ({
  currentPage: location.route.path
});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(DataPage);
