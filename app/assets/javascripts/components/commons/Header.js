import React from 'react';

function Header(props) {
  const classes = ['c-header'];

  if (props.type) classes.push(`-${props.type}`);
  if (props.pageType) classes.push(`-type-${props.pageType}`);

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
   * Define the type of Header
   * Accepted values:
   * 	- "small": short header
   * 	- "normal": common header size
   * 	- "large": large header
   * Default: "normal"
   */
  type: React.PropTypes.string,
  /**
   * Define the type of Header
   * Accepted values:
   * 	- 1: dashboard background
   * 	- 2: insight background
   * 	- 3: data background
   * 	- 4: home background
   * Default: 1
   */
  pageType: React.PropTypes.number,
  /**
   * Define the content of the header
   * Required
   */
  children: React.PropTypes.array.isRequired
};

export default Header;
