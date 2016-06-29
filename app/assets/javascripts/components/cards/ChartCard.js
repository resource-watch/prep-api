import React from 'react';
import ContentCard from './ContentCard';
import VegaChart from '../commons/VegaChart';

function ChartCard(props) {
  const header = {
    title: props.title,
    subtitle: props.subtitle
  };
  return (
    <ContentCard
      header={header}
      pageType={props.pageType}
      dataTooltip={props.tooltip ? props.data : false}
    >
      {props.data && props.data.data &&
        <VegaChart data={props.data.data} />
      }
    </ContentCard>
  );
}

ChartCard.propTypes = {
  /**
   * Define the card title
   */
  title: React.PropTypes.string.isRequired,
  /**
   * Define the card subtitle
   */
  subtitle: React.PropTypes.string,
  /**
   * Define it the card has tooltip
   */
  tooltip: React.PropTypes.bool,
  /**
   * Define layers data to the map
   */
  data: React.PropTypes.any.isRequired,
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

export default ChartCard;
