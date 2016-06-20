import React from 'react';
import Navbar from './Navbar';

export default function (props) {
  return (
    <div>
      <HeaderComponent>
        <Navbar currentPage={props.currentPage} />
        <TitleComponent inverse borderType={1} type={'mega'}>
          Enabling collective action to manage climate risks
        </TitleComponent>
      </HeaderComponent>
        Welcome to the homepage!
      <FooterComponent />
    </div>
  );
}
