module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')

    coffee:
      build:
        files:
          "build/js/script.js" : "src/js/script.coffee"

    uglify:
      build:
        files:
          "build/js/lib.js" : [
            "bower_components/jquery/dist/jquery.js"
            "bower_components/jquery-throttle-debounce/jquery.ba-throttle-debounce.js"
            "bower_components/purl/purl.js"
            "bower_components/zeroclipboard/ZeroClipboard.js"
          ]

    sass:
      build:
        files:
          "tmp/css/style.css" : "src/css/style.sass"

    autoprefixer:
      build:
        src: "tmp/css/style.css"
        dest: "build/css/style.css"

    connect:
      server:
        options:
          port: 5000
          hostname: "localhost"
          base: "build"
          livereload: true

    watch:
      coffee:
        files: ["src/js/script.coffee"]
        tasks: ["coffee:build"]
      sass:
        files: ["src/css/*.sass"]
        tasks: ["sass:build"]
      autoprefixer:
        files: ["tmp/css/styles.css"]
        tasks: ["autoprefixer:build"]
      reload:
        files: ["build/*.html","build/js/script.js"]
        options: {livereload: true}
      livereload:
        files: ["build/css/styles.css"]
        options: {livereload: true}
  }

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask 'default', ['connect', 'watch']
