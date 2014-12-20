# well famous views fails on startup
# Exception from Tracker afterFlush function: Error: No such template: Surface
# Uncaught TypeError: Cannot read property 'ContainerSurface' of undefined
# ContainerSurface.js:2 
# (anonymous function)famous-views.js:27 
# FView.runReadiesfamous-views.js:111 
# (anonymous function)startup_client.js:63 
# Meteor.startupfamous-views.js:71 
# FView.startupfamous-views.js:139 
# (anonymous function)startup_client.js:30 
# runStartupCallbacksstartup_client.js:32 ready
# console.coff


initFamousViews = () ->

  @Transform = null

  FView.ready ->
    Transform = famous.core.Transform

    # Famono: load famo.us shims and CSS
    famous.polyfills
    famous.core.famous # CSS

Meteor.startup ->

  console.log('startup')

