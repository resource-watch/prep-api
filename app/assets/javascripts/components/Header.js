import React from 'react';

function Header(props) {
  const classes = ['c-header'];

  if (props.small) classes.push('-small');

  return (
    <div className={classes.join(' ')}>
      <div className="wrapper">
        <div className="content">
          {props.children}
        </div>
      </div>
    </div>
  );
}

Header.propTypes = {
  /**
   * Define the height of the banner
   * Accepted values:
   * 	- true:  small size
   * 	- false: large size
   * Default: false
   */
  small: React.PropTypes.bool,
  /**
   * Define the content of the header
   * Required
   */
  children: React.PropTypes.array.isRequired
};

export default Header;
