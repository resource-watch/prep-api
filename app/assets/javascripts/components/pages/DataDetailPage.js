import React from 'react';
import Title from '../commons/Title';
import Header from '../commons/Header';

class DataPageDetail extends React.Component {

  componentDidMount() {
    if (!this.props.data.layers.length) {
      this.props.getDataDetail();
    }
  }

  getContent() {
    return <div> Dataset detail content </div>;
  }

  render() {
    let content = this.getContent();
    let title;
    if (this.props.data && this.props.data.title) {
      title = (
        <Title inverse center border type="page">
          {this.props.data.title}
        </Title>
      );
    }
    return (
      <div className="l-dashboards">
        <Header image={this.props.data && this.props.data.image}>
          {title}
        </Header>

        {content}

      </div>
    );
  }
}

DataPageDetail.propTypes = {
  /**
   * Define the route path (from the router)
   */
  currentPage: React.PropTypes.string,
  /**
   * Define the function to get the datataset detail data
   */
  getDataDetail: React.PropTypes.func.isRequired,
  /**
   * Define the dataset data
   */
  data: React.PropTypes.any.isRequired
};

export default DataPageDetail;
