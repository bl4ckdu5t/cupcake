module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    imagemin: {
     dynamic: {
       options: {
         optimizationLevel: 3,
       },
       files: [{
         expand: true,                         // enable dynamic expansion
         cwd: 'app/assets/images/',            // src matches are relative to this path
         src: ['**/*.{png,jpg,gif}'],          // Actual patterns to match
         dest: 'app/assets/images/compressed'  // Destination path prefix
       }]
     }
    },
    // https://github.com/somerandomdude/grunt-webp
    webp: {
      files: {
        src: 'app/assets/images/*.png',
        dest: 'app/assets/images/webp'
      },
      options: {
        binpath: require('webp-bin').path,
        preset: 'photo',
        verbose: true,
        quality: 80,
        alphaQuality: 80,
        compressionMethod: 6,
        segments: 4,
        psnr: 42,
        sns: 50,
        filterStrength: 40,
        filterSharpness: 3,
        simpleFilter: true,
        partitionLimit: 50,
        analysisPass: 6,
        multiThreading: true,
        lowMemory: false,
        alphaMethod: 0,
        alphaFilter: 'best',
        alphaCleanup: true,
        noAlpha: false,
        lossless: false
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-webp');
  grunt.registerTask('default', ['imagemin']);
};
