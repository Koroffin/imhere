module.exports = (grunt) ->
  pkg = grunt.file.readJSON "package.json"

  grunt.initConfig
    pkg: pkg

# shell commands here
    shell:
      start:
        command: () ->
          return "./node_modules/.bin/coffee -w server.coffee"

    compile:
      css: () ->
        return "echo '123'"

  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "grunt-spritesmith"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-string-replace"

  grunt.registerTask "start", [ "shell:start" ]
  grunt.registerTask "heroku:production", [ ]


