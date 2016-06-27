import React from 'react';
import Modal from './Modal';

import ReactCSSTransitionGroup from 'react-addons-css-transition-group';

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
    let content = <span>Hi! I'm the {this.props.data.title} tooltip</span>;
    return (
      <div className="c-tooltip">
        <span className="icon" onClick={() => this.setState({ tooltipOpen: true })}>i</span>

        <ReactCSSTransitionGroup
          transitionName="modal"
          transitionAppear
          transitionAppearTimeout={300}
          transitionEnterTimeout={300}
          transitionLeaveTimeout={300}
        >
          {this.state.tooltipOpen &&
            <Modal close={() => this.handleClickClose()}>
              <div className="content">
                {content}
              </div>
            </Modal>
          }
        </ReactCSSTransitionGroup>
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
