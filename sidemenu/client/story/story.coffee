# http://meteor.github.io/blaze/docs.html#ui_renderwithdata

FRAME_DELAY=1000
SCROLL_SPEED=200

gdata = false
curFrame = -1

Template.story.rendered = () ->
  startAnim(this.data)

startAnim = (data) ->
  console.log('startAnim', data)
  gdata = data
  curFrame = 0  # so +1 = 0
  nextFrame()

nextFrame = () ->

  # debugger
  page = gdata.pages[curFrame]
  return unless page  # last frame

  parent = document.getElementById('stream')
  template = Template[page.template]
  output = UI.renderWithData(template, page, parent)

  $("#" + page.cname)
    .velocity("scroll", { duration: SCROLL_SPEED, easing: "spring" })
    .velocity({ opacity: 1 });

  curFrame = curFrame + 1
  setTimeout(nextFrame, FRAME_DELAY)
