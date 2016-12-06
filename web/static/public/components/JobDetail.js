import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Row, Col, Spin, Button, Icon } from 'antd';
import ReactHtmlParser from 'react-html-parser';
import { BackTop } from 'antd';
import { Link } from 'react-router';

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
            <hr />
            <Row>
              <Col span={24}>
                <h3>{currentJob.title}</h3>
                at <strong>{company.name}</strong> <Link to={`/companies/${company.subdomain}`}>(View all jobs)</Link>
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
