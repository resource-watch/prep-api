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
    switch (layer.type) {
      case 'ArcGISImageMapLayer':
        this.addArcgisImageLayer(layer);
        break;
      case 'ArcGISTiledMapLayer':
        this.addArcgisTileLayer(layer);
        break;
      case 'CartoLayer':
        this.addCartoLayer(layer);
        break;
      default:
        break;
    }
  }

  addArcgisImageLayer(layer) {
    this.mapLayers[layer.id] = L.esri.imageMapLayer({
      url: layer.url,
      mosaicRule: layer.mosaicRule,
      useCors: false
    }).addTo(this.map);
    this.mapLayers[layer.id].on('load', () => {
      this.handleTileLoaded(layer);
    });
  }

  addArcgisTileLayer(layer) {
    this.mapLayers[layer.id] = L.esri.tiledMapLayer({
      url: layer.url,
      mosaicRule: layer.mosaicRule,
      useCors: false
    }).addTo(this.map);
    this.mapLayers[layer.id].on('load', () => {
      this.handleTileLoaded(layer);
    });
  }

  addCartoLayer(layer) {
    const request = new Request(`https://${layer.account}.cartodb.com/api/v1/map/`, {
      method: 'POST',
      headers: new Headers({
        'Content-Type': 'application/json'
      }),
      body: JSON.stringify({
        layers: [{
          user_name: layer.account,
          type: 'cartodb',
          options: {
            sql: layer.query,
            cartocss: layer.cartocss,
            cartocss_version: '2.3.0'
          }
        }]
      })
    });

    fetch(request)
      .then(res => {
        if (res.ok) {
          return res.json();
        }
        return this.handleTileError(layer);
      })
      .then((data) => {
        const tileUrl = `https://${layer.account}.cartodb.com/api/v1/map/${data.layergroupid}/{z}/{x}/{y}.png`;
        this.mapLayers[layer.id] = L.tileLayer(tileUrl).addTo(this.map, 1);
        this.mapLayers[layer.id].on('load', () => {
          this.handleTileLoaded(layer);
        });
        this.mapLayers[layer.id].on('tileerror', () => {
          this.handleTileError(layer);
        });
      });
  }

  removeMapLayer(layer) {
    this.map.removeLayer(this.mapLayers[layer.id]);
    this.mapLayers[layer.id] = null;
  }

  handleTileLoaded(layer) {
    console.log('TODO: handle tile loaded', layer.id);
  }
  handleTileError(layer) {
    console.log('TODO: handle tile errors', layer.id);
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
