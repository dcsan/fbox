@StoryEngine = {}

FRAME_DELAY=1000
SCROLL_SPEED=200
devspeed = 1     # higher is faster

gdata = false
curPanel = 0

StoryEngine.startAnim = (data) ->
  console.log('startAnim page, data', data.page, data)
  gdata = data
  # router preloads the whole chapter, we just need one of data
  gdata.page = PageData.findOne({page: gdata.page})
  gdata.panels = gdata.page.panels
  console.log('panels', gdata.panels)
  curPanel = 0
  nextPanel()

nextPanel = () ->
  panel = gdata.panels[curPanel]
  return unless panel  # last frame

  parent = document.getElementById('stream')
  widget = Template[panel.widget]
  panel.cname = Meteor.uuid()
  output = UI.renderWithData(widget, panel, parent)
  console.log("panel", panel.text, panel)

  $("#" + panel.cname)
    .velocity("scroll", {
      duration: SCROLL_SPEED/devspeed, easing: "spring"
    })
    .velocity({ opacity: 1 })
    .addClass(panel.animation)

  curPanel = curPanel + 1
  setTimeout(nextPanel, FRAME_DELAY/devspeed)


# StoryEngine.goPage = (pageName) ->