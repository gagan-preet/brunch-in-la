exports.config =
  # See http://brunch.io/#documentation for docs.
  conventions:
    assets: /^app\/assets\//
  paths:
    public: 'public'
  plugins:
    jade:
      options:
        pretty: yes
    static_jade:
      extension:  ".jade"
      path:       [ /app/ ]
  files:
    javascripts:
      joinTo:
        'js/vendor.js': /^bower_components/
        'js/app.js': /^app\/live-scripts/
      order:
        before: [
          'bower_components/lodash/lodash.js'
          'bower_components/jquery/dist/jquery.js'
          'bower_components/angular/angular.js'
          'bower_components/angular-animate/angular-animate.js'
          'bower_components/angular-cookies/angular-cookies.js'
          'bower_components/angular-resource/angular-resource.js'
          'bower_components/angular-route/angular-route.js'
          'bower_components/angular-strap/angular-strap.js'
          'bower_components/bootstrap/dist/js/bootstrap.js'
          'app/live-scripts/angular/app.ls'
          'app/live-scripts/angular/services/Base64.ls'
          'app/live-scripts/angular/services/user.ls'
          'app/live-scripts/angular/services/authentication.ls'
          'app/live-scripts/angular/services/flash.ls'
        ]
    stylesheets:
      joinTo:
        'css/vendor.css': /^bower_components/
        'css/app.css': /^app\/styles/
      order:
        before: [
          'bower_components/bootstrap/dist/css/bootstrap.css'
          'bower_components/bootstrap/dist/css/bootstrap-theme.css'
          'bower_components/angular-motion/dist/angular-motion.css'
        ]
    templates:
      joinTo:
        'tpl/vendor.js': /^bower_components/
        'tpl/app.js': /^app\/views/
        'index.html': /^app/
      order:
        before:
          'bower_components/angular-strap/angular-strap.js'

  modules:
    definition: false
    wrapper: false
