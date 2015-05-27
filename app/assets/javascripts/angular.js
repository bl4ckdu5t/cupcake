var app = angular.module('designscook', [])
.controller('appController', ['$scope',function($scope){
	$scope.genders = [
		{
			label: "Male",
			value: "male"
		},
		{
			label: "Female",
			value: "female"
		}
	];
	$scope.ageRanges = [
		{
			range: "18 - 29",
			value: 1
		},
		{
			range: "30 - 39",
			value: 2,
		},
		{
			range: "40 - 50",
			value: 3
		},
		{
			range: "51 - 70",
			value: 4
		}
	];
}]);