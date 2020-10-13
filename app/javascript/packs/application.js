// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference

const { flash_info } = require("./flash_alert");

// that code so it'll be compiled.

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require jquery3
//= require jquery.turbolinks
//= require popper
//= require bootstrap
//= require bootstrap.min
//= require bootstrap-sprockets
//= require any
//= require sidebar
//= require item
//= require jquery.transit.min
//= require coffee
//= require_tree .
//= require_tree ./channels
//= require turbolinks

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("packs/sidebar");
require("packs/item");
flash_info();
import "bootstrap/dist/js/bootstrap";
import "@fortawesome/fontawesome-free/js/all";
import "../../../node_modules/@fortawesome/fontawesome-free/js/all";
import "bootstrap";
import "../stylesheets/application";

$(document).on("turbolinks:load", function () {
  var path = location.pathname;
  var page = path.substring(path.indexOf("/") + 1);
  var page1 = page.substring(0, page.indexOf("/"));
  if (page == "") {
    $(".side-1").addClass("active");
  } else if (page == "users" || page1 == "users") {
    $(".side-2").addClass("active");
  } else if (page == "brands" || page1 == "brands") {
    $(".side-3").addClass("active");
  } else if ((page == "categories" || page1 == "categories") && !page.includes("storage")) {
    $(".side-4").addClass("active");
  } else if (page == "items" || page1 == "items") {
    $(".side-5").addClass("active");  
  } else if (page.includes("storage")) {
    $(".side-6").addClass("active");
  } else if (page == "notifications" || page1 == "notifications") {
    $(".side-7").addClass("active");
  } else if (page == "issues" || page1 == "issues") {
    $(".side-8").addClass("active");
  }
});
