Meteor.startup ->

  Router.configure
    # notFoundTemplate: 'NotFound',
    layoutTemplate: "sidemenu"
    # loadingTemplate: 'loading'
    # onBeforeAction: "loading"


  Router.route "/", ->
    @render "story"

  Router.route "/game/:scenename", ->
    name: "game"
    @render "game",
      waitOn: ->
        [
          Meteor.subscribe("SceneData")
          Meteor.subscribe("CBot")
        ]
      data: ->
        CGame.scene = SceneData.findOne({name:@params.scenename})
        blob = {
          scenename: @params.scenename
          scene: CGame.scene
        }
        console.log("route data", blob)

        return blob

  Router.route "/chat", ->
    @render "chat"


  Router.route "/story", ->
    @render "story"

