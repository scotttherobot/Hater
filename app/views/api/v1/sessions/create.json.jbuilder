json.status 'success'
json.partial! 'api/v1/users/user', user: @user
json.api_token @user.api_token
