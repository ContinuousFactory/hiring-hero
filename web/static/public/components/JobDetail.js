import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Row, Col, Spin } from 'antd';
import ReactHtmlParser from 'react-html-parser';
import { BackTop } from 'antd';

import Header from './Header';
import Footer from './Footer';
import HHSpinner from './HHSpinner';
import JobForm from './JobForm';

class JobDetail extends Component {
  render() {
    const company = this.props.companies[0];

    if (company === null || company === undefined) {
      return (
        <HHSpinner />
      )
    }

    const jobs = company.jobs;
    const jobId = jobs.findIndex((job)=> job.id === parseInt(this.props.params.jobId));
    const currentJob = jobs[jobId];

    return (
      <div>
        <Header company={company} />
        <Row>
          <Col span={3}></Col>
          <Col span={18}>
            <Row>
              <Col span={24}>
                <h4>{currentJob.title}</h4>
                {ReactHtmlParser(currentJob.description)}
              </Col>
            </Row>

            <br />
            <Row>
              <Col span={18}>
                <JobForm />
              </Col>
            </Row>
          </Col>
          <Col span={3}></Col>
        </Row>

        <Footer />
        <BackTop />
      </div>
    );
  }
}

function mapStateToProps({ companies }){
  return { companies };
}

const EnhancedJobDetail = connect(mapStateToProps, null)(JobDetail);

export default EnhancedJobDetail;
