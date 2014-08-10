# This line is related to our Angular app, not to our
# HomeCtrl specifically. This is basically how we tell
# Angular about the existence of our application.
@blog = angular.module('blog', ['ui.router'])

# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.
@blog.config(['$urlRouterProvider', '$stateProvider', '$locationProvider', ($urlRouterProvider, $stateProvider, $locationProvider) -> 
  $locationProvider.html5Mode(true)
  $urlRouterProvider
    .otherwise("/");

  $stateProvider
    .state('home', {
      url: '/',
      templateUrl: 'templates/home.html',
      controller: 'HomeCtrl'
    }) 
])
