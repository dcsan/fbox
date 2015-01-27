handleInput = (msg) ->
  $("#inputBox").val("")
  $("#yousaid").text(msg)
  stuff = msg.split(" ")
  verb = stuff[0]
  noun = stuff[1]

  # actions = getActions(CGame.scene, verb, noun)
  # console.log("res:", actions)

  # if actions?.script
  #   try
  #     eval(actions.script)
  #   catch err
  #     console.error("eval err", actions.script, err)
  # else
  #   console.log("no script for ", verb, noun)
  #   noun ?= ""
  #   CGame.alert("you cant #{verb} #{noun} here.")

Template.userInput.helpers
  userMessage: ->
    return ("be nice!")


Template.userInput.events
  'keypress #inputBox': (evt, template) ->
    if (evt.which == 13)
      txt = $("#inputBox").val()
      console.log("txt", txt)
      handleInput(txt)
