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
import "bootstrap-fileinput"
import "trix"
import "fullcalendar"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import Post from './components/Post';
import React from 'react';
import ReactDOM from 'react-dom';

if (document.querySelector('.dashboard-react')) {
  ReactDOM.render(<Post />, document.querySelector('.dashboard-react'));
}

$(document).ready(function() {
  $('#calendar').fullCalendar({
    weekends: false
  });

  $('#candidate_document, #user_avatar, #user_my_organisation_logo').fileinput({
    'showUpload': false
  });
  $('.dropdown-toggle').dropdown();
});
