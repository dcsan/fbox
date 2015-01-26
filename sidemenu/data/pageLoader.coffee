@PageData = new Meteor.Collection("PageData")


raw = [

  {
    # item 0 not shown
  }

  {
    page: "train", chapter: "lost"
    template: "headline"
    text: "Lost in America"
  }

  {
    page: "train", chapter: "lost"
    template: "caption"
    text: "You woke up suddenly."
  }

  {
    page: "train", chapter: "lost"
    template: "wideImage"
    src: "/assets/lost/train/train-int.jpg"
  }

  {
    page: "train", chapter: "lost"
    template: "caption"
    text: "The man in front turned around to look at you."
  }

  {
    page: "train", chapter: "lost"
    template: "thinking"
    text: "'Where am I, and who are these people?'"
    afterthought: " you think to yourself."
  }

  {
    page: "train", chapter: "lost"
    template: "caption"
    text: "But you don't say anything."
  }

  {
    page: "train", chapter: "lost"
    template: "caption"
    text: "How many hours had you slept?"
  }

  {
    page: "train", chapter: "lost"
    template: "caption"
    text: "You could be anywhere, rolling through middle America."
  }

  {
    page: "train", chapter: "lost"
    template: "twoChoice"
    text1: "Go back to sleep"
    url1: "sleepMore"
    text2: "Look around"
    url2: "lookAround"
    pause: true
  }

]




Meteor.startup ->
  if Meteor.isServer

    PageData.remove({})
    for frame, idx in raw
      frame.cname = frame.page + "-" + idx
      PageData.insert(frame)

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
      console.log("#{collName} found:", res.fetch() )
      return res


