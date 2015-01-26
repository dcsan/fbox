Meteor.startup ->

  Router.configure
    # notFoundTemplate: 'NotFound',
    layoutTemplate: "sidemenu"
    # loadingTemplate: 'loading'
    # onBeforeAction: "loading"


  # Router.route "/", ->
  #   @render "story"

  # Router.route "/game/:scenename", ->
  #   name: "game"
  #   @render "game",
  #     waitOn: ->
  #       [
  #         Meteor.subscribe("SceneData")
  #         Meteor.subscribe("CBot")
  #       ]
  #     data: ->
  #       CGame.scene = SceneData.findOne({name:@params.scenename})
  #       blob = {
  #         scenename: @params.scenename
  #         scene: CGame.scene
  #       }
  #       console.log("route data", blob)

  #       return blob

  # Router.route "/chat", ->
  #   @render "chat"


  Router.route "/story/:chapter/:page", ->
    @render "story",

      waitOn: ->
        debugger
        console.log("waitOn")
        query = {
          chapter: @params.chapter
          page: @params.page
        }
        console.log("sub", query)
        res = [
          Meteor.subscribe("PageData", query)
        ]
        return res

      # name: "story"
      # @render "story",

      data: ->
        return unless @ready()
        console.log("data")
        query = {
          chapter: @params.chapter
          page: @params.page
        }
        pages = PageData.find(query).fetch()
        console.log(query, pages)

        blob = {
          pages: pages
          page: @params.page
          chapter: @params.chapter
        }
        console.log("pages", pages )
        return blob

      # action: ->
      #   @render  "story"

