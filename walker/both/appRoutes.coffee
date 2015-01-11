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

  Router.route "/mocks/:page", ->
    @render "mockPage",

      data: ->
        # mock = MockData[@params.page]
        page = @params.page
        mock = _.find(MockData, (elem) ->
          console.log("match", elem, page)
          return elem.title == page
        )

        unless mock
          console.warn("no mock for:", @params.page)

        console.log("mock:", mock)
        return {
          page: @params.page
          mock: mock
        }


  # Router.route "/deck", ->
  #   @render "deck"

  # Router.route "/lessonStart", ->
  #   @render "lessonStart"
