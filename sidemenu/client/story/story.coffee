# http://meteor.github.io/blaze/docs.html#ui_renderwithdata

Template.story.rendered = () ->
  console.log("created")
  nextFrame(0)

curFrame = 0

nextFrame = (frameNum) ->

  if frameNum
    curFrame = frameNum
  else
    curFrame = curFrame + 1

  frame = frameData[curFrame]
  return unless frame  # last frame

  parent = document.getElementById('stream')
  template = Template[frame.template]
  output = UI.renderWithData(template, frame, parent)
  
  setTimeout(nextFrame, 1000)
