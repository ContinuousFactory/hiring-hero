import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Row, Col, Spin } from 'antd';

import fetchCompany from '../actions';
import Header from './Header';
import JobListing from './JobListing';

class PublicApp extends Component {
  componentDidMount() {
    this.props.fetchCompany(this.props.params.subdomain);
  }

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
        <JobListing jobs={company.jobs} />
      </div>
    );
  }
};

function mapStateToProps({ companies }){
  return { companies };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchCompany }, dispatch);
}

const EnhancedPublicApp = connect(mapStateToProps, mapDispatchToProps)(PublicApp);

export default EnhancedPublicApp;
