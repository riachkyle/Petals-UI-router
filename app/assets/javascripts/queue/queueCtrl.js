app.controller('queueCtrl', [
			'$scope', 'Post',
	function($scope, Post){

		$scope.posts = {};

		$scope.newPost = new Post();

		Post.query(function(json){
			$scope.posts = json;
		});

		$scope.addPost = function(){
      $scope.loading = true;
      if (!$scope.newPost.caption) {
        $scope.newPost.caption = '';
      }

      console.log($scope.newPost.caption);
			$scope.newPost.$save(function(){
				$scope.posts.push($scope.newPost);
				$scope.newPost = new Post();

			}).then(function(){
        console.log("done!!!");
        $scope.loading = false;
        $.gritter.add({
          title: 'Scheduled!',
          text: 'Content',
          class_name: 'clean',//<--------- Here
        });

      }, function(errors){
        $scope.loading = false;
        $scope.errors = true;
        $scope.err_messages = errors.data;
        console.log(errors.data);
      });
		};

		$scope.destroyPost = function( post ){
			post.$delete(function(){
				var position = $scope.posts.indexOf(post);
				$scope.posts.splice(position, 1);
			});
		};

		$scope.editPost = function( post ){
			$scope.showEdit = true;
			$scope.post = post;
		};

		$scope.updatePost = function( post ){
			post.$update(function(){
				console.log('success!!');
				$scope.showEdit = false;
			});
		};

    // triggers click event for input file, causing the file selection window to open
    $scope.openFileWindow = function () {
      angular.element( document.querySelector( '#fileUpload' ) ).trigger('click');
      console.log($scope.newPost);
    };

}]);




