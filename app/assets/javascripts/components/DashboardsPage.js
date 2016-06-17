import React from 'react';
import Footer from '../containers/Footer';
import Title from '../containers/Title';

export default function () {
  return (
    <div className="l-dashboards">
      Welcome to the dashboards!

      <div className="pre-header">
        <div className="wrapper">
          <div className="content">
            <div>
              <Title inverse center>Do you have relevant data about climate?</Title>
            </div>
            <div>
              <Title inverse center>Would you like to improve a dashboard?</Title>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
}
