import { connect } from 'react-redux';
import ToolbarActions from '../../components/commons/ToolbarActions';

import { openShare } from '../../actions/toolbar';

const mapStateToProps = () => ({});
const mapDispatchToProps = (dispatch) => ({
  openShare: () => dispatch(openShare())
});

export default connect(mapStateToProps, mapDispatchToProps)(ToolbarActions);
