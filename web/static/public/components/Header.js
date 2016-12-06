import React from 'react';
import { Row, Col, Button, Icon } from 'antd';
import { Link } from 'react-router';

const Header = ({company}) => {
  return (
    <Row>
      <Col span={3}></Col>
      <Col span={18}>
        <Row>
          <Col span={20}>
            <h1>{company.name}</h1>
            <h5>{company.tagline}</h5>
            <Link to={company.website} target="_blank">{company.website}</Link>
            <p>
              <Link to={company.linkedin} target="_blank">
                <i className="fa fa-linkedin-square hh-social-button"></i>
              </Link>

              <Link to={company.facebook} target="_blank">
                <i className="fa fa-facebook-official hh-social-button"></i>
              </Link>

              <Link to={company.twitter} target="_blank">
                <i className="fa fa-twitter hh-social-button"></i>
              </Link>

              <Link to={company.github} target="_blank">
                <i className="fa fa-github hh-social-button"></i>
              </Link>
            </p>
          </Col>
          <Col span={4}>
            <br />
            <p><img src={company.logo} alt="" width="100%"/></p>
          </Col>
        </Row>
      </Col>
      <Col span={3}></Col>
    </Row>
  )
}

export default Header;
