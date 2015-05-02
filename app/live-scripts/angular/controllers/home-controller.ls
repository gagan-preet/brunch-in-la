angular.module \ng-app
.controller \HomeController, [ \$location \AuthenticationService \FlashService
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
