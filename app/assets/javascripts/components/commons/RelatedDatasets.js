import React from 'react';
import Title from './Title';

function RelatedDataset(props) {
  return (
    <div className="c-related-datasets">
      <div className="wrapper">
        <Title borderType={props.pageType}>
          Related datasets
        </Title>
        <div className="datasets">
          <div className="dataset">
            <div className="title">
              <a href="#">Intact forest landscapes</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">WRI</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Environmental democracy index</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">NASA</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Epidemic</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">Open Weather Map</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Aqueduct: Water stress projections</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">USGS</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Intact forest landscapes</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">WRI</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Environmental democracy index</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">IUCN</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

RelatedDataset.propTypes = {
  /**
   * Define the page type color
   * Accepted values:
   * 	- 1: yellow border
   * 	- 2: blue border
   * 	- 3: green border
   * Default: no border (i.e. prop not defined)
   */
  pageType: React.PropTypes.number,
};

export default RelatedDataset;
