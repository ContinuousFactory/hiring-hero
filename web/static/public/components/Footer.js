import React from 'react';
import { Row, Col } from 'antd';

const Footer = () => {
  return (
    <div>
      <Row className="public-footer">
        <Col span={3}>
        </Col>
        <Col span={18}>
          <p>Powered by Hiring Hero</p>
        </Col>
        <Col span={3}>
        </Col>
      </Row>
    </div>
  )
}

export default Footer;
