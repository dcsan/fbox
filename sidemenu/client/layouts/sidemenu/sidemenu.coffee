


# $('.navbar-nav a').on('click', function(){
#     $('.navbar-offcanvas').offcanvas('toggle')
# });


Template.sidemenu.events
  'click #navItems': (evt) ->
    console.log("click offCanvas")
    $("#sidemenu").offcanvas('hide')
    # $('.navmenu').fadeOut()

  # 'click #menu-toggle': (evt) ->
  #   evt.preventDefault()
  #   $("#wrapper").toggleClass("active")
  #   console.log("sideMenuClick")

Template.sidemenu.helpers
  'sideMenuItems': ->
    sideMenuItems