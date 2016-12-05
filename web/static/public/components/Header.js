import React from 'react';
import { Row, Col } from 'antd';

const Header = ({company}) => {
  return (
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
  )
}

export default Header;
