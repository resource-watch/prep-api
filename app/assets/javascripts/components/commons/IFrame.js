import React from 'react';
import LoadingSpinner from './LoadingSpinner';

class IFrame extends React.Component {
  constructor() {
    super();
    this.state = {
      loaded: false,
      height: 400
    };
  }

  componentDidMount() {
    this.refs.iframe.addEventListener('load', () => this.onLoad());
  }

  onLoad() {
    const height = this.refs.iframe.contentDocument.body.scrollHeight;
    this.setState({ loaded: true, height });
  }

  render() {
    let loading;
    if (!this.state.loaded) loading = <LoadingSpinner />;

    return (
      <div className="c-iframe" style={{ height: this.state.height }}>
        {loading}
        <iframe ref="iframe" src={this.props.src}></iframe>
      </div>
    );
  }
}

IFrame.propTypes = {
  /**
   * The source url to load iframe
   */
  src: React.PropTypes.string.isRequired,
};

export default IFrame;
