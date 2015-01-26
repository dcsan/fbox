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


  Router.route "/story/:chapter/:page",

    waitOn: ->
      query = {
        chapter: @params.chapter
        page: @params.page
      }
      console.log("sub", query)
      return Meteor.subscribe("PageData", query)

    # name: "story"
    # @render "story",

    data: ->
      return unless @ready()
      console.log("data")
      query = {
        chapter: @params.chapter
        page: @params.page
      }
      sort = {cname: 1}
      pages = PageData.find(query, {}, sort).fetch()
      console.log(query, pages)

      blob = {
        pages: pages
        page: @params.page
        chapter: @params.chapter
      }
      console.log("pages", pages )
      return blob

    action: ->
      @render  "story"

