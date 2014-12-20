Template.top.helpers
  'links': ->
    obj = [
      { name: 'fambox' }
      { name: 'listy'}
    ]

    for item in obj
      item.href = "/#{item.name}"

    console.log obj
    return obj