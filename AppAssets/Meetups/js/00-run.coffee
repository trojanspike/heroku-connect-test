angular.module("MobileApp", [
  "ionic"
  "config"
  "MobileApp.controllers"
]).run(($ionicPlatform) ->
  $ionicPlatform.ready ->
    cordova.plugins.Keyboard.hideKeyboardAccessoryBar true  if window.cordova and window.cordova.plugins.Keyboard
    StatusBar.styleDefault()  if window.StatusBar
    return

  return
)


