app.controller('AccountCtrl',
			['$scope', 'Account',
	function($scope, Account){

		Account.query(function(json){
			$scope.accounts = json;
		});

		$scope.newAccount = new Account();

		this.add = function(){
			$scope.newAccount.$save(function(){
				$scope.accounts.push($scope.newAccount);
				$scope.newAccount = new Account();
			});
		}

		this.obliterate = function( account ){
			account.$delete(function(){
				var position = $scope.accounts.indexOf(account);
				$scope.accounts.splice(position, 1);
			});
		}

		this.modify = function ( account ){
			this.showEdit = account.id;
		}

		this.update = function( account ){
			var yomama = this;
			account.$update(function(){
				yomama.showEdit = null;
			})

		}

	}]);



