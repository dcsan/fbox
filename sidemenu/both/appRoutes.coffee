Meteor.startup ->

  if Meteor.isClient

    Router.configure
      # notFoundTemplate: 'NotFound',
      layoutwidget: "sidemenu"
      # loadingTemplate: 'loading'
      # onBeforeAction: "loading"


    Router.route "/", ->
      @render "top"

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

    Router.route "/top", ->
      @render "top"

    Router.route "/home", ->
      @render "home"

    Router.route "/friends", ->
      @render "friends"

    Router.route "/about", ->
      @render "about"

    Router.route "/story/:chapter/:page",

      waitOn: ->
        query = {
          chapter: @params.chapter
          # page: @params.page
        }
        console.log("IR | waitOn query", query)
        return Meteor.subscribe("PageData", query)

      # name: "story"
      # @render "story",

      data: ->
        console.log("IR | data check")
        return unless @ready()
        query = {
          chapter: @params.chapter
          # page: @params.page
        }
        sort = {
          idx: 1
        }
        pages = PageData.find(query, {}, sort).fetch()

        blob = {
          pages: pages
          page: @params.page
          chapter: @params.chapter
        }
        console.log("IR | data ready", query, pages)
        return blob

      action: ->
        console.log("IR | action, data:", @data() )
        @render  "story"
        # needed for each page/URL as we dont get a render event
        StoryEngine.startAnim(@data())

