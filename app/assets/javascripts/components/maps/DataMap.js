import React from 'react';

class DataMap extends React.Component {

  componentDidMount() {
    this.initMap();
  }

  componentWillReceiveProps(props) {
    this.updateLayers(props.tiles);
  }

  initMap() {
    this.mapLayers = {};
    this.map = L.map(this.refs.map, {
      scrollWheelZoom: false,
      zoomControl: false,
      center: [48.46038, -123.889823],
      zoom: 3,
    });
    L.control.zoom({ position: 'topright' }).addTo(this.map);

    L.tileLayer(
      'http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png',
      { maxZoom: 18 }
    ).addTo(this.map, 1);
  }

  updateLayers() {
    if (this.props.data.layers.length) {
      this.props.data.layers.forEach((layer) => {
        this.updateMapLayer(layer);
      });
    }
  }

  updateMapLayer(layer) {
    if (layer.active && !this.mapLayers[layer.id]) {
      this.addMapLayer(layer);
    } else if (!layer.active && this.mapLayers[layer.id]) {
      this.removeMapLayer(layer);
    }
  }

  addMapLayer(layer) {
    let added = false;
    switch (layer.type) {
      case 'ArcGISImageMapLayer':
        this.addArcgisImageLayer(layer);
        added = true;
        break;
      case 'ArcGISTiledMapLayer':
        this.addArcgisTileLayer(layer);
        added = true;
        break;
      default:
        break;
    }
    if (added) {
      this.mapLayers[layer.id].on('load', () => {});
    }
  }

  addArcgisImageLayer(layer) {
    this.mapLayers[layer.id] = L.esri.imageMapLayer({
      url: layer.url,
      mosaicRule: layer.mosaicRule,
      useCors: false
    }).addTo(this.map);
  }

  addArcgisTileLayer(layer) {
    this.mapLayers[layer.id] = L.esri.tiledMapLayer({
      url: layer.url,
      mosaicRule: layer.mosaicRule,
      useCors: false
    }).addTo(this.map);
  }

  removeMapLayer(layer) {
    this.map.removeLayer(this.mapLayers[layer.id]);
    this.mapLayers[layer.id] = null;
  }

  render() {
    return (<div className="c-data-map">
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
