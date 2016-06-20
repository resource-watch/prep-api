function ButtonComponent(props) {
  const classes = ['c-button'];

  if (props.color) classes.push(`-color-${props.color}`);
  if (props.inverse) classes.push('-inverse');
  if (props.borderType) classes.push(`-border-${props.borderType}`);
  if (props.fill) classes.push('-fill');

  return (
    <button className={classes.join(' ')}>
      {props.children}
    </button>
  );
}

ButtonComponent.propTypes = {
  /**
   * Define the color of the button's content
   * Accepted values:
   * 	- 1: yellow
   * 	- 2: blue
   * 	- 3: green
   * Default: 2
   */
  color: React.PropTypes.number,
  /**
   * Define the color of the button's content
   * Accepted values:
   * 	- true:  the button's content is white
   * 	- false: the button uses the color previously defined
   * Default: false
   */
  inverse: React.PropTypes.bool,
  /**
   * Define the color of the border of the button
   * Accepted values:
   * 	- 1: yellow
   * 	- 2: blue
   * 	- 3: green
   * Default: no border (i.e. prop not defined)
   */
  borderType: React.PropTypes.number,
  /**
   * Define the filling of the button
   * Accepted values:
   * 	- true:  the button is filled with the same color of the border
   * 					 (it's not compatible with the inverse option)
   * 	- false: the button has a transparent background
   * Default: false
   */
  fill: React.PropTypes.bool,
  /**
   * Define the text content of the button
   * Required
   */
  children: React.PropTypes.string.isRequired
};
