Template.listy.helpers
  'items': ->

    items = []
    numItems = 30
    for idx in [1..numItems]
      hue = (idx * 360 / numItems)
      colr = "hsl(#{hue}, 100%, 50%)"
      style="background-color:#{colr}"
      items.push({
        name: "item #{idx}"
        idx: idx
        colr: colr
        style: style
      })

    console.log items
    return items