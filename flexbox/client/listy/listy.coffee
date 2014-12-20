Template.listy.helpers
  'items': ->

    items = []
    for idx in [1..30]
      items.push({name: "item #{idx}"})

    console.log items
    return items