'use strict';

var gulp = require('gulp');
var paths = gulp.paths;
var sass = require('gulp-sass');

gulp.task('styles', function () {
  gulp.src(paths.src + '/{,styles}/**/*.scss')
    .pipe(sass())
    .pipe(gulp.dest(paths.tmp + '/serve/'));
});
