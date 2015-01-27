Template.backpack.events
  'click .packitem': (evt) ->
    cname = $(evt.target).data("cname")
    console.log("clicked", cname)
    StoryEngine.addPanel({
      text: "you give him the #{cname}"
    })