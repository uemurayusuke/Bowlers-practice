// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// 新たに記述
import jQuery from "jquery"
import "popper.js"
import "bootstrap"
import "../stylesheets/application"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// 新たに記述
global.$ = jQuery;
window.$ = jQuery;

$(function(){
  setTimeout("$('.notice').fadeOut('slow')", 3000);
});
$(function(){
  setTimeout("$('.alert').fadeOut('slow')", 3000);
});