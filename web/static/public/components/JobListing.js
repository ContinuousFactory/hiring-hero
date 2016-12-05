import React from 'react';
import { Row, Col } from 'antd';
import { Link } from 'react-router'

const JobListing = ({jobs, subdomain}) => {
  const jobsListing = jobs.map((job) => {
    return (
      <Row key={job.id}>
        <Col span={3}></Col>
        <Col span={18}>
          <h4>
            <Link to={`/companies/${subdomain}/jobs/${job.id}`}>{job.title}</Link>
          </h4>
        </Col>
        <Col span={3}></Col>
      </Row>
    );
  });

  return (
    <div>
      {jobsListing}
    </div>
  )
}

export default JobListing;
