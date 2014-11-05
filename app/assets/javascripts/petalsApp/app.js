var app = angular.module('petals', ['ngResource', 'ui.bootstrap.datetimepicker', 'ui.router', 'templates']).config(
  ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;
    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
}])


.directive('uploadImage', function () {
return {
 restrict: 'A',
 link: function (scope, elem, attrs) {
  var reader = new FileReader();
  reader.onload = function (e) {
    // retrieves the image data from the reader.readAsBinaryString method and stores as data
    // calls the uploadImage method, which does a post or put request to server
    scope.newPost.imageData = btoa(e.target.result);
    // updates scope
    scope.$apply();
  };

  // listens on change event
  elem.on('change', function() {
    console.log('entered change function');
    var file = elem[0].files[0];
    console.log(file);
    // gathers file data (filename and type) to send in json
    scope.newPost.imageContent = file.type;
    scope.newPost.imagePath = file.name;
    // updates scope; not sure if this is needed here, I can not remember with the testing I did...and I do not quite understand the apply method that well, as I have read limited documentation on it.
    scope.$apply();
    // converts file to binary string
    reader.readAsBinaryString(file);
  });
 }
};
})

.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to queue page
  $urlRouterProvider.otherwise("/queue");
  //
  // Now set up the states
   $stateProvider
    .state('queue', {
      url: "/queue",
      templateUrl: "queue.html"
    })
   .state('manager', {
    url: "/manager",
    templateUrl: "manager.html"
   })
   .state('hashtags', {
    url: "/hashtags",
    templateUrl: "hashtags.html"
   })
 });
