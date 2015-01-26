

Template.sidemenu.events
  'click #menu-toggle': (evt) ->
    evt.preventDefault()
    $("#wrapper").toggleClass("active");

Template.sidemenu.helpers
  'sideMenuItems': ->
    sideMenuItems