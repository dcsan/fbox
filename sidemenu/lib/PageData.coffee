@PageData = new Meteor.Collection("PageData")

numberItems = (ary) ->
  for item, idx in ary
    item.idx = idx


Meteor.startup ->
  if Meteor.isServer

    # rawPages = [].concat(stories.lost, stories.interview)
    rawPages = []

    for key, story of stories
      console.log("rawPages", rawPages)   #why is this undefined inside the of loop
      console.log("story", story)   
      rawPages = rawPages.concat(story)

    console.log(JSON.stringify(rawPages, undefined, 2))

    PageData.remove({})
    for page, idx in rawPages
      for panel, idx in page.panels
        panel.idx = idx
        panel.cname = "#{page.page}_#{idx}"
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


