import React from 'react';
import ToolbarActions from '../containers/ToolbarActions';

function DashboardIntro(props) {
  const classes = ['c-dashboard-intro'];

  return (
    <div className={classes.join(' ')}>
      <div className="container">
        <div className="top-bar">
          <div className="logo">
            <img src={props.data.companyLogoUrl} alt="" />
          </div>
          <div className="author">
            <span>{props.data.author.name}</span>
            <span className="highlight">{props.data.author.email}</span>
          </div>
        </div>
        <div className="content">
          <div className="container">
            <ToolbarActions
              dashboardSlug={props.dashboardSlug}
              currentSection={props.currentPage.split('/')[0]}
            />
            <p> {props.data.description} </p>
          </div>
        </div>
      </div>
    </div>
  );
}

DashboardIntro.propTypes = {
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
   * Define the slug of the dashboard detail
   */
  dashboardSlug: React.PropTypes.string,
};

export default DashboardIntro;
