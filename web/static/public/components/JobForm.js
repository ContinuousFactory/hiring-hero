import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Form, Input, Icon, Select, Row, Col, Upload, Button, message } from 'antd';
const FormItem = Form.Item;
const Option = Select.Option;

import { submitResume } from '../actions';

const JobForm = Form.create()(React.createClass({
  handleSubmit(e) {
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        this.props.submitResume(values, this.props.job.id, this.props.company.id);
      }
    });
  },

  normFile(e) {
    if (Array.isArray(e)) {
      return e;
    }
    return e && e.fileList;
  },

  beforeUpload(file){
    const isPdf = file.type === 'application/pdf';
    if (!isPdf) {
      message.error('You can only upload PDF file!');
    }

    const validSize = file.size < 5242880;
    if (!validSize) {
      message.error('You can only upload PDF file less than 5Mb!');
    }

    return isPdf && validSize;
  },

  render() {
    const { getFieldDecorator } = this.props.form;

    const formItemLayout = {
        labelCol: { span: 4 },
      wrapperCol: { span: 14 },
    };

    const tailFormItemLayout = {
      wrapperCol: {
        span: 14,
        offset: 4,
      },
    };

    return (
      <Form horizontal onSubmit={this.handleSubmit}>
        <FormItem
          {...formItemLayout}
          label="First Name"
          hasFeedback
        >
          {getFieldDecorator('firstName', {
            rules: [{ required: true, message: 'Please input your first name!'}],
          })(
            <Input />
          )}
        </FormItem>

        <FormItem
          {...formItemLayout}
          label="E-mail"
          hasFeedback
        >
          {getFieldDecorator('email', {
            rules: [{
              type: 'email', message: 'The input is not valid E-mail!',
            }, {
              required: true, message: 'Please input your E-mail!',
            }],
          })(
            <Input />
          )}
        </FormItem>

        <FormItem
          {...formItemLayout}
          label="Resume/CV"
          extra="Accept pdf/doc"
        >
          {getFieldDecorator('resume', {
            valuePropName: 'fileList',
            normalize: this.normFile,
          })(
            <Upload
              name="logo"
              action="/upload.do"
              listType="picture"
              onChange={this.handleUpload}
              beforeUpload={this.beforeUpload}
              >
              <Button type="ghost">
                <Icon type="upload" /> Click to upload
              </Button>
            </Upload>
          )}
        </FormItem>

        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit" size="large">Submit</Button>
        </FormItem>
      </Form>
    );
  },
}));

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ submitResume }, dispatch);
}

const EnhancedJobForm = connect(null, mapDispatchToProps)(JobForm);

export default EnhancedJobForm;
