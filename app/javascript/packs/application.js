// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'materialize-css/dist/js/materialize'

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function () {
  M.updateTextFields();

  let elems = document.querySelectorAll('.materialize-textarea')
  if (elems.length) {
    elems.forEach(elem => M.textareaAutoResize(elem))
  }
})

document.addEventListener('DOMContentLoaded', function() {
  const themeToggle = document.getElementById('theme-toggle');
  const themeIcon = document.getElementById('theme-icon');
  const body = document.body;

  // Función para aplicar el modo oscuro
  function enableDarkTheme() {
    body.classList.add('dark-theme');
    themeIcon.textContent = 'brightness_7'; // Icono de sol para modo claro
    localStorage.setItem('theme', 'dark');
  }

  // Función para aplicar el modo claro
  function enableLightTheme() {
    body.classList.remove('dark-theme');
    themeIcon.textContent = 'brightness_2'; // Icono de luna para modo oscuro
    localStorage.setItem('theme', 'light');
  }

  // Checar preferencia guardada y aplicar tema
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    enableDarkTheme();
  } else {
    enableLightTheme();
  }

  // Cambiar entre temas al hacer clic en el botón
  themeToggle.addEventListener('click', () => {
    if (body.classList.contains('dark-theme')) {
      enableLightTheme();
    } else {
      enableDarkTheme();
    }
  });
});
