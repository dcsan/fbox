

Template.sidemenu.events
  'click #menu-toggle': (evt) ->
    evt.preventDefault()
    $("#wrapper").toggleClass("active")
    console.log("sideMenuClick")

Template.sidemenu.helpers
  'sideMenuItems': ->
    sideMenuItems