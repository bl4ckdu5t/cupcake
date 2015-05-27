var app = angular.module('designscook', [])
.controller('appController', ['$scope',function($scope){
	$scope.logoPricing = {
		price1: "20,000",
		price2: "50,000",
		price3: "120,000",
		price4: "300,000",
		labels: ["Design Options", "Designers", "Days Duration", "Revisions", "Email & Phone Support"]
	}
	$scope.stationeryPricing = {}
}]);