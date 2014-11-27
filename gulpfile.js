var path = require('path'),
    gulp = require('gulp'),
    less = require('gulp-less');

gulp.task('style', function() {
	gulp.src(['./style/style.less'])
		.pipe(less({
			paths: [
				path.join(__dirname, 'node_modules/twitter-bootstrap-3.0.0/less'),
				path.join(__dirname, 'style')
			]
		}))
		.pipe(gulp.dest('./css'));
});

gulp.task('script', function() {
	gulp.src(['./bower_components/jquery.stellar/jquery.stellar.js', './node_modules/twitter-bootstrap-3.0.0/js/tab.js'])
		.pipe(gulp.dest('./scripts'));
});
