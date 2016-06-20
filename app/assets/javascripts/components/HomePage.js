import React from 'react';

export default function (props) {
  return (
    <div>
      <HeaderComponent>
        <NavbarComponent currentPage={props.currentPage} />
        <TitleComponent inverse borderType={1} type={'mega'}>Enabling collective action to manage climate risks</TitleComponent>
      </HeaderComponent>
        Welcome to the homepage!
      <FooterComponent />
    </div>
  );
}
