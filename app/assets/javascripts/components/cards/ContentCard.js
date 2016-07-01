import React from 'react';
import Title from '../commons/Title';
import Tooltip from '../commons/Tooltip';

function ContentCard(props) {
  let legend;
  if (props.header.legend) {
    legend = (<span className={['legend', `-color-${props.pageType}`].join(' ')}>
    {props.header.legend}</span>);
  }

  let subtitle;
  if (props.header.subtitle) {
    subtitle = (<span className={['legend', `-color-${props.pageType}`].join(' ')}>
    {props.header.subtitle}</span>);
  }

  return (
    <div className="c-content-card">
      <div className="header">
        {legend}
        <Title type="mini">
          {props.header.title}
        </Title>
        {subtitle}

        {props.dataTooltip &&
          <div className="tooltip">
            <Tooltip data={props.dataTooltip} />
          </div>
        }
      </div>
      <div className="content">
        {props.children}
      </div>
    </div>
  );
}

ContentCard.propTypes = {
  /**
   * Define the text below the title
   * Accepted values:
   * 	{
   *    title: [String],
   *    legend: [String, optional],
   *    subtitle: [String, optional]
   *  }
   */
  header: React.PropTypes.object.isRequired,
  /**
   * Define tooltip content data
   */
  dataTooltip: React.PropTypes.any,
  /**
   * Define the content of the card
   * Required
   */
  children: React.PropTypes.object,
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

export default ContentCard;
