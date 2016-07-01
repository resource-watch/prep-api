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

  getContent() {
    if (!this.props.data.layers.length) {
      return (<p> There are no data layers </p>);
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
      toolbarOpen: !this.state.toolbarOpen
    });
  }

  render() {
    let content = this.getContent();
    return (
      <div className={['c-data-map-sidebar', this.state.toolbarOpen ? '-open' : ''].join(' ')}>
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
            borderType={2}
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
