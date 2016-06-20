import React from 'react';
import Footer from '../containers/Footer';

export default function (props) {
  return (
    <div>
      <HeaderComponent currentPage={props.currentPage} dark/>
        Welcome to the homepage!
      <Footer />
    </div>
  );
}
