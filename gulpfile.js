var gulp = require('gulp'),
    gutil = require('gulp-util');

var cjsx = require('gulp-cjsx'),
    connect = require('gulp-connect'),
    livereload = require('gulp-livereload');

var config = {
  watch: {
    app: 'public/{,**/}*.{js,html,css}',
    cjsx: '{,**/}*.cjsx'
  },
  appRoot: 'public'
};

gulp.task('default', ['server', 'watch']);

gulp.task('server', function () {
  connect.server({
    root: config.appRoot
  });
});

gulp.task('cjsx', function () {
  gulp.src(config.watch.cjsx, {base: './'})
    .pipe(cjsx({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./'));
});

gulp.task('watch', function () {
  livereload.listen();
  gulp.watch(config.watch.cjsx, ['cjsx']);
  gulp.watch(config.watch.app).on('change', livereload.changed);
});
