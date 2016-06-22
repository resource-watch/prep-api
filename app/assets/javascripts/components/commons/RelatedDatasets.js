import Title from './Title';

export default function () {
  return (
    <div className="c-related-datasets">
      <div className="wrapper">
        <Title borderType={1}>Related datasets</Title>
        <div className="datasets">
          <div className="dataset">
            <div className="title">
              <a href="#">Intact forest landscapes</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">WRI</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Environmental democracy index</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">NASA</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Epidemic</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">Open Weather Map</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Aqueduct: Water stress projections</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">USGS</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Intact forest landscapes</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">WRI</a>
            </div>
          </div>
          <div className="dataset">
            <div className="title">
              <a href="#">Environmental democracy index</a>
            </div>
            <div className="links">
              <a href="#">CSV</a>
              <a href="#">IUCN</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
