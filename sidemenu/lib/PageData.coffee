@PageData = new Meteor.Collection("PageData")

numberItems = (ary) ->
  for item, idx in ary
    item.idx = idx


Meteor.startup ->
  if Meteor.isServer

    PageData.remove({})
    for page, idx in rawPages
      for panel, idx in page.panels
        panel.idx = idx
      PageData.insert(page)

    # publish
    collName = "PageData"
    Meteor.publish "PageData", (query, fields, sort) =>
      query ?= {}
      fields ?= { cname:1, 'title':1 }
      fields.cname = 1
      sort ?= {cname:1}
      console.log('sub', "#{collName}", query)
      res = PageData.find(
        query, fields,
        {sort: sort }
      )
      console.log("#{collName} found:", res.count() )
      return res


