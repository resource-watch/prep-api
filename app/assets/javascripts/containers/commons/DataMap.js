import { connect } from 'react-redux';
import DataMap from '../../components/maps/DataMap';

import { switchChange } from '../../actions/datamap';

const mapStateToProps = () => ({});
const mapDispatchToProps = (dispatch) => ({
  switchChange: (id) => dispatch(switchChange(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(DataMap);
