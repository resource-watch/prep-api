import React from 'react';

function ContainerPage(props) {
  return <div className=""> {props.children} </div>;
}

ContainerPage.propTypes = {
  /**
   * Define page content
   */
  children: React.PropTypes.any.isRequired
};

export default ContainerPage;
