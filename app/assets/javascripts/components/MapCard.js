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
          <Tooltip />
        </div>
      </div>
      {props.children}
    </div>
  );
}

MapCard.propTypes = {
  /**
   * Define the card title
   */
  title: React.PropTypes.string,
  /**
   * Define the text content of the button
   * Required
   */
  children: React.PropTypes.array.isRequired
};

export default MapCard;
