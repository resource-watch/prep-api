import React from 'react';
import Modal from './Modal';
import Title from './Title';
import ChartCard from '../cards/ChartCard';

class Tooltip extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tooltipOpen: false
    };
  }

  handleClickClose() {
    this.setState({
      tooltipOpen: false
    });
  }

  render() {
    let content = (
      <div className="content">
        <div>
          {this.props.data && this.props.data.data &&
            <ChartCard
              noBorder
              title={this.props.data.title}
              subtitle={this.props.data.subtitle}
              data={this.props.data}
            />
          }
        </div>
        <div>
          <p>
            <span>Description:</span>
            description
          </p>
          <p>
            <span>Data:</span>
            data
          </p>
          <p>
            <span>Topic:</span>
            topic
          </p>
          <p>
            <span>Area:</span>
            area
          </p>
          <img
            src={gon.assets[this.props.data.partner.logo]}
            className="logo"
            alt={this.props.data.partner.name}
          />
        </div>
      </div>
    );

    return (
      <div className="c-tooltip">
        <span className="icon" onClick={() => this.setState({ tooltipOpen: true })}>i</span>
        <Modal
          opened={this.state.tooltipOpen}
          close={() => this.handleClickClose()}
        >

          {content}

        </Modal>
      </div>
    );
  }
}

Tooltip.propTypes = {
  /**
   * Define the data content of the tooltip
   * Required
   */
  data: React.PropTypes.any.isRequired
};

export default Tooltip;
