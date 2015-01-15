if Meteor.isClient

  @MockData = [

    {
      title: "deck"
      src: "1c2UOdVfTdVQmG0YpG8lAyySSOa-0bWu5wl_8Ybk-sf4"
    }

    {
      title: "lessonList"
      src: "/mockart/lessonList.png"
      type: "local"  # not google
    }

    {
      title: "lessonCover"
      src: "157lC5B0CRhOFXcvQKcgMiG7pDiOZY1E-WvTO2vDuGvQ"
    }

    {
      title: "lessonPage01"
      src: "1lDnDbg8pRx8rQ9EjPEKc4KJ-Q7q_AMM-Z-EQYmqM16Q"
    }

    {
      title: "levelUp"
      src: "1dtNix_x7R2FGiss5NczZjWOHhOMtD7p2wVqeYCa_xus"
      next: "/top"
    }


    {
      title: "lessonList-collapsible"
      src: "1fAm19uv-OTWvCSOwi4rTUA-hha6wWOdovCRvXR9oKko"
      next: "/mocks/lessonPage01"
    }

    # quiz game
    {
        title: "wow-start"
        src: "1_wjhGJAwcdP7f1XWMNoEau9sdwTVaM1RXV-EKBPWRwQ"
    }

    {
        title: "boss-instructions"
        src: "1GbCf7TGifpJE-XBVSoMTT-W0DvxObwKrGQSZSO7jjmM"
    }

    {
        title: "q1.1"
        src: "1FyDL-4KjXgRf_yEkp6X-GOtZV6OF3SltqSK9KA_fkuE"
    }
    {
        title: "q1.2"
        src: "1EttFuQpOR4eu5m3R5H1GbFClwMFaJqkct9UzLM-YjrI"
    }
    {
        title: "q1.3"
        src: "1kF1z90xFt66M674zrlFxEZriw6i89Isr1S9izkLMnms"
    }

    {
        title: "q1-answer"
        src: "1DKmo_fanL3036yuren9A4GC0vPuPuja0usQIAMimGXw"
    }

    {
        title: "q1-feedback"
        src: "1bqGmGmv5agugDZTSH2fy93gPifsSUpTo1AURqE57AwE"
    }


    {
        title: "q2-1"
        src: "1NkeUAtTGqE92H9LAOKa3HCYOZB7DFf2t6Rx5-UZ9liQ"
    }
    {
        title: "q2-answer"
        src: "1LwfD7ZDY_hjQFIPPkvjdl2jrbzI90Y6mV0yWyenU4eA"
    }

    {
        title: "q2-feeback"
        src: "1vVvqIgo5jC3Ur6j8Z9jPPlnO7PsVj1EMq4sfMJABVNM"
    }

    {
        title: "end set"
        src: "1Fj5fmT9ANnOhOkpTVD_CkdYFxPb1Rj_nztB3tnFVOqg"
    }

    {
        title: "score-stars"
        src: "1WCxjP5KFpLKD7JqJ5qlpIbFZfIl3VHBgmd3F1ze8jpk"
    }

  ]


  _.each MockData, (mock, idx) ->
    prefix = "https://docs.google.com/a/biz.pikkle.com/drawings/d/"
    console.log("idx", idx)
    prev = mock
    mock.cname = mock.title + "-#{idx}"
    if mock.type == "local"
      mock.img = mock.src
    else
      mock.editUrl = prefix + mock.src + "/edit"
      mock.img = prefix + mock.src + "/pub?w=250"

    unless mock.next
      nextMock = MockData[idx+1]  # each one points forward by default
      mock.next = nextMock.title if nextMock

  console.log MockData