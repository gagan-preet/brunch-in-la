# Register Controller
# -------------------
# Required: UserService
#           $location
#           FlashService
# Functions: register
#              Requires no parameters. Uses the user object from the medel. This
#                utilizes the Create function from UserService. FlashService is
#                used to display success and faliure messages.

angular.module \ng-app
.controller \RegisterController, [ \UserService \$location \$rootScope \FlashService
  (UserService, $location, $rootScope, FlashService) !->
    vm = this
    vm.register = ->
      vm.dataLoading = true
      UserService.Create vm.user
      .then (response) ->
        if (response.success)
          FlashService.Success 'Registration successful', true
          $location.path \/login
        else
          FlashService.Error response.message
          vm.dataLoading = false
]
