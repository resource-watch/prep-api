import { connect } from 'react-redux';
import DataMap from '../../components/maps/DataMap';

import { setSwitchStatus } from '../../actions/datamap';

const mapStateToProps = (state) => ({
  data: state.mapdata
});
const mapDispatchToProps = (dispatch) => ({
  onTileError: (id) => dispatch(setSwitchStatus(id, false))
});

export default connect(mapStateToProps, mapDispatchToProps)(DataMap);
