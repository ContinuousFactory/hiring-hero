import React from 'react';
import { Row, Col } from 'antd';

const Footer = () => {
  return (
    <div>
      <Row>
        <Col span={3}>
        </Col>
        <Col span={18} className="public-footer">
          <p>Powered by Hiring Hero</p>
        </Col>
        <Col span={3}>
        </Col>
      </Row>
    </div>
  )
}

export default Footer;
