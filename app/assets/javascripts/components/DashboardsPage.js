import React from 'react';
import { Link } from 'react-router';
import Header from './Header';
import Navbar from './Navbar';
import Title from './Title';
import Card from './Card';
import Button from './Button';
import Footer from './Footer';

function DashboardsPage(props) {
  return (
    <div className="l-dashboards">
      <Header type="small">
        <Navbar currentPage={props.currentPage} />
        <Title inverse center borderType={1} type="page">Dashboards</Title>
      </Header>

      <div className="wrapper">
        <div className="cards">
          <Card borderType={1}>
            <Link to="/dashboards/framer-assesses-crops-impact/indicators">
              <Title type="content">
                Framer assesses possible impacts of climate change on his crops
                (grapes)
              </Title>
            </Link>
            <p className="content">
              Farmer X would need to understand how to best prepare for any
              future changes in climate that may impact his grapes. Based on key
              thresholds for climate variables of interest (temperature and
                precipitation), Farmer X evaluate the suitability to grow
                different types of grapes...
            </p>
            <a href="#">
              <img
                src={gon.assets.universityWashingtonLogo}
                width="219"
                className="logo"
                alt="University of Washington"
              />
            </a>
          </Card>
          <Card borderType={1}>
            <Title type="content">
              City Planner assesses possible impacts of Climate Change on Puget
              Sound’s built environment
            </Title>
            <p className="content">
              Most climate change effects are likely to increase the potential
              for damage to infrastructure and service disruptions (unplanned
              transportation closures, delays, or detours) in the Puget Sound
              region, although some risks may decrease.
            </p>
            <a href="#">
              <img
                src={gon.assets.universityWashingtonLogo}
                width="219"
                className="logo"
                alt="University of Washington"
              />
            </a>
          </Card>
          <Card borderType={1}>
            <Title type="content">
              City Planner assesses possible impacts of Climate Change on Puget
              Sound’s built environment
            </Title>
            <p className="content">
              Most climate change effects are likely to increase the potential
              for damage to infrastructure and service disruptions (unplanned
              transportation closures, delays, or detours) in the Puget Sound
              region, although some risks may decrease.
            </p>
            <a href="#">
              <img
                src={gon.assets.nasaLogo}
                width="73"
                className="logo"
                alt="NASA"
              />
            </a>
          </Card>
          <Card borderType={1}>
            <a href="#">
              <Title type="content">
                Framer assesses possible impacts of climate change on his crops
                (grapes)
              </Title>
            </a>
            <p className="content">
              Farmer X would need to understand how to best prepare for any
              future changes in climate that may impact his grapes. Based on key
              thresholds for climate variables of interest (temperature and
                precipitation), Farmer X evaluate the suitability to grow
                different types of grapes...
            </p>
            <a href="#">
              <img
                src={gon.assets.wriLogo}
                width="142"
                className="logo"
                alt="World Resources Institute"
              />
            </a>
          </Card>
          <Card borderType={1}>
            <a href="#">
              <Title type="content">
                Framer assesses possible impacts of climate change on his crops
                (grapes)
              </Title>
            </a>
            <p className="content">
              Farmer X would need to understand how to best prepare for any
              future changes in climate that may impact his grapes. Based on key
              thresholds for climate variables of interest (temperature and
                precipitation), Farmer X evaluate the suitability to grow
                different types of grapes...
            </p>
            <a href="#">
              <img
                src={gon.assets.esriLogo}
                width="108"
                className="logo"
                alt="esri"
              />
            </a>
          </Card>
          <Card borderType={1}>
            <Title type="content">
              City Planner assesses possible impacts of Climate Change on Puget
              Sound’s built environment
            </Title>
            <p className="content">
              Most climate change effects are likely to increase the potential
              for damage to infrastructure and service disruptions (unplanned
              transportation closures, delays, or detours) in the Puget Sound
              region, although some risks may decrease.
            </p>
            <a href="#">
              <img
                src={gon.assets.nasaLogo}
                width="73"
                className="logo"
                alt="NASA"
              />
            </a>
          </Card>
          <div className="button-container">
            <Button borderType={2}>Show more results</Button>
          </div>
        </div>
      </div>

      <div className="other-links">
        <div className="wrapper">
          <div className="cards-container">
            <div className="card -map">
              <Title inverse center>Data on the map</Title>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
              <a href="">
                <Button color={1}>Explore the map</Button>
              </a>
            </div>
            <div className="card -image">
              <Title inverse center>Insights</Title>
              <p>
                Integer id placerat ligula, eget consequat sapien. Duis nec
                neque scelerisque
              </p>
              <a href="">
                <Button color={1}>Explore the insights</Button>
              </a>
            </div>
          </div>
        </div>
      </div>

      <div className="pre-header">
        <div className="wrapper">
          <div className="content -centered">
            <div>
              <Title inverse center>
                Do you have relevant data about climate?
              </Title>
              <a href="" className="button-container">
                <Button inverse borderType={1}>Create your dashboard</Button>
              </a>
            </div>
            <div>
              <Title inverse center>
                Would you like to improve a dashboard?
              </Title>
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
