import React from 'react';

export default function (props) {
  return (
    <div className="l-dashboards">
      <HeaderComponent small>
        <NavbarComponent currentPage={props.currentPage} />
        <TitleComponent inverse center borderType={1} type={'page'}>Dashboards</TitleComponent>
      </HeaderComponent>
      Welcome to the dashboards!

      <div className="other-links">
        <div className="wrapper">
          <div className="cards-container">
            <div className="card -map">
              <TitleComponent inverse center>Data on the map</TitleComponent>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
              <a href="">
                <ButtonComponent color={1}>Explore the map</ButtonComponent>
              </a>
            </div>
            <div className="card -image">
              <TitleComponent inverse center>Insights</TitleComponent>
              <p>Integer id placerat ligula, eget consequat sapien. Duis nec neque scelerisque</p>
              <a href="">
                <ButtonComponent color={1}>Explore the insights</ButtonComponent>
              </a>
            </div>
          </div>
        </div>
      </div>

      <div className="pre-header">
        <div className="wrapper">
          <div className="content">
            <div>
              <TitleComponent inverse center>Do you have relevant data about climate?</TitleComponent>
              <a href="" className="button-container">
                <ButtonComponent inverse borderType={1}>Create your dashboard</ButtonComponent>
              </a>
            </div>
            <div>
              <TitleComponent inverse center> Would you like to improve a dashboard?</TitleComponent>
              <a href="" className="button-container">
                <ButtonComponent inverse borderType={1}>Get in touch</ButtonComponent>
              </a>
            </div>
          </div>
        </div>
      </div>

      <FooterComponent />
    </div>
  );
}
