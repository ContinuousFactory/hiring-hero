import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchCompany } from '../actions';

class PublicLayout extends Component {
  componentDidMount() {
    this.props.fetchCompany(this.props.params.subdomain);
  }

  render(){
    return (
      this.props.children
    )
  }
}

function mapStateToProps({ companies }){
  return { companies };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchCompany }, dispatch);
}

const EnhancedPublicLayout = connect(mapStateToProps, mapDispatchToProps)(PublicLayout);

export default EnhancedPublicLayout;
