import React from 'react';

class DataMapLegend extends React.Component {
  constructor() {
    super();
    this.state = {
      legendOpen: true
    };
  }
  getContent() {
    const layers = [];
    this.props.data.forEach((layer, index) => {
      layers.push(
        <div className="layer" key={`map-layer-${index}`}>
          <span className="title">{layer.title}</span>
        </div>
      );
    });
    return layers;
  }

  toggleToolbarStatus() {
    this.setState({
      legendOpen: !this.state.legendOpen
    });
  }

  render() {
    let content;
    const legendClassNames = ['c-data-map-legend'];
    if (this.state.legendOpen) legendClassNames.push('-open');
    if (this.props.data.length) {
      content = this.getContent();
    } else {
      legendClassNames.push('-empty');
    }

    return (
      <div className={legendClassNames.join(' ')}>
        <div className="actions">
          <div>
            <button
              className={['toggle-status', this.state.legendOpen ? '-open' : ''].join(' ')}
              onClick={() => this.toggleToolbarStatus()}
            >
              <span></span>
            </button>
          </div>
        </div>
        <div className="content">
          {content}
        </div>
      </div>
    );
  }
}

DataMapLegend.propTypes = {
  /**
  * Define the layers data of the map
  */
  data: React.PropTypes.any,
};

export default DataMapLegend;
