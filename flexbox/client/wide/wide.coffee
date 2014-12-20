Template.wide.rendered = () ->
  console.log("wide", this)
  famx = initEngine('square')
  # addBoxes(famx)
  
  @view = addScroller(famx)


Meteor.startup ->
  famous?.core.Engine.setOptions({appMode: false})


addScroller = (famx) ->
  scrollview = new famous.views.Scrollview({
    direction: 0   # horiz
    paginated: true
  })
  surfaces = []
  scrollview.sequenceFrom surfaces
  i = 0
  temp = undefined
  mouseSync = new famous.inputs.MouseSync({direction:0})

  while i < 40
    temp = new famous.core.Surface(
      content: "Surface: " + (i + 1)
      size: famx.size
      classes: ["cbox"]
      properties:
        backgroundColor: "hsl(" + (i * 360 / 40) + ", 100%, 50%)"
        lineHeight: "200px"
        textAlign: "center"
    )
    temp.pipe scrollview
    temp.pipe(mouseSync)
    surfaces.push temp
    i++

  mouseSync.pipe(scrollview)

  # positioning blah blah verbose stuffy api
  stateModifier = new famous.modifiers.StateModifier({
    transform: famous.core.Transform.translate(famx.pos[0], famx.pos[1], 0)
  })

  famx.mainContext.add(stateModifier).add(scrollview)


  # mouseSync so it can respond to input. hello
  ## cant add a scrollView to a renderController, WTF
  # famx.rc.add scrollview
  # famx.rc.show()


initEngine = (tgtDiv) ->
  famous.polyfills
  famous.core.famous

  # Make sure dom got a body...

  famRegion = window.document.getElementById(tgtDiv)
  mainContext = famous.core.Engine.createContext(famRegion)
  renderController = new famous.views.RenderController()
  mainContext.add(new famous.core.Modifier(
    align: [ .5, .5 ]
    origin: [.5, .5 ]
  )).add renderController

  size = [
    $(tgtDiv).width(), $(tgtDiv).height()
  ]

  #FIXME - need to handle resize events
  pos = [
    $(tgtDiv).position().left,
    $(tgtDiv).position().top,
  ]

  return {
    mainContext: mainContext
    rc: renderController
    size: size
    pos: pos
  }


addBoxes = (famx) ->
  surfaces = []
  counter = 0
  i = 0

  while i < 10
    red = i * 255 / 10
    colr = "rgba( #{red}, 100, 100, 0.5)"
    # colr = "rgb( #{red}, 100, 100 )"
    colr = "hsla(" + (i * 360 / 10) + ", 100%, 50%, 0.5)"
    console.log(colr)

    surfaces.push new famous.core.Surface(
      content: "Surface: " + (i + 1)
      size: [
        famx.size.sx - 20, famx.size.sy - 20
      ]
      properties:
        backgroundColor: colr
        lineHeight: "200px"
        textAlign: "center"
        classes: "cbox"
    )
    i++
  famx.rc.show surfaces[0]

  famous.core.Engine.on "click", (->
    next = (counter++ + 1) % surfaces.length
    @show surfaces[next]
    return
  ).bind(famx.rc)



Template.fambox.events
  'click #famRegion': (evt, tpl) ->
    console.log("clicked famRegion", tpl)
    @view.gotoNextPage()


