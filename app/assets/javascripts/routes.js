'use strict';

import React, {Component} from 'react';
import {connect} from 'react-redux';
import AppContainer from './containers/app';
import {Router, Route} from 'react-router';

class Routes extends Component{
  render(){
    return (
      <Router history={this.props.history}>
        <Route path="/" component={AppContainer}>
        </Route>
      </Router>
    );
  }
}

let mapStateToProps = state => ({});
let mapDispatchToProps = dispatch => ({});

export default connect(mapStateToProps, mapDispatchToProps)(Routes);
