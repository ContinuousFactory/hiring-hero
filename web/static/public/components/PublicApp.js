import React, { Component } from 'react';
import { Row, Col, Spin } from 'antd';
import { connect } from 'react-redux';

import Header from './Header';
import JobListing from './JobListing';
import Footer from './Footer';

class PublicApp extends Component {
  render() {
    const company = this.props.companies[0];

    if (company === null || company === undefined) {
      return (
        <Spin tip="Loading..." size="large"/>
      )
    }

    return (
      <div>
        <Header company={company} />
        <JobListing jobs={company.jobs} subdomain={this.props.params.subdomain} company={company}/>
        <Footer />
      </div>
    );
  }
};

function mapStateToProps({ companies }){
  return { companies };
}

const EnhancedPublicApp = connect(mapStateToProps, null)(PublicApp);

export default EnhancedPublicApp;
