# http://meteor.github.io/blaze/docs.html#ui_renderwithdata

FRAME_DELAY=1000
SCROLL_SPEED=200
devspeed = 10     # higher is faster

gdata = false
curPanel = -1

Template.story.rendered = () ->
  console.log("rendered")
  startAnim(this.data)

startAnim = (data) ->
  console.log('startAnim page', data.page)
  gdata = data
  # router preloads the whole chapter, we just need one of data
  gdata.page = PageData.findOne({page: gdata.page})
  gdata.panels = gdata.page.panels
  console.log('panels', gdata.panels)
  curPanel = 0  # so +1 = 0
  nextPanel()

nextPanel = () ->
  panel = gdata.panels[curPanel]
  return unless panel  # last frame

  parent = document.getElementById('stream')
  template = Template[panel.template]
  output = UI.renderWithData(template, panel, parent)

  $("#" + panel.cname)
    .velocity("scroll", {
      duration: SCROLL_SPEED/devspeed, easing: "spring"
    })
    .velocity({ opacity: 1 })
    .addClass(panel.animation)

  curPanel = curPanel + 1
  setTimeout(nextPanel, FRAME_DELAY/devspeed)
