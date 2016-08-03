# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.find_by_email("admin@example.com" ) || AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


# Insights
insight1 = Insight.find_by_slug("climate-adaption-knowlegde-exchange") || Insight.create!(
  title: 'Framer assesses possible impacts of climate change on his crops (grapes)',
  slug: 'climate-adaption-knowlegde-exchange',
  summary: 'Farmer X would need to understand how to best prepare for any future changes in climate that may impact his grapes. Based on key thresholds for climate variables of interest (temperature and precipitation), Farmer X evaluate the suitability to grow different types of grapes...',
  content: 'Access adaptation case studies, virtual library resources, a directory of adaptation practitioners, and a database of relevant tools on this comprehensive website. Users can also participate in community forums or contribute resources.',
  partner_id: 2,
  published: true,
  image: File.new("db/fixtures/images/headers/bg-insights-image@2x.jpg"),
  content_url: 'http://resource-watch.github.io/insights/interactive-map.html')
insight2 = Insight.find_by_slug("city-planner-climage-impact-on-puget") || Insight.create!(
  title: 'City Planner assesses possible impacts of Climate Change on Puget Sound’s built environment',
  slug: 'city-planner-climage-impact-on-puget',
  summary: 'Most climate change effects are likely to increase the potential for damage to infrastructure and service disruptions (unplanned transportation closures, delays, or detours) in the Puget Sound region, although some risks may decrease.',
  content: 'Access adaptation case studies, virtual library resources, a directory of adaptation practitioners, and a database of relevant tools on this comprehensive website. Users can also participate in community forums or contribute resources.',
  partner_id: 3,
  published: true,
  image: File.new("db/fixtures/images/headers/bg-insights-image@2x.jpg"),
  content_url: 'http://resource-watch.github.io/insights/interactive-edi.html')

insightSonoma = Insight.find_by_slug("understanding-sonoma-countys-climate-adaptation-plan") || Insight.create!(
  title: 'Understanding Sonoma County\'s Climate Adaptation Plan',
  slug: 'understanding-sonoma-countys-climate-adaptation-plan',
  summary: 'Unprecedented warm conditions are projected to occur in both summer and winter seasons. Both extreme wet years and extreme dry years are likely to become more frequent. Preparing for the impacts of this increase weather variability is critically important.',
  content: '',
  published: true,
  image: File.new("db/fixtures/images/headers/bg-sonoma-header.png"),
  content_url: 'http://resource-watch.github.io/insights/sonoma.html')


# Tools
tool1 = Tool.find_by_title("Climate Adaptation Knowledge Exchange (CAKE)") || Tool.create!(
  title: 'Climate Adaptation Knowledge Exchange (CAKE)',
  summary: 'Access adaptation case studies, virtual library resources, a directory of adaptation practitioners, and a database of relevant tools on this comprehensive website. Users can also participate in community forums or contribute resources.',
  url: 'http://www.wri.org/')
tool2 = Tool.find_by_title("AdaptWest Climate Adaptation Planning Database") || Tool.create!(
  title: 'AdaptWest Climate Adaptation Planning Database',
  summary: 'Access adaptation case studies, virtual library resources, a directory of adaptation practitioners, and a database of relevant tools on this comprehensive website. Users can also participate in community forums or contribute resources.',
  url: 'https://www.nasa.gov/')


# Partners
Partner.find_by_name("Vizzuality") || Partner.create!(
  name: 'Vizzuality',
  url: 'http://vizzuality.com',
  contact_name: 'Vizzuality',
  contact_email: 'contact@vizzuality.com',
  logo: File.new("db/fixtures/images/partner/vizzuality@2x.png"),
  white_logo: File.new("db/fixtures/images/partner/vizzuality-light@2x.png"),
  published: true)
Partner.find_by_name("WRI") || Partner.create!(
  name: 'WRI',
  url: 'http://www.wri.org/',
  contact_name: 'WRI',
  contact_email: 'contact@wri.com',
  logo: File.new("db/fixtures/images/partner/wri@2x.png"),
  white_logo: File.new("db/fixtures/images/partner/wri-light@2x.png"),
  published: true)
Partner.find_by_name("Nasa") || Partner.create!(
  name: 'Nasa',
  url: 'https://www.nasa.gov/',
  contact_name: 'Nasa',
  contact_email: 'contact@nasa.gov',
  logo: File.new("db/fixtures/images/partner/nasa@2x.png"),
  white_logo: File.new("db/fixtures/images/partner/nasa-light@2x.png"),
  published: true)
Partner.find_by_name("Washington University") || Partner.create!(
  name: 'Washington University',
  url: 'http://www.washington.edu/',
  contact_name: 'UW',
  contact_email: 'contact@uw.edu',
  logo: File.new("db/fixtures/images/partner/university-washington@2x.png"),
  white_logo: File.new("db/fixtures/images/partner/university-washington-light@2x.png"),
  published: true)
Partner.find_by_name("Descartes") || Partner.create!(
  name: 'Descartes',
  url: 'http://www.descarteslabs.com/',
  contact_name: 'DL',
  contact_email: 'contact@descarteslabs.com',
  logo: File.new("db/fixtures/images/partner/descartes@2x.png"),
  white_logo: File.new("db/fixtures/images/partner/descartes-light@2x.png"),
  published: true)
Partner.find_by_name("Esri") || Partner.create!(
  name: 'Esri',
  url: 'http://www.esri.com/',
  contact_name: 'ES',
  contact_email: 'contact@esri.com',
  logo: File.new("db/fixtures/images/partner/esri@2x.png"),
  white_logo: File.new("db/fixtures/images/partner/esri-light@2x.png"),
  published: true)


# Widgets
widget1 = Widget.find_by_slug("temperature-change") || Widget.create!(
  title: 'Temperature change',
  slug: 'temperature-change',
  summary: 'Relative to 1950-199 average',
  content: 'Lorem ipsum annual precipitation (in %) for the Puget Sound Lowlands climate division shown relative to the average for 1950-1999 (black horizontal line corresponding 43.6 inches). The dashed line indicating a warming of +1.3ºF (range: +0.7ºF to +1.9ºF)ß from 1895 to 2014. ',
  data_url: 'http://api.resourcewatch.org:81/documentation/#/?tags=Dataset',
  published: true,
  widget_config: '{
    "padding": {"top": 30,"left": 40,"bottom": 80,"right": 30},
    "data": [
      {
        "name": "line-1",
        "values": [{"x":1900,"y":50},{"x":1901,"y":47},{"x":1902,"y":51},{"x":1903,"y":46},{"x":1904,"y":48},{"x":1905,"y":50},{"x":1906,"y":47},{"x":1907,"y":50},{"x":1908,"y":53},{"x":1909,"y":47},{"x":1910,"y":54},{"x":1911,"y":47},{"x":1912,"y":47},{"x":1913,"y":50},{"x":1914,"y":50},{"x":1915,"y":50},{"x":1916,"y":51},{"x":1917,"y":53},{"x":1918,"y":48},{"x":1919,"y":48},{"x":1920,"y":52},{"x":1921,"y":54},{"x":1922,"y":49},{"x":1923,"y":51},{"x":1924,"y":47},{"x":1925,"y":53},{"x":1926,"y":49},{"x":1927,"y":48},{"x":1928,"y":46},{"x":1929,"y":47},{"x":1930,"y":47},{"x":1931,"y":46},{"x":1932,"y":52},{"x":1933,"y":49},{"x":1934,"y":53},{"x":1935,"y":52},{"x":1936,"y":52},{"x":1937,"y":48},{"x":1938,"y":50},{"x":1939,"y":52},{"x":1940,"y":51},{"x":1941,"y":52},{"x":1942,"y":51},{"x":1943,"y":47},{"x":1944,"y":51},{"x":1945,"y":49},{"x":1946,"y":50},{"x":1947,"y":51},{"x":1948,"y":48},{"x":1949,"y":47},{"x":1950,"y":50},{"x":1951,"y":52},{"x":1952,"y":48},{"x":1953,"y":50},{"x":1954,"y":51},{"x":1955,"y":48},{"x":1956,"y":48},{"x":1957,"y":46},{"x":1958,"y":50},{"x":1959,"y":52},{"x":1960,"y":49},{"x":1961,"y":50},{"x":1962,"y":54},{"x":1963,"y":49},{"x":1964,"y":50},{"x":1965,"y":53},{"x":1966,"y":51},{"x":1967,"y":50},{"x":1968,"y":53},{"x":1969,"y":48},{"x":1970,"y":49},{"x":1971,"y":54},{"x":1972,"y":51},{"x":1973,"y":49},{"x":1974,"y":46},{"x":1975,"y":47},{"x":1976,"y":47},{"x":1977,"y":46},{"x":1978,"y":53},{"x":1979,"y":52},{"x":1980,"y":51},{"x":1981,"y":49},{"x":1982,"y":46},{"x":1983,"y":53},{"x":1984,"y":50},{"x":1985,"y":47},{"x":1986,"y":52},{"x":1987,"y":54},{"x":1988,"y":49},{"x":1989,"y":52},{"x":1990,"y":51},{"x":1991,"y":51},{"x":1992,"y":54},{"x":1993,"y":46},{"x":1994,"y":51},{"x":1995,"y":48},{"x":1996,"y":50},{"x":1997,"y":52},{"x":1998,"y":50},{"x":1999,"y":53}],
        "format": {"parse": {"x": "date"}}
      },
      {
        "name": "stats",
        "source": "line-1",
        "transform": [
          {
            "type": "aggregate",
            "summarize": {
              "x": ["mean", "variance", "count"],
              "y": ["mean"]
            }
          }
        ]
      },
      {
        "name": "regression",
        "source": "line-1",
        "transform": [
          {
            "type": "cross",
            "with": "stats"
          },
          {
            "type": "formula",
            "field": "precovariance",
            "expr": "(datum.a.x - datum.b.mean_x) * (datum.a.y - datum.b.mean_y) / datum.b.count_x"
          },
          {
            "type": "aggregate",
            "summarize": {
              "precovariance": ["sum"]
            }
          },
          {
            "type": "formula",
            "field": "covariance",
            "expr": "datum.sum_precovariance"
          },
          {
            "type": "cross",
            "with": "stats"
          },
          {
            "type": "formula",
            "field": "a_factor",
            "expr": "datum.a.covariance / datum.b.variance_x"
          },
          {
            "type": "formula",
            "field": "b_factor",
            "expr": "datum.b.mean_y - datum.a_factor * datum.b.mean_x"
          },
          {
            "type": "cross",
            "with": "line-1"
          },
          {
            "type": "formula",
            "field": "y",
            "expr": "datum.a.a_factor * datum.b.x + datum.a.b_factor"
          },
          {
            "type": "formula",
            "field": "x",
            "expr": "datum.b.x"
          }
        ]
      },
      {
        "name": "axis",
        "values": [{"x": "Year","y": "Number of days exceeding"}]
      },
      {
        "name": "legend-1",
        "values": [
          {
            "name": "Annual air temperature",
            "color": "#e05757"
          }
        ]
      },
      {
        "name": "legend-2",
        "values": [{"name": "Trend","color": "#263e57"}]
      },
      {
        "name": "legend-3",
        "values": [{"name": "Average","color": "#000"}]
      }
    ],
    "scales": [
      {
        "name": "x",
        "type": "time",
        "range": "width",
        "domain": {"data": "line-1","field": "x"}
      },
      {
        "name": "y",
        "type": "linear",
        "range": "height",
        "domain": {"data": "line-1","field": "y"},
        "nice": true,
        "zero": false
      }
    ],
    "axes": [
      {
        "name": "lbl",
        "type": "x",
        "scale": "x",
        "ticks": 5,
        "format": "%Y",
        "properties": {
          "ticks": {"strokeWidth": {"value": 0}},
          "axis": {
            "stroke": {"value": "#3B4F63"},
            "opacity": {"value": 0.5},
            "strokeWidth": {"value": 0}
          },
          "labels": {
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 300},
            "fill": {"value": "#3B4F63"},
            "opacity": {"value": 0.5},
            "dy": {"value": 5}
          }
        }
      },
      {
        "type": "y",
        "ticks": 7,
        "scale": "y",
        "grid": true,
        "layer": "back",
        "format": "f",
        "properties": {
          "ticks": {"stroke": {"value": "steelblue"}},
          "majorTicks": {"strokeWidth": {"value": 0}},
          "axis": {
            "stroke": {"value": "#333"},
            "strokeWidth": {"value": 0}
          },
          "grid": {
            "stroke": {"value": "#000"},
            "strokeOpacity": {"value": 0.1},
            "strokeWidth": {"value": 1}
          },
          "labels": {
            "fontSize": {"value": 10},
            "fontWeight": {"value": 300},
            "fill": {"value": "#3B4F63"},
            "opacity": {"value": 0.5}
          }
        }
      }
    ],
    "marks": [
      {
        "type": "line",
        "from": {"data": "line-1"},
        "properties": {
          "enter": {
            "x": {"scale": "x","field": "x"},
            "y": {"scale": "y","field": "y"},
            "stroke": {"value": "#e05757"},
            "strokeWidth": {"value": 3}
          }
        }
      },
      {
        "type": "rule",
        "from": {"data": "stats"},
        "properties": {
          "enter": {
            "x": {"value": 0},
            "x2": {"field": {"group": "width"}},
            "y": {"scale": "y", "field": "mean_y"},
            "stroke": {"value": "#000"},
            "strokeWidth": {"value": 2},
            "strokeOpacity": {"value": 0.5}
          }
        }
      },
      {
        "type": "line",
        "from": {"data": "regression"},
        "properties": {
          "enter": {
            "x": {"scale": "x","field": "x"},
            "y": {"scale": "y","field": "y"},
            "stroke": {"value": "#263e57"},
            "strokeWidth": {"value": 2},
            "opacity": {"value": 0.3}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "axis"},
        "properties": {
          "enter": {
            "x": 0,
            "y": 0,
            "text": {"template": "{{datum.y | upper}}"},
            "dx": {"value": -25},
            "dy": {"value": -20},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3B4F63"},
            "opacity": {"value": 0.5},
            "align": {"value": "left"}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "axis"},
        "properties": {
          "enter": {
            "x": 0,
            "y": {"field": {"group": "height"},"mult": 1},
            "text": {"template": "{{datum.x | upper}}"},
            "dx": {"value": -25},
            "dy": {"value": 22},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3B4F63"},
            "opacity": {"value": 0.5},
            "align": {"value": "left"}
          }
        }
      },
      {
        "type": "rect",
        "from": {"data": "legend-1"},
        "properties": {
          "enter": {
            "x": {"value": -25},
            "y": {
              "field": {"group": "height"},
              "mult": 1,
              "offset": 44
            },
            "width": {"value": 9},
            "y2": {
              "field": {"group": "height"},
              "mult": 1,
              "offset": 47
            },
            "fill": {"field": "color"}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "legend-1"},
        "properties": {
          "enter": {
            "x": 0,
            "y": {"field": {"group": "height"},"mult": 1},
            "text": {"template": "{{datum.name | upper}}"},
            "dx": {"value": -9},
            "dy": {"value": 50},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3b4f63"},
            "opacity": {"value": 0.7},
            "align": {"value": "left"}
          }
        }
      },
      {
        "type": "rule",
        "from": {"data": "legend-2"},
        "properties": {
          "enter": {
            "x": {
              "field": {"group": "width"},
              "mult": 0.333,
              "offset": 0
            },
            "y": {
              "field": {"group": "height"},
              "mult": 1,
              "offset": 46
            },
            "x2": {
              "field": {"group": "width"},
              "mult": 0.333,
              "offset": 9
            },

            "stroke": {"field": "color"},
            "strokeWidth": {"value": 3},
            "opacity": {"value": 0.3}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "legend-2"},
        "properties": {
          "enter": {
            "x": {
              "field": {"group": "width"},
              "mult": 0.333,
              "offset": 0
            },
            "y": {"field": {"group": "height"},"mult": 1},
            "text": {"template": "{{datum.name | upper}}"},
            "dx": {"value": 16},
            "dy": {"value": 50},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3b4f63"},
            "opacity": {"value": 0.7},
            "align": {"value": "left"}
          }
        }
      },
      {
        "type": "rule",
        "from": {"data": "legend-3"},
        "properties": {
          "enter": {
            "x": {
              "field": {"group": "width"},
              "mult": 0.666,
              "offset": 0
            },
            "y": {
              "field": {"group": "height"},
              "mult": 1,
              "offset": 46
            },
            "x2": {
              "field": {"group": "width"},
              "mult": 0.666,
              "offset": 9
            },

            "stroke": {"field": "color"},
            "strokeWidth": {"value": 3}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "legend-3"},
        "properties": {
          "enter": {
            "x": {
              "field": {"group": "width"},
              "mult": 0.666,
              "offset": 0
            },
            "y": {"field": {"group": "height"},"mult": 1},
            "text": {"template": "{{datum.name | upper}}"},
            "dx": {"value": 16},
            "dy": {"value": 50},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3b4f63"},
            "opacity": {"value": 0.7},
            "align": {"value": "left"}
          }
        }
      }
    ]
  }',
  partner_id: 1)
widget2 = Widget.find_by_slug("precipitation-change") || Widget.create!(
  title: 'Precipitation change',
  slug: 'precipitation-change',
  summary: 'Relative to 1950-199 average',
  content: 'Lorem ipsum annual precipitation (in %) for the Puget Sound Lowlands climate division shown relative to the average for 1950-1999 (black horizontal line corresponding 43.6 inches). The dashed line indicating a warming of +1.3ºF (range: +0.7ºF to +1.9ºF)ß from 1895 to 2014. ',
  data_url: 'http://api.resourcewatch.org:81/documentation/#/?tags=Dataset',
  published: true,
  widget_config: '{
    "padding": {"top": 30,"left": 40,"bottom": 80,"right": 30},
    "data": [
      {
        "name": "line-1",
        "values": [{"x":1900,"y":51},{"x":1901,"y":52},{"x":1902,"y":46},{"x":1903,"y":49},{"x":1904,"y":46},{"x":1905,"y":54},{"x":1906,"y":49},{"x":1907,"y":47},{"x":1908,"y":51},{"x":1909,"y":46},{"x":1910,"y":47},{"x":1911,"y":47},{"x":1912,"y":47},{"x":1913,"y":52},{"x":1914,"y":49},{"x":1915,"y":52},{"x":1916,"y":46},{"x":1917,"y":49},{"x":1918,"y":54},{"x":1919,"y":48},{"x":1920,"y":49},{"x":1921,"y":46},{"x":1922,"y":49},{"x":1923,"y":49},{"x":1924,"y":46},{"x":1925,"y":46},{"x":1926,"y":54},{"x":1927,"y":46},{"x":1928,"y":52},{"x":1929,"y":52},{"x":1930,"y":51},{"x":1931,"y":54},{"x":1932,"y":52},{"x":1933,"y":48},{"x":1934,"y":47},{"x":1935,"y":48},{"x":1936,"y":47},{"x":1937,"y":51},{"x":1938,"y":49},{"x":1939,"y":53},{"x":1940,"y":48},{"x":1941,"y":48},{"x":1942,"y":51},{"x":1943,"y":47},{"x":1944,"y":47},{"x":1945,"y":50},{"x":1946,"y":46},{"x":1947,"y":54},{"x":1948,"y":53},{"x":1949,"y":50},{"x":1950,"y":48},{"x":1951,"y":46},{"x":1952,"y":53},{"x":1953,"y":49},{"x":1954,"y":54},{"x":1955,"y":46},{"x":1956,"y":52},{"x":1957,"y":46},{"x":1958,"y":54},{"x":1959,"y":54},{"x":1960,"y":49},{"x":1961,"y":53},{"x":1962,"y":52},{"x":1963,"y":53},{"x":1964,"y":51},{"x":1965,"y":46},{"x":1966,"y":52},{"x":1967,"y":50},{"x":1968,"y":50},{"x":1969,"y":54},{"x":1970,"y":47},{"x":1971,"y":50},{"x":1972,"y":49},{"x":1973,"y":50},{"x":1974,"y":47},{"x":1975,"y":46},{"x":1976,"y":53},{"x":1977,"y":49},{"x":1978,"y":47},{"x":1979,"y":48},{"x":1980,"y":49},{"x":1981,"y":50},{"x":1982,"y":53},{"x":1983,"y":50},{"x":1984,"y":48},{"x":1985,"y":49},{"x":1986,"y":51},{"x":1987,"y":54},{"x":1988,"y":53},{"x":1989,"y":54},{"x":1990,"y":52},{"x":1991,"y":51},{"x":1992,"y":50},{"x":1993,"y":53},{"x":1994,"y":47},{"x":1995,"y":54},{"x":1996,"y":49},{"x":1997,"y":52},{"x":1998,"y":46},{"x":1999,"y":46}],
        "format": {"parse": {"x": "date"}}
      },
      {
        "name": "stats",
        "source": "line-1",
        "transform": [
          {
            "type": "aggregate",
            "summarize": {
              "x": ["mean", "variance", "count"],
              "y": ["mean"]
            }
          }
        ]
      },
      {
        "name": "regression",
        "source": "line-1",
        "transform": [
          {
            "type": "cross",
            "with": "stats"
          },
          {
            "type": "formula",
            "field": "precovariance",
            "expr": "(datum.a.x - datum.b.mean_x) * (datum.a.y - datum.b.mean_y) / datum.b.count_x"
          },
          {
            "type": "aggregate",
            "summarize": {
              "precovariance": ["sum"]
            }
          },
          {
            "type": "formula",
            "field": "covariance",
            "expr": "datum.sum_precovariance"
          },
          {
            "type": "cross",
            "with": "stats"
          },
          {
            "type": "formula",
            "field": "a_factor",
            "expr": "datum.a.covariance / datum.b.variance_x"
          },
          {
            "type": "formula",
            "field": "b_factor",
            "expr": "datum.b.mean_y - datum.a_factor * datum.b.mean_x"
          },
          {
            "type": "cross",
            "with": "line-1"
          },
          {
            "type": "formula",
            "field": "y",
            "expr": "datum.a.a_factor * datum.b.x + datum.a.b_factor"
          },
          {
            "type": "formula",
            "field": "x",
            "expr": "datum.b.x"
          }
        ]
      },
      {
        "name": "axis",
        "values": [{"x": "Year","y": "Number of days exceeding"}]
      },
      {
        "name": "legend-1",
        "values": [
          {
            "name": "Annual air temperature",
            "color": "#e05757"
          }
        ]
      },
      {
        "name": "legend-2",
        "values": [{"name": "Trend","color": "#263e57"}]
      },
      {
        "name": "legend-3",
        "values": [{"name": "Average","color": "#000"}]
      },
      {
        "name": "axis",
        "values": [{"x": "Year","y": "Number of days exceeding"}]
      },
      {
        "name": "legend-1",
        "values": [
          {
            "name": "Total precipitation",
            "color": "#008ec4"
          }
        ]
      },
      {
        "name": "legend-2",
        "values": [{"name": "Trend","color": "#263e57"}]
      },
      {
        "name": "legend-3",
        "values": [{"name": "Average","color": "#000"}]
      }
    ],
    "scales": [
      {
        "name": "x",
        "type": "time",
        "range": "width",
        "domain": {"data": "line-1","field": "x"}
      },
      {
        "name": "y",
        "type": "linear",
        "range": "height",
        "domain": {"data": "line-1","field": "y"},
        "nice": true,
        "zero": false
      }
    ],
    "axes": [
      {
        "name": "lbl",
        "type": "x",
        "scale": "x",
        "ticks": 5,
        "format": "%Y",
        "properties": {
          "ticks": {"strokeWidth": {"value": 0}},
          "axis": {
            "stroke": {"value": "#3B4F63"},
            "opacity": {"value": 0.5},
            "strokeWidth": {"value": 0}
          },
          "labels": {
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 300},
            "fill": {"value": "#3B4F63"},
            "opacity": {"value": 0.5},
            "dy": {"value": 5}
          }
        }
      },
      {
        "type": "y",
        "ticks": 7,
        "scale": "y",
        "grid": true,
        "layer": "back",
        "format": "f",
        "properties": {
          "ticks": {"stroke": {"value": "steelblue"}},
          "majorTicks": {"strokeWidth": {"value": 0}},
          "axis": {
            "stroke": {"value": "#333"},
            "strokeWidth": {"value": 0}
          },
          "grid": {
            "stroke": {"value": "#000"},
            "strokeOpacity": {"value": 0.1},
            "strokeWidth": {"value": 1}
          },
          "labels": {
            "fontSize": {"value": 10},
            "fontWeight": {"value": 300},
            "fill": {"value": "#3B4F63"},
            "opacity": {"value": 0.5}
          }
        }
      }
    ],
    "marks": [
      {
        "type": "line",
        "from": {"data": "line-1"},
        "properties": {
          "enter": {
            "x": {"scale": "x","field": "x"},
            "y": {"scale": "y","field": "y"},
            "stroke": {"value": "#008ec4"},
            "strokeWidth": {"value": 3}
          }
        }
      },
       {
        "type": "rule",
        "from": {"data": "stats"},
        "properties": {
          "enter": {
            "x": {"value": 0},
            "x2": {"field": {"group": "width"}},
            "y": {"scale": "y", "field": "mean_y"},
            "stroke": {"value": "#000"},
            "strokeWidth": {"value": 2},
            "strokeOpacity": {"value": 0.5}
          }
        }
      },
      {
        "type": "line",
        "from": {"data": "regression"},
        "properties": {
          "enter": {
            "x": {"scale": "x","field": "x"},
            "y": {"scale": "y","field": "y"},
            "stroke": {"value": "#263e57"},
            "strokeWidth": {"value": 2},
            "opacity": {"value": 0.3}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "axis"},
        "properties": {
          "enter": {
            "x": 0,
            "y": 0,
            "text": {"template": "{{datum.y | upper}}"},
            "dx": {"value": -25},
            "dy": {"value": -20},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3B4F63"},
            "opacity": {"value": 0.5},
            "align": {"value": "left"}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "axis"},
        "properties": {
          "enter": {
            "x": 0,
            "y": {"field": {"group": "height"},"mult": 1},
            "text": {"template": "{{datum.x | upper}}"},
            "dx": {"value": -25},
            "dy": {"value": 22},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3B4F63"},
            "opacity": {"value": 0.5},
            "align": {"value": "left"}
          }
        }
      },
      {
        "type": "rect",
        "from": {"data": "legend-1"},
        "properties": {
          "enter": {
            "x": {"value": -25},
            "y": {
              "field": {"group": "height"},
              "mult": 1,
              "offset": 44
            },
            "width": {"value": 9},
            "y2": {
              "field": {"group": "height"},
              "mult": 1,
              "offset": 47
            },
            "fill": {"field": "color"}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "legend-1"},
        "properties": {
          "enter": {
            "x": 0,
            "y": {"field": {"group": "height"},"mult": 1},
            "text": {"template": "{{datum.name | upper}}"},
            "dx": {"value": -9},
            "dy": {"value": 50},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3b4f63"},
            "opacity": {"value": 0.7},
            "align": {"value": "left"}
          }
        }
      },
      {
        "type": "rule",
        "from": {"data": "legend-2"},
        "properties": {
          "enter": {
            "x": {
              "field": {"group": "width"},
              "mult": 0.333,
              "offset": 0
            },
            "y": {
              "field": {"group": "height"},
              "mult": 1,
              "offset": 46
            },
            "x2": {
              "field": {"group": "width"},
              "mult": 0.333,
              "offset": 9
            },

            "stroke": {"field": "color"},
            "strokeWidth": {"value": 3},
            "opacity": {"value": 0.3}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "legend-2"},
        "properties": {
          "enter": {
            "x": {
              "field": {"group": "width"},
              "mult": 0.333,
              "offset": 0
            },
            "y": {"field": {"group": "height"},"mult": 1},
            "text": {"template": "{{datum.name | upper}}"},
            "dx": {"value": 16},
            "dy": {"value": 50},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3b4f63"},
            "opacity": {"value": 0.7},
            "align": {"value": "left"}
          }
        }
      },
      {
        "type": "rule",
        "from": {"data": "legend-3"},
        "properties": {
          "enter": {
            "x": {
              "field": {"group": "width"},
              "mult": 0.666,
              "offset": 0
            },
            "y": {
              "field": {"group": "height"},
              "mult": 1,
              "offset": 46
            },
            "x2": {
              "field": {"group": "width"},
              "mult": 0.666,
              "offset": 9
            },

            "stroke": {"field": "color"},
            "strokeWidth": {"value": 3}
          }
        }
      },
      {
        "type": "text",
        "from": {"data": "legend-3"},
        "properties": {
          "enter": {
            "x": {
              "field": {"group": "width"},
              "mult": 0.666,
              "offset": 0
            },
            "y": {"field": {"group": "height"},"mult": 1},
            "text": {"template": "{{datum.name | upper}}"},
            "dx": {"value": 16},
            "dy": {"value": 50},
            "font": {"value": "\"Montserrat\", sans-serif"},
            "fontSize": {"value": 10},
            "fontWeight": {"value": 700},
            "fill": {"value": "#3b4f63"},
            "opacity": {"value": 0.7},
            "align": {"value": "left"}
          }
        }
      }
    ]
  }',
  partner_id: 2)
widget3 = Widget.find_by_slug("sonoma-widget") || Widget.create!(
  title: 'Sonoma widget',
  slug: 'sonoma-widget',
  summary: 'Sonoma widget',
  content: 'Lorem ipsum annual precipitation (in %) for the Puget Sound Lowlands climate division shown relative to the average for 1950-1999 (black horizontal line corresponding 43.6 inches). The dashed line indicating a warming of +1.3ºF (range: +0.7ºF to +1.9ºF)ß from 1895 to 2014. ',
  published: true,
  widget_config: {},
  partner_id: 2)


# Indicators
indicator1 = Indicator.find_by_title("Indicator widget example") || Indicator.create!(
  id: 1,
  title: 'Indicator widget example',
  summary: 'This is a collection of widgets example',
  content: 'The Puget Sound region has experienced long-term warming, a lengthening of the frost-free season, and more frequent nighttime heat waves.')

indicator1.widgets << widget1
indicator1.widgets << widget2

indicatorSonoma = Indicator.find_by_title("Sonoma") || Indicator.create!(
  id: 2,
  title: 'Sonoma',
  summary: 'Sonoma indicators',
  content: 'This contains the list of the sonoma widgets')

indicatorSonoma.widgets << widget3

# Dashboards
dashboard = Dashboard.find_by_slug("city-planner-assesses-possible-impacts") || Dashboard.create!(
  title: 'City Planner assesses possible impacts of Climate Change on Puget Sound’s built environment',
  slug: 'city-planner-assesses-possible-impacts',
  summary: 'Most climate change effects are likely to increase the potential for damage to infrastructure and service disruptions (unplanned transportation closures, delays, or detours) in the Puget Sound region, although some risks may decrease.',
  content: 'Lorem ipsum annual precipitation (in %) for the Puget Sound Lowlands climate division shown relative to the average for 1950-1999 (black horizontal line corresponding 43.6 inches). The dashed line indicating a warming of +1.3ºF (range: +0.7ºF to +1.9ºF)ß from 1895 to 2014. ',
  indicator_id: 1,
  partner_id: 3,
  image: File.new("db/fixtures/images/headers/bg-dashboards-map@2x.png"),
  published: true)

  dashboard.indicator = indicator1
  dashboard.insights << insight1
  dashboard.insights << insight2
  dashboard.tools << tool1
  dashboard.tools << tool2

dashboard = Dashboard.find_by_slug("understanding-sonoma-countys-climate-adaptation-plan") || Dashboard.create!(
  title: 'Understanding Sonoma County\'s Climate Adaptation Plan',
  slug: 'understanding-sonoma-countys-climate-adaptation-plan',
  summary: 'Unprecedented warm conditions are projected to occur in both summer and winter seasons. Both extreme wet years and extreme dry years are likely to become more frequent. Preparing for the impacts of this increase weather variability is critically important.',
  content: 'Lorem ipsum annual precipitation (in %) for the Puget Sound Lowlands climate division shown relative to the average for 1950-1999 (black horizontal line corresponding 43.6 inches). The dashed line indicating a warming of +1.3ºF (range: +0.7ºF to +1.9ºF)ß from 1895 to 2014. ',
  indicator_id: 2,
  image: File.new("db/fixtures/images/headers/bg-sonoma-header.png"),
  published: true)

  dashboard.indicator = indicatorSonoma
  dashboard.insights << insightSonoma
  dashboard.tools << tool1
  dashboard.tools << tool2
