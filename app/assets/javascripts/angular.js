var regularLabel = ["Design Options", "Designers", "Days Duration", "Revisions", "Email & Phone Support"];
var app = angular.module('designscook', [])
.controller('appController', ['$scope', '$http',function($scope, $http){
	$http.jsonp('http://api.ipify.org?format=jsonp&callback=JSON_CALLBACK').then(function(response) { 
		var ip = response.data.ip;
		$http.get('https://freegeoip.net/json/'+ip).then(function(r){
			var shortcode = r.data.country_code;
			$scope.currency = shortcode == 'NG' ? '₦' : '$';

			$scope.logoPricing = {
				price1: shortcode == 'NG' ? "20,000" : "100",
				price2: shortcode == 'NG' ? "50,000" : "252",
				price3: shortcode == 'NG' ? "120,000": "603",
				price4: shortcode == 'NG' ? "300,000": "1508",
				labels: regularLabel
			}
			$scope.stationeryPricing = {
				price1: shortcode == 'NG' ? "20,000" : "100",
				price2: shortcode == 'NG' ? "40,000" : "200",
				price3: shortcode == 'NG' ? "60,000" : "300",
				price4: shortcode == 'NG' ? "60,000" : "300",
				labels: ["Design Concepts", "Included", "Designers", "Days Duration", "Revisions", "Email & Phone Support"]
			}
			$scope.bannerPricing = {
				price1: shortcode == 'NG' ? "10,000" : "50",
				price2: shortcode == 'NG' ? "25,000" : "126",
				price3: shortcode == 'NG' ? "50,000" : "252",
				price4: shortcode == 'NG' ? "60,000" : "300",
				labels: regularLabel
			}
			$scope.brochurePricing = {
				price1: shortcode == 'NG' ? "30,000" : "150",
				price2: shortcode == 'NG' ? "60,000" : "300",
				price3: shortcode == 'NG' ? "100,000" : "503",
				price4: shortcode == 'NG' ? "120,000" : "603",
				labels: regularLabel
			}
			$scope.websitePricing = {
				price1: shortcode == 'NG' ? "100,000" : "503",
				price2: shortcode == 'NG' ? "160,000" : "804",
				price3: shortcode == 'NG' ? "210,000" : "1055",
				price4: shortcode == 'NG' ? "300,000" : "1508",
				labels: regularLabel
			}
			$scope.corporatePricing = {
				price1: shortcode == 'NG' ? "40,000" : "200",
				price2: shortcode == 'NG' ? "80,000" : "400",
				price3: shortcode == 'NG' ? "250,000" : "1256",
				price4: shortcode == 'NG' ? "600,000" : "3015",
				labels: ["Design Concepts", "Included", "Designers", "Days Duration", "Revisions", "Email & Phone Support"]
			}
		});
	});
  $scope.developer = 'Joseph Rex';
}]);