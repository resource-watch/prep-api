import React from 'react';

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
          <p> {props.data.description} </p>
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
  data: React.PropTypes.object.isRequired
};

export default DashboardIntro;
