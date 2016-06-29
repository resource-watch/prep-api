import React from 'react';
import Header from '../commons/Header';
import Navbar from '../commons/Navbar';
import Title from '../commons/Title';
import Footer from '../commons/Footer';

/* Both emails are encoded with ROT13 */
const FrancisEmail = 'stnffreg@jev.bet';
const AnaEmail = 'nan@pyvzngrqngnfbyhgvbaf.pbz';

/* Helper used to decode ROT13-encoded strings */
function decodeRot13(str) {
  return str.replace(/[a-zA-Z]/g, c => {
    const base = c <= 'Z' ? 90 : 122;
    const char = c.charCodeAt(0) + 13;
    return String.fromCharCode(base >= char ? char : char - 26);
  });
}

function ContactPage(props) {
  return (
    <div className="l-contact">
      <Header type="small">
        <Navbar currentPage={props.currentPage} />
        <Title inverse center borderType={1} type="page">
          Contact
        </Title>
      </Header>

      <div className="wrapper">

        <div className="text-content">
          <p>
            <b>This website is under development.</b><br />
            Please reach out to&nbsp;
            <a href={`mailto:${decodeRot13(FrancisEmail)}`}>Francis</a>
            &nbsp;or&nbsp;
            <a href={`mailto:${decodeRot13(AnaEmail)}`}>Ana</a>
            &nbsp;to learn more.
          </p>
        </div>

      </div>

      <Footer />
    </div>
  );
}

ContactPage.propTypes = {
  /**
   * Define the route path (from the router)
   */
  currentPage: React.PropTypes.string,
};

export default ContactPage;
