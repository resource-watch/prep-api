import React from 'react';

class Modal extends React.Component {

  componentDidMount() {
    this.onKeyPress = e => {
      if (e.keyCode === 27) {
        this.props.close();
        e.preventDefault();
      }
    };
    document.addEventListener('keypress', this.onKeyPress);
  }

  componentWillUnmount() {
    document.removeEventListener('keypress', this.onKeyPress);
  }

  onClickOverlay(e) {
    if (e.target === e.currentTarget) this.props.close();
  }

  render() {
    return (
      <div className="overlay" onClick={(e) => this.onClickOverlay(e)}>
        <div className="modal">
          <svg className="close-button" title="Close this modal" onClick={() => this.props.close()}>
            <path d="M11.872.559L7.347 5.084 2.788.525.525 2.788l4.56 4.559-4.526 4.525 2.196 2.197L7.28 9.543l4.56 4.559 2.262-2.263L9.543 7.28l4.526-4.525z" />
          </svg>
          {this.props.children}
        </div>
      </div>
    );
  }

}

Modal.propTypes = {
  /**
   * The callback method when closing the modal
   */
  close: React.PropTypes.func.isRequired,
  /**
   * Define the content of the modal
   * Required
   */
  children: React.PropTypes.any
};


export default Modal;
