import React from 'react';
import MapCard from './MapCard';
import ChartCard from './ChartCard';

function DashboardDetailIndicators() {
  const vegaSpec ={
    'padding': {'top': 60,'left': 40,'bottom': 80,'right': 30},
    'data': [
      {
        'name': 'line',
        'values': [
          {'x': '1990','y': 27},
          {'x': '1991','y': 30},
          {'x': '1992','y': 32},
          {'x': '1993','y': 29},
          {'x': '1994','y': 29},
          {'x': '1995','y': 26},
          {'x': '1996','y': 27},
          {'x': '1997','y': 30},
          {'x': '1998','y': 28},
          {'x': '1999','y': 35},
          {'x': '2000','y': 37},
          {'x': '2001','y': 34},
          {'x': '2002','y': 35},
          {'x': '2003','y': 36},
          {'x': '2004','y': 37},
          {'x': '2005','y': 34},
          {'x': '2006','y': 33},
          {'x': '2007','y': 32},
          {'x': '2008','y': 34},
          {'x': '2009','y': 30},
          {'x': '2010','y': 29},
          {'x': '2011','y': 29}
        ],
        'format': {'parse': {'x': 'date'}}
      },
      {
        'name': 'area',
        'values': [
          {'x': '1990','y': 22},
          {'x': '1991','y': 28},
          {'x': '1992','y': 29},
          {'x': '1993','y': 27},
          {'x': '1994','y': 25},
          {'x': '1995','y': 24},
          {'x': '1996','y': 23},
          {'x': '1997','y': 24},
          {'x': '1998','y': 26},
          {'x': '1999','y': 30},
          {'x': '2000','y': 37},
          {'x': '2001','y': 36},
          {'x': '2002','y': 37},
          {'x': '2003','y': 34},
          {'x': '2004','y': 32},
          {'x': '2005','y': 29},
          {'x': '2006','y': 28},
          {'x': '2007','y': 28},
          {'x': '2008','y': 29},
          {'x': '2009','y': 28},
          {'x': '2010','y': 27},
          {'x': '2011','y': 26}
        ],
        'format': {'parse': {'x': 'date'}}
      },
      {
        'name': 'axis',
        'values': [
          {'x': 'Year', 'y': 'Number of days exceeding'}
        ]
      },
      {
        'name': 'legend-1',
        'values': [
          {'name': 'Variability in precipitation', 'color': '#fff'}
        ]
      },
      {
        'name': 'legend-2',
        'values': [
          {'name': 'Precipitation average', 'color': '#F0C452'}
        ]
      }
    ],
    'scales': [
      {
        'name': 'x',
        'type': 'time',
        'range': 'width',
        'domain': {'data': 'line','field': 'x'}
      },
      {
        'name': 'y',
        'type': 'linear',
        'range': 'height',
        'domain': {'data': 'line','field': 'y'},
        'nice': true
      }
    ],
    'axes': [
      {
        'name': 'lbl',
        'type': 'x',
        'scale': 'x',
        'ticks': 5,
        'format': '%Y',
        'properties': {
          'ticks': {'strokeWidth': {'value': 0}},
          'axis': {
            'stroke': {'value': '#3B4F63'},
            'opacity': {'value': 0.5},
            'strokeWidth': {'value': 0}
          },
          'labels': {
            'font': {'value': '\'Montserrat\', sans-serif'},
            'fontSize': {'value': 10},
            'fontWeight': {'value': 300},
            'fill': {'value': '#3B4F63'},
            'opacity': {'value': 0.5},
            'dy': {'value': 5}
          }
        }
      },
      {
        'type': 'y',
        'ticks': 7,
        'scale': 'y',
        'grid': true,
        'layer': 'back',
        'format': 'f',
        'properties': {
          'ticks': {'stroke': {'value': 'steelblue'}},
          'majorTicks': {'strokeWidth': {'value': 0}},
          'axis': {
            'stroke': {'value': '#333'},
            'strokeWidth': {'value': 0}
          },
          'grid': {
            'stroke': {'value': '#000'},
            'strokeOpacity': {'value': 0.1},
            'strokeWidth': {'value': 1}
          },
          'labels': {
            'fontSize': {'value': 10},
            'fontWeight': {'value': 300},
            'fill': {'value': '#3B4F63'},
            'opacity': {'value': 0.5}
          }
        }
      }
    ],
    'marks': [
      {
        'type': 'area',
        'from': {'data': 'area'},
        'properties': {
          'enter': {
            'x': {'scale': 'x','field': 'x'},
            'y': {'scale': 'y','field': 'y'},
            'y2': {'scale': 'y','value': '0'},
            'fill': {'value': '#000'},
            'opacity': {'value': 0.07}
          }
        }
      },
      {
        'type': 'line',
        'from': {'data': 'line'},
        'properties': {
          'enter': {
            'x': {'scale': 'x','field': 'x'},
            'y': {'scale': 'y','field': 'y'},
            'stroke': {'value': '#fff'},
            'strokeWidth': {'value': 3}
          }
        }
      },
      {
        'type': 'text',
        'from': {'data': 'axis'},
        'properties': {
          'enter': {
            'x': 0,
            'y': 0,
            'text': { 'template': '{{datum.y | upper}}' },
            'dx': {'value': -25},
            'dy': {'value': -20},
            'font': {'value': '\'Montserrat\', sans-serif'},
            'fontSize': {'value': 10},
            'fontWeight': {'value': 700},
            'fill': {'value': '#3B4F63'},
            'opacity': {'value': 0.5},
            'align': {'value': 'left'}
          }
        }
      },
      {
        'type': 'text',
        'from': {'data': 'axis'},
        'properties': {
          'enter': {
            'x': 0,
            'y': {
              'field': {'group': 'height'},
              'mult': 1
            },
            'text': { 'template': '{{datum.x | upper}}' },
            'dx': {'value': -25},
            'dy': {'value': 22},
            'font': {'value': '\'Montserrat\', sans-serif'},
            'fontSize': {'value': 10},
            'fontWeight': {'value': 700},
            'fill': {'value': '#3B4F63'},
            'opacity': {'value': 0.5},
            'align': {'value': 'left'}
          }
        }
      },
      {
        'type': 'rect',
        'from': {'data': 'legend-1'},
        'properties': {
          'enter': {
            'x': {'value': -25},
            'y': {
              'field': {'group': 'height'},
              'mult': 1,
              'offset': 44
            },
            'width': {'value': 9},
            'y2': {
              'field': {'group': 'height'},
              'mult': 1,
              'offset': 47
            },
            'fill': {'field': 'color'}
          }
        }
      },
      {
        'type': 'text',
        'from': {'data': 'legend-1'},
        'properties': {
          'enter': {
            'x': 0,
            'y': {
              'field': {'group': 'height'},
              'mult': 1
            },
            'text': {'template': '{{datum.name | upper}}'},
            'dx': {'value': -9},
            'dy': {'value': 50},
            'font': {'value': '\'Montserrat\', sans-serif'},
            'fontSize': {'value': 10},
            'fontWeight': {'value': 700},
            'fill': {'value': '#3b4f63'},
            'opacity': {'value': 0.7},
            'align': {'value': 'left'}
          }
        }
      },
      {
        'type': 'rect',
        'from': {'data': 'legend-2'},
        'properties': {
          'enter': {
            'x': {
              'field': {'group': 'width'},
              'mult': 0.5,
              'offset': 0
            },
            'y': {
              'field': {'group': 'height'},
              'mult': 1,
              'offset': 44
            },
            'width': {'value': 9},
            'y2': {
              'field': {'group': 'height'},
              'mult': 1,
              'offset': 47
            },
            'fill': {'field': 'color'}
          }
        }
      },
      {
        'type': 'text',
        'from': {'data': 'legend-2'},
        'properties': {
          'enter': {
            'x': {
              'field': {'group': 'width'},
              'mult': 0.5,
              'offset': 0
            },
            'y': {
              'field': {'group': 'height'},
              'mult': 1
            },
            'text': {'template': '{{datum.name | upper}}'},
            'dx': {'value': 16},
            'dy': {'value': 50},
            'font': {'value': '\'Montserrat\', sans-serif'},
            'fontSize': {'value': 10},
            'fontWeight': {'value': 700},
            'fill': {'value': '#3b4f63'},
            'opacity': {'value': 0.7},
            'align': {'value': 'left'}
          }
        }
      }
    ]
  };

  return (
    <div className="indicators">
      <MapCard
        title="Skagit River Near Mount Vernon"
        data={{}}
      />
      <ChartCard
        title="Vega chart"
        subtitle="Vega subtitle chart"
        data={vegaSpec}
      />
    </div>
  );
}

DashboardDetailIndicators.propTypes = { };

export default DashboardDetailIndicators;
