Meteor.startup ->

  if Meteor.isClient

    Router.configure
      # notFoundTemplate: 'NotFound',
      layoutTemplate: "sidemenu"
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

    Router.route "/tbc", ->
      @render "tbc"

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
        # that = this

      # only called in same route instance
      onRerun: ->
        console.log("IR | reRun", @data() )
        @next()

      # FIXME
      # need this to run just once, and after we have a DOM ready
      # Template.rendered only called once - not when data changes
      # redo with Deps??
      onAfterAction: ->
        return unless @ready()   # ugly hack
        console.log("IR | after")
        setTimeout =>
          StoryEngine.startAnim(this.data() )
        , 100
        

