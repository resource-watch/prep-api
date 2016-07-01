import { connect } from 'react-redux';
import ToolbarActions from '../../components/commons/ToolbarActions';

import { setModalUnderDevelop } from '../../actions/modal';

const mapStateToProps = () => ({});
const mapDispatchToProps = (dispatch) => ({
  openDownload: () => dispatch(setModalUnderDevelop(true)),
  openShare: () => dispatch(setModalUnderDevelop(true))
});

export default connect(mapStateToProps, mapDispatchToProps)(ToolbarActions);
