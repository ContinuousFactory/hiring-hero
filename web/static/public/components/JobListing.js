import React from 'react';
import { Row, Col } from 'antd';
import ReactHtmlParser from 'react-html-parser';

const JobListing = ({jobs}) => {
  const jobsListing = jobs.map((job) => {
    return (
      <Row key={job.id}>
        <Col span={3}></Col>
        <Col span={18}>
          <h4>{job.title}</h4>
          {ReactHtmlParser(job.description)}
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
