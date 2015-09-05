var gulp = require('gulp'),
    yaml = require('gulp-yaml');

gulp.task('default', function () {
  gulp.src('src/*.yml')
      .pipe(yaml())
      .pipe(gulp.dest('dest'));
});
