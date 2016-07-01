import React from 'react';

import Switch from '../commons/Switch';
import Button from '../commons/Button';
import FilterTab from '../../containers/commons/FilterTab';

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

  getLayers() {
    const layers = [];
    if (!this.props.data.layers.length) {
      return (<p> There are no data layers </p>);
    }
    this.props.data.layers.forEach((layer, index) => {
      layers.push(
        <div className="layer" key={`map-layer-${index}`}>
          <Switch
            onChange={() => this.props.switchChange(layer.id)}
            checked={layer.active || false}
          />
          <span className="title">{layer.title}</span>
        </div>
      );
    });
    return layers;
  }

  toggleToolbarStatus() {
    this.setState({
      toolbarOpen: !this.state.toolbarOpen
    });
  }

  render() {
    let content = this.getLayers();

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
        <div className="header">
          <FilterTab />
        </div>
        <div className="content">
          {content}
        </div>
        <div className="actions-mobile">
          <Button
            border
            click={() => this.toggleToolbarStatus()}
          >
            Apply
          </Button>
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
  /**
  * Define the layers on change switch function
  */
  switchChange: React.PropTypes.func.isRequired,
};

export default DataMap;
