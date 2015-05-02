# Angular App
# -----------
# Creates the ng-app module.
# Requires: ngCookies
#           ngResources
#           ngRoute
#           mgcrea.ngStrap
# Returns: Angular module with the following-
#            Routing configuration
#              Default: /
#              /login - LoginController and /login.html
#              /register - RedisterController and /register
#              /home - HomeController and /home.html
#              /chat:friendId - ChatController and /chat.html
#            baseURL

angular.module \ng-app, <[ ngCookies ngResource ngRoute mgcrea.ngStrap]>

angular.module \ng-app
.config [ \$routeProvider \$locationProvider
  ($routeProvider, $locationProvider, config) !->
    $routeProvider.when \/login, {
      controller:\LoginController,
      controllerAs: \login,
      templateUrl: \views/login.html }
    .when \/home, {
      controller:\HomeController,
      controllerAs: \home,
      templateUrl: \views/home.html }
    .when \/register, {
      controller:\RegisterController,
      controllerAs: \register,
      templateUrl: \views/register.html }
    .when '/chat/:friendId', {
      controller:\ChatController,
      controllerAs: \chat,
      templateUrl:\chat.html }
    .when \/, {
      redirectTo: \/home }
    .otherwise {
      redirectTo: \/register }
    $locationProvider.html5Mode false
]
.run [ \$rootScope \$location \$cookieStore \$http
  ($rootScope, $location, $cookieStore, $http) ->
    $rootScope.globals = if $cookieStore.get \globals then $cookieStore.get \globals else {}
    if ($rootScope.globals.currentUser)
      $http.defaults.headers.common['Authorization'] = 'Basic ' + $rootScope.globals.currentUser.authdata
    $rootScope.$on \$locationChangeStart, (event, next, current) ->
      restrictedPage = if $.inArray $location.path(), <[ \/login /register ]> === -1 then false else true
      loggedIn = $rootScope.globals.currentUser
      if (restrictedPage && !loggedIn)
        $location.path \/login
]
.value \baseURL \https://mysterious-cliffs-8806.herokuapp.com/
