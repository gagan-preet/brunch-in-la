# Flash Service
# -------------
# In addition to the values returned, the factory creates a event listener on
#   $locationChangeStart. The listener deletes the $rootScope.flash if the
#   value of $rootScope.flash.keepAfterLocationChange is false
#
# Requires: <N/A>
# Returns: Object with the following-
#            Success - Function that requires a message and a boolean variable
#                        that determines if the message should remain after a
#                        change in location
#                      The function updates the $rootScope.flash variable with
#                        the provided message, type 'success' and
#                        keepAfterLocationChange with the provided value
#            Error - Function that requires a message and a boolean variable
#                      that determines if the message should remain after a
#                      change in location
#                    The function updates the $rootScope.flash variable with
#                      the provided message, type 'error' and
#                      keepAfterLocationChange with the provided value

angular.module \ng-app
.factory \FlashService, [\$rootScope
  ($rootScope) ->
    clearFlashMessage = !->
      flash = $rootScope.flash;
      if (flash)
        if (!flash.keepAfterLocationChange)
          delete $rootScope.flash
        else
          flash.keepAfterLocationChange = false;
    $rootScope.$on \$locationChangeStart, -> clearFlashMessage()

    return
      Success = (message, keepAfterLocationChange) !->
        $rootScope.flash =
          message: message
          type: \success
          keepAfterLocationChange: keepAfterLocationChange
      Error = (message, keepAfterLocationChange) !->
        $rootScope.flash =
          message: message
          type: \error
          keepAfterLocationChange: keepAfterLocationChange
]
