import React from 'react';
import Header from './Header';
import Navbar from './Navbar';
import Title from './Title';
import Card from './Card';
import Button from './Button';
import Footer from './Footer';

function DashboardsPage(props) {
  return (
    <div className="l-dashboards">
      <Header>
        <Navbar currentPage={props.currentPage} />
        <Title inverse center borderType={1} type="page"> Dashboard detail page </Title>
      </Header>
      <div className="wrapper">
        <Title center>I'm in the {props.dashboardSlug} dashboard</Title>
      </div>

      <div className="pre-header">
        <div className="wrapper">
          <div className="content">
            <div>
              <Title inverse center>Do you have relevant data about climate?</Title>
              <a href="" className="button-container">
                <Button inverse borderType={1}>Create your dashboard</Button>
              </a>
            </div>
            <div>
              <Title inverse center> Would you like to improve a dashboard?</Title>
              <a href="" className="button-container">
                <Button inverse borderType={1}>Get in touch</Button>
              </a>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
}

DashboardsPage.propTypes = {
  /**
   * Define the route path (from the router)
   */
  currentPage: React.PropTypes.string,
};

export default DashboardsPage;
