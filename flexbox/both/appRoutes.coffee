Meteor.startup ->

  Router.configure
    notFoundTemplate: 'NotFound',
    layoutTemplate: "main"
    # loadingTemplate: 'loading'
    # onBeforeAction: "loading"


  Router.route "/", ->
    name: "top"
    @render "top",

  Router.route "/fambox", ->
    layoutTemplate: "main"
    @render "fambox",

  Router.route "/listy", ->
    name: "listy"
    @render "listy"


  Router.route "/wide", ->
    layoutTemplate: "main"
    @render "wide",
