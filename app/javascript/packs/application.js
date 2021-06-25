	// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import {filterByType} from "../components/categoryButton"
import {filterDropdown} from "../components/filterDropdown"
import {filterByCategory} from "../components/filterCategories"
import {filterByCountry} from "../components/filterCountry"
import {filterByYear} from "../components/filterYear"
// import { initSelect2 } from '../components/init_select2';
// import { initCarrousel } from "../components/carrousel";


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // initCarrousel();
  if (document.getElementById('list1')) {
    filterDropdown('list1');
    filterDropdown('list3');
    filterDropdown('list4');
  }
  filterByType();
  filterByCategory();
  filterByCountry();
  filterByYear();
});


import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "A nice alert",
  text: "This is a great alert, isn't it?",
  icon: "success"
});
