import { connect } from 'react-redux';
import DataPage from '../../components/pages/DataPage';

import { getDataMap } from '../../actions/datamap';
import { setModalUnderDevelop } from '../../actions/modal';

const mapStateToProps = (state, location) => ({
  currentPage: location.route.path,
  data: state.mapdata,
  modalOpen: state.modal.open
});

const mapDispatchToProps = (dispatch) => ({
  getDataMap: () => dispatch(getDataMap()),
  setModalUnderDevelop: (status) =>
    dispatch(setModalUnderDevelop(status))
});

export default connect(mapStateToProps, mapDispatchToProps)(DataPage);
