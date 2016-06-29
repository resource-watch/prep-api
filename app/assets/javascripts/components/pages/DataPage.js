import React from 'react';
import Navbar from '../commons/Navbar';
import DataMap from '../../containers/commons/DataMap';

class DataPage extends React.Component {

  componentDidMount() {
    this.props.getDataMap();
  }

  render() {
    return (
      <div className="l-data">
        <Navbar small dark currentPage={this.props.currentPage} />
        <DataMap data={this.props.data} />
      </div>
    );
  }
}

DataPage.propTypes = {
  /**
   * Define the route path (from the router)
   */
  currentPage: React.PropTypes.string,
  /**
   * Define the function to get the map layers
   */
  getDataMap: React.PropTypes.func.isRequired,
  /**
   * Define the map layers
   */
  data: React.PropTypes.any.isRequired,
};

export default DataPage;
