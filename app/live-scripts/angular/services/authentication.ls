# Authentication Factory (AuthenticationService)
# ----------------------
#
# Requires: Base64
#           UserService
# Returns: Object with the following-
#            Login - Function that requires username, password and callback function
#                    The function calls sends a post request to '/api/authenticate'
#                      with the username and password
#            SetCredentials - Function that requires username, password
#                             The function sets the username and authdata as a part
#                               of the rootScope.globals. It also sets the headers
#                               to include authentication data.
#            ClearCredentials - Function that requires no parameters
#                               The function removes the user data from the
#                                 rootScope.globals and from the headers

angular.module \ng-app
.factory \AuthenticationService, [ \$http \$cookieStore \$rootScope \Base64 \UserService
  ($http, $cookieStore, $rootScope, Base64, UserService) ->
        return
          Login: (username, password, callback) ->
            $http.post \/api/authenticate, {
              username: username
              password: password }
            .success (response) -> callback(response)

          SetCredentials: (username, password) ->
            authdata = Base64.encode username+':'+password
            $rootScope.globals =
              currentUser:
                username: username,
                authdata: authdata

            $http.defaults.headers.common[ \Authorization] = 'Basic ' + authdata
            $cookieStore.put \globals, $rootScope.globals

          ClearCredentials: ->
            $rootScope.globals = {}
            $cookieStore.remove \globals
            $http.defaults.headers.common.Authorization = 'Basic '
]
