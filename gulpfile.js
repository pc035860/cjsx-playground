var gulp = require('gulp'),
    gutil = require('gulp-util');

var cjsx = require('gulp-cjsx');

gulp.task('default', function () {
  gulp.src('**.cjsx', {base: './'})
    .pipe(cjsx({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./'));
});

gulp.task('watch', function () {
  gulp.watch('**.cjsx', ['default']);
});
