Meteor.startup ->

  Router.configure
    # notFoundTemplate: 'NotFound',
    layoutTemplate: "main"
    # loadingTemplate: 'loading'
    # onBeforeAction: "loading"


  Router.route "/", ->
    name: "top"
    @render "top",
      data: ->
        return {
          MockData: MockData
        }

  Router.route "/top", ->
    name: "top"
    @render "top",
      data: ->
        return {
          MockData: MockData
        }

  Router.route "/mocks/:page", ->
    @render "mockPage",

      data: ->
        # mock = MockData[@params.page]
        page = @params.page
        mock = _.find(MockData, (elem) ->
          return elem.title == page
        )

        unless mock
          console.warn("match:", page)

        blob = {
          page: @params.page
          mock: mock
        }
        console.log("blob", blob)
        return blob

  # Router.route "/deck", ->
  #   @render "deck"

  # Router.route "/lessonStart", ->
  #   @render "lessonStart"
