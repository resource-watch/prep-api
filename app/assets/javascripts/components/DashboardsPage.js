import React from 'react';
import Footer from '../containers/Footer';
import Title from '../containers/Title';
import Button from '../containers/Button';

export default function () {
  return (
    <div className="l-dashboards">
      Welcome to the dashboards!

      <div className="pre-header">
        <div className="wrapper">
          <div className="content">
            <div>
              <Title inverse center>Do you have relevant data about climate?</Title>
              <Button inverse borderType={1}>Create your dashboard</Button>
            </div>
            <div>
              <Title inverse center>Would you like to improve a dashboard?</Title>
              <Button inverse borderType={1}>Get in touch</Button>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
}
