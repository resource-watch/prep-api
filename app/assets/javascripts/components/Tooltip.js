import React from 'react';

function Tooltip(props) {
  return (
    <div className="c-tooltip">
      <span>i</span>
    </div>
  );
}

Tooltip.propTypes = {
  /**
   * Define the text content of the tooltip
   * Required
   */
  content: React.PropTypes.string.isRequired
};

export default Tooltip;
