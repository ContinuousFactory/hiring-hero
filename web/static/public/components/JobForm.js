import React from 'react';
import { Form, Input, Icon, Select, Row, Col, Upload, Button } from 'antd';
const FormItem = Form.Item;
const Option = Select.Option;

const JobForm = Form.create()(React.createClass({
  handleSubmit(e) {
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        console.log('Received values of form: ', values);
      }
    });
  },

  checkConfirm(rule, value, callback) {
    const form = this.props.form;
    if (value && this.state.passwordDirty) {
      form.validateFields(['confirm'], { force: true });
    }
    callback();
  },

  normFile(e) {
    if (Array.isArray(e)) {
      return e;
    }
    return e && e.fileList;
  },

  render() {
    const { getFieldDecorator } = this.props.form;

    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 },
    };

    const tailFormItemLayout = {
      wrapperCol: {
        span: 14,
        offset: 6,
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
          label="Phone Number"
        >
          {getFieldDecorator('phone', {
            rules: [{ required: true, message: 'Please input your phone number!' }],
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
            <Upload name="logo" action="/upload.do" listType="picture" onChange={this.handleUpload}>
              <Button type="ghost">
                <Icon type="upload" /> Click to upload
              </Button>
            </Upload>
          )}
        </FormItem>

        <FormItem
          {...formItemLayout}
          label="Cover Letter"
          extra="Accept pdf/doc"
        >
          {getFieldDecorator('coverLetter', {
            valuePropName: 'fileList',
            normalize: this.normFile,
          })(
            <Upload name="logo" action="/upload.do" listType="picture" onChange={this.handleUpload}>
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

export default JobForm;
