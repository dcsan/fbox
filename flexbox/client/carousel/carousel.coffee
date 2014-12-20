Template.carousel.helpers
  cards: ->
    obj = []
    for x in [1..20]
      obj.push({name: "card #{x}"})

    # console.log('cards', obj)
    obj