import { connect } from 'react-redux';
import DataPage from '../../components/pages/DataPage';

import { getDataMap } from '../../actions/datamap';

const mapStateToProps = (state, location) => ({
  currentPage: location.route.path,
  data: state.mapdata
});

const mapDispatchToProps = (dispatch) => ({
  getDataMap: () => dispatch(getDataMap())
});

export default connect(mapStateToProps, mapDispatchToProps)(DataPage);
