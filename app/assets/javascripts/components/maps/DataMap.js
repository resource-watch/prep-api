import React from 'react';

class DataMap extends React.Component {
  componentDidMount() {
    this.map = L.map(this.refs.map, {
      scrollWheelZoom: false,
      center: [48.246038, -122.589823],
      zoom: 8,
    });

    // adding basemap
    L.tileLayer('http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png', {
      maxZoom: 18
    }).addTo(this.map, 1);
  }

  render() {
    return <div className="c-data-map" ref="map"> </div>;
  }
}

DataMap.propTypes = {
  /**
  * Define the layers data of the map
  */
  data: React.PropTypes.any,
};

export default DataMap;
