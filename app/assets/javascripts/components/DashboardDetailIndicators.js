import React from 'react';
import Title from './Title';
import MapCard from './MapCard';
import Map from './Map';

function DashboardDetailIndicators() {
  return (
    <div className="l-indicators">
      <Title center borderType={1}>
        Observed temperature Changes in Puget Sound
      </Title>
      <MapCard title="Skagit River Near Mount Vernon">
        <Map />
      </MapCard>
    </div>
  );
}

DashboardDetailIndicators.propTypes = { };

export default DashboardDetailIndicators;
