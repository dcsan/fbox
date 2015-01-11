Meteor.startup ->

  Router.configure
    notFoundTemplate: 'NotFound',
    layoutTemplate: "main"
    # loadingTemplate: 'loading'
    # onBeforeAction: "loading"


  Router.route "/", ->
    name: "top"
    @render "top"

  Router.route "/fambox", ->
    @render "fambox"

  Router.route "/listy", ->
    name: "listy"
    @render "listy"


  Router.route "/wide", ->
    @render "wide"

  Router.route "/flex1", ->
    @render "flex1"

  Router.route "/blocky", ->
    @render "blocky"
