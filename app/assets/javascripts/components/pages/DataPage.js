import React from 'react';
import Navbar from '../commons/Navbar';
import DataMap from '../maps/DataMap';

function DataPage(props) {
  return (
    <div className="l-data">
      <Navbar small dark currentPage={props.currentPage} />
      <DataMap />
    </div>
  );
}

DataPage.propTypes = {
  /**
   * Define the route path (from the router)
   */
  currentPage: React.PropTypes.string,
};

export default DataPage;
