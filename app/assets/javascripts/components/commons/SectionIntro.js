import React from 'react';
import ToolbarActions from '../../containers/commons/ToolbarActions';

function SectionIntro(props) {
  return (
    <div className={"c-section-intro"}>
      <div className="container">
        <div className="top-bar">
          <div className="logo">
            <img src={gon.assets[props.data.partner.logo]} alt="" />
          </div>
          <div className="author">
            <span>{props.data.author.name}</span>
            <span className={`-color-${props.pageType}`}>{props.data.author.email}</span>
          </div>
        </div>
        <div className="content">
          <div className="wrapper-mini">
            <ToolbarActions
              pageType={props.pageType}
              currentSection={props.currentPage.split('/')[0]}
            />
            <p> {props.data.description} </p>
          </div>
        </div>
      </div>
    </div>
  );
}

SectionIntro.propTypes = {
  /**
   * Data of intro detail with the below structure:
   * - description: string
   * - slug: string
   * - author: {name: string, email: string}
   * - companyLogoUrl: string
   * Required
   */
  data: React.PropTypes.object.isRequired,
  /**
   * Define the route path (from the router)
   */
  currentPage: React.PropTypes.string,
  /**
   * Define the page type color
   * Accepted values:
   * 	- 1: yellow border
   * 	- 2: blue border
   * 	- 3: green border
   * Default: no border (i.e. prop not defined)
   */
  pageType: React.PropTypes.number
};

export default SectionIntro;
