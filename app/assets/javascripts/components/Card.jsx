function CardComponent(props) {
  const classes = ['c-card'];

  if (props.inverse) classes.push('-inverse');
  if (props.borderType) classes.push(`-border-${props.borderType}`);

  return (
    <div className={classes.join(' ')}>
      {props.children}
    </div>
  );
}

CardComponent.propTypes = {
  /**
   * Define the color of the content
   * Accepted values:
   * 	- true:  the content color is adapted for darker background
   * 	- false: the content color is adapted for lighter background
   * Default: false
   */
  inverse: React.PropTypes.bool,
  /**
   * Define the color of the border of the button
   * Accepted values:
   * 	- 1: grey
   * 	- 2: yellow
   * Default: no border (i.e. prop not defined)
   */
  borderType: React.PropTypes.number,
  /**
   * Define the text content of the button
   * Required
   */
  children: React.PropTypes.array.isRequired
};
