import React from 'react';
import Header from '../commons/Header';
import Navbar from '../commons/Navbar';
import Title from '../commons/Title';
import Footer from '../commons/Footer';
import ChartCard from '../cards/ChartCard';
import Map from '../commons/Map';
import Button from '../commons/Button';

function HomePage(props) {
  return (
    <div className="l-homepage">
      <Header type="large">
        <Navbar currentPage={props.currentPage} />
        <Title inverse borderType={1} type={'mega'}>
          Enabling collective action to manage climate risks
        </Title>
      </Header>

      <div className="wrapper">
        <section className="homepage-mission">
          <div className="content">
            <Title borderType={1} type="section">
              Our mission
            </Title>
            <p>
              The C-PREP platform seeks to help planners, investors, and
              resource managers around the globe rapidly assess and incorporate
              climate risks into their decisions by enhancing access to the best
              available data, and insights on climate change. It leverages
              innovations in information and communication technologies to
              strengthen climate risks assessments and resilience planning.
            </p>
          </div>
          <div className="floating-card">
            <img
              src={gon.assets.homeAccessible}
              alt="Accessible, authoritative assessments"
            />
            <Title borderType={1} type="section">
              Accessible, authoritative assessments
            </Title>
            <p>
              This platform supports a next generation of living climate
              assessment and resilience plans. It provides access to relevant
              data, tools and case studies from authoritative sources, and
              allows you to seamlessly incorporate your own local content,
              regardless of scale. Create unique data visualizations or explore
              those created by others to easily disseminate and discover climate
              risk data.
            </p>
          </div>
        </section>
      </div>

      <section className="background-image"></section>

      <div className="wrapper">
        <section className="homepage-problem">
          <div className="content">
            <Title
              borderType={2}
              type="section"
              subtitle={{
                title: 'Go to insights',
                href: '/insights'
              }}
            >
              Understanding the problem
            </Title>
            <p className="text">
              Around the world, there is a growing recognition that, no matter
              what steps may be taken to control greenhouse gas emissions, we
              must prepare for the impacts of greater climate variability and
              change. Municipalities are making commitments to take action under
              the Paris Agreement and the UN Sustainable Development Goals. To
              facilitate a clear path forward, we must increase access to robust
              and actionable information, give guidance on using data to manage
              risks, and make the results easy to understand and share.
            </p>
            <div className="indicators">
              <div className="indicator">
                <h3 className="name">Global temperature</h3>
                <div className="value">1.4<sup>ºF</sup></div>
                <div className="context">Since 1880</div>
              </div>
              <div className="separator"></div>
              <div className="indicator">
                <h3 className="name">Carbon Dioxide</h3>
                <div className="value">402.56</div>
                <div className="context">Parts per million</div>
              </div>
              <div className="separator"></div>
              <div className="indicator">
                <h3 className="name">Sea Level</h3>
                <div className="value">3.39</div>
                <div className="context">mm per year</div>
              </div>
            </div>
            <div className="insight">
              <img src={gon.assets.homeUnderstanding} alt="New York" />
              <a href="#">Go to New York City insight</a>
            </div>
          </div>
        </section>
      </div>

      <section className="homepage-analysis">
        <div className="wrapper">
          <div className="content">
            <Title
              borderType={1}
              type="section"
              subtitle={{
                title: 'Go to dashboards',
                href: '/dashboards'
              }}
            >
              Urgent and accurate analysis
            </Title>
            <p className="text">
              Dashboards give rapid insights on climate risk indicators, showing
              the most pressing issues and the impacts of actions taken against
              them. View some of the dashboards that users have already
              submitted, suggest edits or create your own to highlight key
              issues in your area.
            </p>
          </div>
          <div className="cards">
            <div className="card -big">
              <ChartCard
                title="Lorem ipsum dolor set"
                subtitle="water"
                data={{}}
              />
            </div>
            <div className="card">
              <ChartCard
                title="Lorem ipsum dolor set"
                subtitle="water"
                data={{}}
              />
            </div>
            <div className="card">
              <ChartCard
                title="Ipsum alerts"
                subtitle="Forest"
                data={{}}
              />
            </div>
          </div>
          <div className="link">
            <a href="#">Go to New York City dashboard</a>
          </div>
        </div>
      </section>

      <div className="wrapper">
        <section className="homepage-map">
          <Title
            borderType={3}
            type="section"
            subtitle={{
              title: 'Go to data',
              href: '/data'
            }}
          >
            Explore the latest data
          </Title>
          <p className="text">
            Interact with national, regional, and local data on this web map.
            Filter by topic, projection models, and an area of impact to
            create a custom map within seconds.  When you’re ready, publish or
            share your findings to raise awareness in your community.
          </p>
          <div className="map">
            <Map data={{}} />
          </div>
        </section>
      </div>

      <section className="homepage-contact">
        <div className="wrapper">
          <div className="container">
            <div className="content">
              <Title
                inverse
                borderType={1}
                type="section"
              >
                We want to hear from you
              </Title>
              <p className="text">
                C-PREP aims to enhance access to climate risk data, and can only
                achieve that with thorough feedback from users like you. <br />
                Interested in formally joining the collaboration? Please contact
                us here.
              </p>
            </div>
            <form className="contact-box">
              <input type="email" placeholder="your@email.org" className="email" />
              <textarea placeholder="Your message here" className="message"></textarea>
              <Button fill borderType={1}>Send message</Button>
            </form>
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
}

HomePage.propTypes = {
  /**
   * Define the route path (from the router)
   */
  currentPage: React.PropTypes.string,
};

export default HomePage;
