import React from 'react';
import Title from './Title';
import Tooltip from './Tooltip';

function MapCard(props) {
  return (
    <div className="c-map-card">
      <div className="header">
        <Title type="mini" legend="Map">
          {props.title}
        </Title>
        <div className="tooltip">
          <Tooltip content="" />
        </div>
      </div>
      <div className="content">
        {props.children}
      </div>
    </div>
  );
}

MapCard.propTypes = {
  /**
   * Define the card title
   */
  title: React.PropTypes.string,
  /**
   * Define the content of the card
   * Required
   */
  children: React.PropTypes.object.isRequired
};

export default MapCard;
