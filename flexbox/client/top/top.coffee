Template.top.helpers
  'links': ->
    obj = [
      { name: 'fambox' }
      { name: 'listy'}
      { name: 'wide'}
      { name: 'flex1'}
      { name: 'blocky'}
    ]

    for item in obj
      item.href = "/#{item.name}"

    console.log obj
    return obj