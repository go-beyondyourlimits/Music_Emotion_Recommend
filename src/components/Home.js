import React from 'react';
import { Link } from 'react-router-dom';
import Header from './Header';

const HOME = () => {
  return (
    <React.Fragment>
      <Header />
      Goto <Link to="/dashboard">Search Page</Link>
    </React.Fragment>
  );
};

export default HOME;
