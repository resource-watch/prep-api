import React from 'react';

import Switch from '../commons/Switch';

class DataMap extends React.Component {
  constructor() {
    super();
    this.state = {
      toolbarOpen: true
    };
  }
  componentDidMount() {
    this.map = L.map(this.refs.map, {
      scrollWheelZoom: false,
      zoomControl: false,
      center: [48.46038, -123.889823],
      zoom: 8,
    });
    L.control.zoom({ position: 'topright' }).addTo(this.map);

    // adding basemap
    L.tileLayer('http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png', {
      maxZoom: 18
    }).addTo(this.map, 1);
  }

  toggleToolbarStatus() {
    this.setState({
      toolbarOpen: !this.state.toolbarOpen
    });
  }

  render() {
    return (<div className="c-data-map">
      <div className={['toolbar', this.state.toolbarOpen ? '-open' : ''].join(' ')}>
        <div className="actions">
          <div>
            <button
              className={['toggle-status', this.state.toolbarOpen ? '-open' : ''].join(' ')}
              onClick={() => this.toggleToolbarStatus()}
            >
              <span></span>
            </button>
          </div>
        </div>
        <div className="content">
          <Switch />
        </div>
      </div>
      <div className="map" ref="map"></div>
    </div>);
  }
}

DataMap.propTypes = {
  /**
  * Define the layers data of the map
  */
  data: React.PropTypes.any,
};

export default DataMap;
