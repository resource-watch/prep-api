import React from 'react';

function Title(props) {
  const classes = ['c-title'];

  if (props.type) classes.push(`-${props.type}`);
  if (props.center) classes.push('-center');
  if (props.inverse) classes.push('-inverse');
  if (props.borderType) classes.push(`-border -border-${props.borderType}`);

  let title = <h2>{props.children}</h2>;
  if (props.type && (props.type === 'mega' || props.type === 'page')) {
    title = <h1>{props.children}</h1>;
  } else if (props.type && props.type === 'content' || props.type === 'mini') {
    title = <h3>{props.children}</h3>;
  }

  let subtitle;
  if (props.subtitle) {
    classes.push('-subtitle');
    if (props.subtitle.href) {
      subtitle = (
        <h4>
          <a href={props.subtitle.href}>{props.subtitle.title}</a>
        </h4>
      );
    } else {
      subtitle = <h4>{props.subtitle.title}</h4>;
    }
  }

  return (
    <div className={classes.join(' ')}>
      {title}
      {subtitle}
    </div>
  );
}

Title.propTypes = {
  /**
   * Define the type of Title
   * Accepted values:
   * 	- "mega":    huge title of the homepage
   * 	- "page":    usually the title of a page, in the header banner
   * 	- "section": general title
   * 	- "content": small title for the content
   * 	- "mini": smaller title, use in cards
   * Default: "section"
   */
  type: React.PropTypes.string,
  /**
   * Define the centerness of the title
   * Accepted values:
   * 	- true:  center the title
   * 	- false: left-align the title
   * Default: false
   */
  center: React.PropTypes.bool,
  /**
   * Define the color of the title
   * Accepted values:
   * 	- true:  the title is adapted for a dark background
   * 	- false: the title is adapted for a white-ish background
   * Default: false
   */
  inverse: React.PropTypes.bool,
  /**
   * Define the border below the title
   * Accepted values:
   * 	- 1: yellow border
   * 	- 2: blue border
   * 	- 3: green border
   * Default: no border (i.e. prop not defined)
   */
  borderType: React.PropTypes.number,
  /**
   * Define the text below the title
   * Accepted values:
   * 	- { title: [String], href: [String, optional] }
   * Default: no subtitle (i.e. prop not defined)
   */
  subtitle: React.PropTypes.object,
  /**
   * Define the text content of the title
   * Required
   */
  children: React.PropTypes.string.isRequired
};

export default Title;
