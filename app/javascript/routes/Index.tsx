import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Home from '../components/Home';
import Upload from '../pages/Upload';

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/uploads" exact component={Upload} />
    </Switch>
  </Router>
);
