import React from 'react';
import { Link } from 'react-router';
import Card from '../cards/Card';
import Title from '../commons/Title';

function DashboardDetailIndicators(props) {
  let content = [];
  if (props.data) {
    props.data.forEach((card, index) => {
      content.push(
        <Card borderType={1} key={`card-${index}`}>
          <Link to={`/insights/${card.slug}`}>
            <Title type="content">
              {card.title}
            </Title>
          </Link>
          <p className="content">
            {card.content}
          </p>

          {card.partner &&
            <a target="_blank" href={card.partner.href}>
              <img
                src={gon.assets[card.partner.logo]}
                className="logo"
                alt={card.partner.name}
              />
            </a>
          }
        </Card>
      );
    });
  }
  return (
    <div className="cards">
      {content}
    </div>
  );
}

DashboardDetailIndicators.propTypes = {
  /**
   * Define dashboard indicators data
   */
  data: React.PropTypes.any.isRequired
};

export default DashboardDetailIndicators;
