# User Factory
# ------------
#
# Requires: <N/A>
# Returns: Object with the following-
#            GetAll - Function that requires no parameters
#                     The function makes a get call to '/api/users' and returns
#                       the list of all users
#            GetById - Function that requires the user id
#                      The function makes a get call to '/api/users/:id' and
#                        returns the user information of the user with the
#                        provided id.
#            GetByUsername - Function that requires the username
#                            The function makes a get call to
#                              '/api/users/:username' and returns the user
#                              information of the user with the provided
#                              username.
#            Create - Function that requires the user object
#                     The function sends a post request to '/api/users/' with
#                       the provided user object
#            Update - Function that requires the user object
#                     The function sends a put request to '/api/users/:user.id'
#                       with the provided user object
#            Delete - Function that requires the user id
#                     The function sends a delete request to '/api/users/:id'

angular.module \ng-app
.factory \UserService, [ \$http
  ($http) ->
    handleSuccess = (data) -> data

    handleError = (error) ->
      errorReturn = ->
        data = success: false, message: error
        data
      errorReturn

    return
      GetAll: ->
        $http.get \/api/users
        .then handleSuccess,
          handleError 'Error getting all users'
      GetById: (id) ->
        $http.get \/api/users/ + id
        .then handleSuccess,
          handleError 'Error getting user by id'
      GetByUsername: (username) ->
        $http.get \/api/users/ + username
        .then handleSuccess,
          handleError 'Error getting user by username'
      Create: (user) ->
        $http.post \/api/users, user
        .then handleSuccess,
          handleError 'Error creating user'
      Update: (user) ->
        $http.put \/api/users/ + user.id,
          user
        .then handleSuccess,
          handleError 'Error updating user'
      Delete: (id) ->
        $http.delete '/api/users/' + user.id
        .then handleSuccess,
          handleError 'Error deleting user'
]
