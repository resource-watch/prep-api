import React from 'react';
import Modal from './Modal';
import Title from './Title';

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
    let content = (
      <div>
        <Title type="mini">{this.props.data.title}</Title>
        <p>
          The website is under development. Further information will go here.
        </p>
      </div>
    );

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
