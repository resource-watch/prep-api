import React from 'react';

export default function (props) {
  return (
    <div className="l-dashboards">
      <HeaderComponent small>
        <NavbarComponent currentPage={props.currentPage} />
        <TitleComponent inverse center borderType={1} type="page"> Dashboards </TitleComponent>
      </HeaderComponent>

      <div className="wrapper">
        <div className="cards">
          <CardComponent borderType={1}>
            <a href="#">
              <TitleComponent type="content">
                Framer assesses possible impacts of climate change on his crops (grapes)
              </TitleComponent>
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
                src="/logos/university-washington@2x.png"
                className="logo -washington"
                alt="University of Washington"
              />
            </a>
          </CardComponent>
          <CardComponent borderType={1}>
            <TitleComponent type="content">
              City Planner assesses possible impacts of Climate Change on Puget
              Sound’s built environment
            </TitleComponent>
            <p className="content">
              Most climate change effects are likely to increase the potential
              for damage to infrastructure and service disruptions (unplanned
              transportation closures, delays, or detours) in the Puget Sound
              region, although some risks may decrease.
            </p>
            <a href="#">
              <img
                src="/logos/university-washington@2x.png"
                className="logo -washington"
                alt="University of Washington"
              />
            </a>
          </CardComponent>
          <CardComponent borderType={1}>
            <TitleComponent type="content">
              City Planner assesses possible impacts of Climate Change on Puget
              Sound’s built environment
            </TitleComponent>
            <p className="content">
              Most climate change effects are likely to increase the potential
              for damage to infrastructure and service disruptions (unplanned
              transportation closures, delays, or detours) in the Puget Sound
              region, although some risks may decrease.
            </p>
            <a href="#">
              <img
                src="/logos/nasa@2x.png"
                className="logo -nasa"
                alt="NASA"
              />
            </a>
          </CardComponent>
          <CardComponent borderType={1}>
            <a href="#">
              <TitleComponent type="content">
                Framer assesses possible impacts of climate change on his crops (grapes)
              </TitleComponent>
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
                src="/logos/wri@2x.png"
                className="logo -wri"
                alt="World Resources Institute"
              />
            </a>
          </CardComponent>
          <CardComponent borderType={1}>
            <a href="#">
              <TitleComponent type="content">
                Framer assesses possible impacts of climate change on his crops (grapes)
              </TitleComponent>
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
                src="/logos/esri@2x.png"
                className="logo -esri"
                alt="esri"
              />
            </a>
          </CardComponent>
          <CardComponent borderType={1}>
            <TitleComponent type="content">
              City Planner assesses possible impacts of Climate Change on Puget
              Sound’s built environment
            </TitleComponent>
            <p className="content">
              Most climate change effects are likely to increase the potential
              for damage to infrastructure and service disruptions (unplanned
              transportation closures, delays, or detours) in the Puget Sound
              region, although some risks may decrease.
            </p>
            <a href="#">
              <img
                src="/logos/nasa@2x.png"
                className="logo -nasa"
                alt="NASA"
              />
            </a>
          </CardComponent>
          <div className="button-container">
            <ButtonComponent borderType={2}>Show more results</ButtonComponent>
          </div>
        </div>
      </div>

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
