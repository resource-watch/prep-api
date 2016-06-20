import React from 'react';
import Header from './Header';
import Navbar from './Navbar';
import Title from './Title';
import Footer from './Footer';

function HomePage(props) {
  return (
    <div>
      <Header>
        <Navbar currentPage={props.currentPage} />
        <Title inverse borderType={1} type={'mega'}>
          Enabling collective action to manage climate risks
        </Title>
      </Header>
        Welcome to the homepage!
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
