var gulp = require("gulp");
var slim = require("gulp-slim");
var paths = gulp.paths;

gulp.task('slim', function(){
  gulp.src(paths.src + '/{,views}/**/*.slim')
    .pipe(slim({
      pretty: true
    }))
    .pipe(gulp.dest(paths.tmp + '/serve/'));
});
