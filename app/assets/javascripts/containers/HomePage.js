import { connect } from 'react-redux';
import HomePage from '../components/HomePage';

const mapStateToProps = (state, location) => ({
  currentPage: location.route.path
});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(HomePage);
