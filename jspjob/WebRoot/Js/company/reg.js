var myModule=angular.module('myModule',[]);
myModule.controller('myCtrl',['$scope',function($scope){
	$scope.checkPassword=function(){
		console.log($scope.repassword);
		console.log($scope.password);
		if($scope.repassword==$scope.password){
			$scope.passwordChecked=true;
		}else{
			$scope.passwordChecked=false;
		}
	};
}]);