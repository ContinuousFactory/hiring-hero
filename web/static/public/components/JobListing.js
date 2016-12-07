import React from 'react';
import { Row, Col, Tag } from 'antd';
import { Link } from 'react-router'

const JobListing = ({jobs, subdomain, company}) => {
  const jobsListing = jobs.map((job) => {
    return (
      <Row key={job.id}>
        <Col span={3}></Col>
        <Col span={18} className="hh-job-row">
          <h4>
            <Link to={`/companies/${subdomain}/jobs/${job.id}`}>{job.title}</Link>&nbsp;
            <Tag color="#fd905f"> {job.type} </Tag>
          </h4>
        </Col>
        <Col span={3}></Col>
      </Row>
    );
  });

  return (
    <div>
      <Row>
        <Col span={18} offset={3}>
          <hr />
          <h3>Current Jobs Opening at {company.name}</h3>
        </Col>
      </Row>
      {jobsListing}
    </div>
  )
}

export default JobListing;
