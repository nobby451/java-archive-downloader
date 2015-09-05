var gulp = require('gulp'),
    yaml = require('gulp-yaml'),
    jade = require('gulp-jade'),
    coffee = require('gulp-coffee');

gulp.task('default', function () {
  gulp.src('src/*.yml')
      .pipe(yaml())
      .pipe(gulp.dest('dest'));
  gulp.src('src/*.jade')
      .pipe(jade())
      .pipe(gulp.dest('dest'));
  gulp.src('src/*.coffee')
      .pipe(coffee())
      .pipe(gulp.dest('dest'));
});
