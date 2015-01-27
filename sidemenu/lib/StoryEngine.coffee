@StoryEngine = {}
devspeed = 10     # higher is faster

FRAME_DELAY=1000
SCROLL_SPEED=200

gdata = false
curPanel = 0
lastPage = false

StoryEngine.setPage = (page) ->
  unless page == lastPage
    lastPage = page
    StoryEngine.startAnim()


StoryEngine.startAnim = (data) ->
  console.log('startAnim page, data', data, data.page)
  gdata = data
  # router preloads the whole chapter, we just need one of data
  gdata.page = PageData.findOne({page: gdata.page})
  gdata.panels = gdata.page.panels
  console.log('panels', gdata.panels)
  curPanel = 0
  nextPanel()

nextPanel = () ->
  panel = gdata.panels[curPanel]
  console.log("nextPanel [#{curPanel}]", panel)
  return unless panel  # last frame
  StoryEngine.addPanel(panel)


StoryEngine.addPanel = (panel) ->
  # debugger
  parent = document.getElementById('stream')
  widget = Template[panel.widget or 'caption']
  panel.uuid = Meteor.uuid()
  output = UI.renderWithData(widget, panel, parent)
  console.log("panel #{curPanel}: #{panel.cname}", panel.text)

  $("#" + panel.uuid)
    .velocity("scroll", {
      duration: SCROLL_SPEED/devspeed, easing: "spring"
    })
    .velocity({ opacity: 1 })
    .addClass(panel.animation)

  curPanel = curPanel + 1
  unless panel.pause
    setTimeout(nextPanel, FRAME_DELAY/devspeed)
