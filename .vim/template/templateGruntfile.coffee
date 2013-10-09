lrSnippet   = require('grunt-contrib-livereload/lib/utils').livereloadSnippet
mountFolder = (connect, dir) ->
  connect.static(require('path').resolve(dir))

module.exports = (grunt) ->
  for pkg in require('matchdep').filterDev('grunt-*')
    grunt.loadNpmTasks(pkg)

  grunt.initConfig
    meta: grunt.file.readJSON('package.json')
    config:
      src:  'src'
      dist: 'dist'
      test: 'test'
      tmp:  '.tmp'

    watch:
      coffee:
        files: [
          "<%= config.src %>/coffee/**/*.coffee"
        ]
        tasks: ['coffee']

  grunt.renameTask('regarde', 'watch')

  grunt.registerTask 'js', [
    'coffeelint'
    'coffee:app'
  ]
  
  grunt.registerTask 'default', ['build']

