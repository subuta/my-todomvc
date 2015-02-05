'use strict';

var gulp = require('gulp');

var paths = gulp.paths;

gulp.task('watch', ['inject'], function () {
  gulp.watch([
    paths.src + '/{,styles}/**/*.scss',
    paths.src + '/{,views}/**/*.slim',
    paths.src + '/{,scripts}/**/*.coffee',
    'bower.json'
  ], ['inject']);
});
