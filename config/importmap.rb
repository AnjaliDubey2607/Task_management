# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'jquery', to: 'https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js'
pin 'bootstrap', to: 'https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js'
