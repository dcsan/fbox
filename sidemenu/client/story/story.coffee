# http://meteor.github.io/blaze/docs.html#ui_renderwithdata

FRAME_DELAY=1000
SCROLL_SPEED=200

Template.story.rendered = () ->
  console.log("rendered", this.data)
  nextFrame(0)
  startAnim(this.data)

curFrame = 0
pages = {}

startAnim = (data) ->
  pages = data.pages

nextFrame = (frameNum) ->

  if frameNum
    curFrame = frameNum
  else
    curFrame = curFrame + 1

  page = pages[curFrame]
  return unless page  # last frame

  parent = document.getElementById('stream')
  template = Template[page.page]
  output = UI.renderWithData(template, page, parent)

  $("#" + page.cname)
    .velocity("scroll", { duration: 100, easing: "spring" })
    .velocity({ opacity: 1 });
  
  setTimeout(nextFrame, FRAME_DELAY)
