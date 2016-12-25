// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "bootstrap"
import "phoenix_html"
import "bootstrap-material-design"
import "bootstrap-fileinput"
import "bootstrap-daterangepicker"
import "trix"
import "./jquery.dropdown"

import Vue from "./vue.common"
import Vuex from 'vuex'
import Board from './components/Board.vue'
import { Button } from 'element-ui'

Vue.use(Vuex)
Vue.component("el-button", Button)

new Vue({
  el: '#wrapper',
  components: {
    Board
  }
})

$(document).ready(function() {
  $('#candidate_document, #user_avatar, #user_my_organisation_logo').fileinput({
    'showUpload': false
  });
  $('.dropdown-toggle').dropdown();
  $('.datepicker').daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    timePicker: true,
    timePickerIncrement: 30,
    applyClass: 'btn-raised btn-primary',
    cancelClass: 'btn-raised',
    locale: {
      format: 'MM/DD/YYYY h:mm A'
    }
  });
  $(".hh-select").dropdown({ "optionClass": "withripple" });
  $.material.init();
});
