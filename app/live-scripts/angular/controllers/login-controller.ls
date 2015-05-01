# Login Controller
# ----------------
# Required: $location
#           AuthenticationService
#           FlashService
# Functions: login
#              Requires no parameters. Uses the username and password from the
#                model. This utilizes the Login and SetCredentials functions
#                from AuthenticationService. FlashService is used to display
#                error message.

angular.module \ng-app
.controller \LoginController, [ \$location \AuthenticationService \FlashService
  ($location, AuthenticationService, FlashService) !->
    vm = this;
    AuthenticationService.ClearCredentials()

    vm.login = ->
      vm.dataLoading = true
      AuthenticationService.Login vm.username,
        vm.password,
        (response) ->
          if response.success
            AuthenticationService.SetCredentials (vm.data.token || vm.username),
              if vm.data.token then "null" else vm.password
            $location.path \/
          else
            FlashService.Error response.message
            vm.dataLoading = false
]
