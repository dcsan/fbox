stories.inspector = [
  # -- inspector
  {
    chapter: "lost"
    page: "inspector"
    panels: [

      {
        widget: "headline"
        text: "the train inspector"
      }

      {
        widget: "wideImage"
        src: "/assets/lost/train/inspector.jpg"
      }

      {
        widget: "chatline"
        usericon: "/assets/lost/avatars/inspector.png"
        text: "hey, show me your ticket"
      }

      {
        widget: "shouting"
        text: "Where's your ticket?"
        iterations: 2
        animation: "shake"
      }

      {
        widget: "caption"
        text: "You need a ticket to be on this train you know."
      }

      {
        widget: "twoChoice"
        text1: "Ignore him."
        url1: "walkAway"
        text2: "go back to sleep"
        url2: "sleepMore"
        pause: true
      }

      {
        widget: "userInput"
        text: "talk to him. be smooth!"
      }

    ]
  }

]