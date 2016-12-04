import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Row, Col, Spin } from 'antd';

import fetchCompany from '../actions';

class PublicApp extends Component {
  componentDidMount() {
    const subdomain = window.location.pathname.split("/")[2];
    this.props.fetchCompany(subdomain);
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
        <Row>
          <Col span={3}></Col>
          <Col span={18}>
            <Row>
              <Col span={18}>
                <h1>{company.name}</h1>
              </Col>
              <Col span={6}>
                <br />
                <p><img src={company.logo} alt="" width="80%"/></p>
              </Col>
            </Row>
          </Col>
          <Col span={3}></Col>
        </Row>
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
