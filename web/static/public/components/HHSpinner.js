import React from 'react';
import { Row, Col, Spin } from 'antd';

const HHSpinner = () => {
  return (
    <div className="hh-spinner">
      <br />
      <Row>
        <Col span={12} offset={12}>
          <Spin tip="Loading..." size="large"/>
        </Col>
      </Row>
    </div>
  )
}

export default HHSpinner;
