if Meteor.isClient

  @MockData = [
    {
      title: "deck"
      src: "https://docs.google.com/drawings/d/1c2UOdVfTdVQmG0YpG8lAyySSOa-0bWu5wl_8Ybk-sf4"
    }


    {
      title: "lessonList"
      src: "/mockart/lessonList.png"
      next: "lessonCover"
      type: "local"  # not google
    }

    {
      title: "lessonCover"
      src: "https://docs.google.com/drawings/d/157lC5B0CRhOFXcvQKcgMiG7pDiOZY1E-WvTO2vDuGvQ"
      next: "lessonPage01"
    }

    {
      title: "lessonPage01"
      src: "https://docs.google.com/drawings/d/1lDnDbg8pRx8rQ9EjPEKc4KJ-Q7q_AMM-Z-EQYmqM16Q"
      next: "levelUp"
    }

    {
      title: "levelUp"
      src: "https://docs.google.com/drawings/d/1dtNix_x7R2FGiss5NczZjWOHhOMtD7p2wVqeYCa_xus"
      next: "lessonList"
    }

  ]


  _.each MockData, (mock) ->
    if mock.type == "local"
      mock.img = mock.src
    else
      mock.editUrl = mock.src + "/edit"
      mock.img = mock.src + "/pub?w=250&h=445"


  # console.log MockData