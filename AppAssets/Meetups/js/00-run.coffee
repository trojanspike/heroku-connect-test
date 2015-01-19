console.log window.device
setTimeout (->
  navigator.notification.activityStart "Titlr", "mgs"
  return
), 1500
setTimeout (->
  navigator.notification.activityStop()
  return
), 5500
setTimeout (->
  navigator.notification.alert "Alert --", "Complete"
  return
), 8500

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


