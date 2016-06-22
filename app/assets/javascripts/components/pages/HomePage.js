import React from 'react';
import Header from '../commons/Header';
import Navbar from '../commons/Navbar';
import Title from '../commons/Title';
import Footer from '../commons/Footer';

function HomePage(props) {
  return (
    <div>
      <Header type="large">
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
