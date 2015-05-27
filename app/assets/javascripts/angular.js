var regularLabel = ["Design Options", "Designers", "Days Duration", "Revisions", "Email & Phone Support"]
var app = angular.module('designscook', [])
.controller('appController', ['$scope',function($scope){
	$scope.logoPricing = {
		price1: "20,000",
		price2: "50,000",
		price3: "120,000",
		price4: "300,000",
		labels: regularLabel
	}
	$scope.stationeryPricing = {
		price1: "20,000",
		price2: "40,000",
		price3: "60,000",
		price4: "60,000",
		labels: ["Design Concepts", "Included", "Designers", "Days Duration", "Revisions", "Email & Phone Support"]
	}
	$scope.bannerPricing = {
		price1: "10,000",
		price2: "25,000",
		price3: "50,000",
		price4: "60,000",
		labels: regularLabel
	}
	$scope.brochurePricing = {
		price1: "30,000",
		price2: "60,000",
		price3: "100,000",
		price4: "120,000",
		labels: regularLabel
	}
	$scope.websitePricing = {
		price1: "100,000",
		price2: "160,000",
		price3: "210,000",
		price4: "300,000",
		labels: regularLabel
	}
	$scope.corporatePricing = {
		price1: "40,000",
		price2: "80,000",
		price3: "250,000",
		price4: "600,000",
		labels: ["Design Concepts", "Included", "Designers", "Days Duration", "Revisions", "Email & Phone Support"]
	}
}]);