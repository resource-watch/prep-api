import React from 'react';

import Switch from '../commons/Switch';
import Button from '../commons/Button';
import FilterTab from '../../containers/commons/FilterTab';
import LoadingSpinner from '../commons/LoadingSpinner';

class DataMap extends React.Component {
  constructor() {
    super();
    this.state = {
      sidebarOpen: true
    };
  }

  getContent() {
    if (!this.props.data.layers.length) {
      return <LoadingSpinner />;
    }
    const layers = [];
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
      sidebarOpen: !this.state.sidebarOpen
    });
  }

  render() {
    let content = this.getContent();
    return (
      <div className={['c-data-map-sidebar', this.state.sidebarOpen ? '-open' : ''].join(' ')}>
        <div className="actions">
          <div>
            <button
              className={['toggle-status', this.state.sidebarOpen ? '-open' : ''].join(' ')}
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
    );
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
