import React from 'react';
import Footer from '../containers/Footer';
import Title from '../containers/Title';
import Button from '../containers/Button';

export default function () {
  return (
    <div className="l-dashboards">
      Welcome to the dashboards!

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
              <p>Integer id placerat ligula, eget consequat sapien. Duis nec neque scelerisque</p>
              <a href="">
                <Button color={1}>Explore the insights</Button>
              </a>
            </div>
          </div>
        </div>
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
