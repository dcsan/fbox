
# all new stories get added as stories.X (doesnt matter what X is)

stories.lost = [

  {
    chapter: "lost"
    page: "train"
    panels: [

      {
        widget: "caption"
        text: "You woke up suddenly."
      }

      {
        widget: "wideImage"
        src: "/assets/lost/train/train-int.jpg"
      }

      {
        widget: "caption"
        text: "The man in front turned around to look at you."
      }

      {
        widget: "thinking"
        text: "'Where am I, and who are these people?'"
        afterthought: " you think to yourself."
      }

      {
        widget: "caption"
        text: "But you don't say anything."
      }

      {
        widget: "caption"
        text: "How many hours had you slept?"
      }

      {
        widget: "twoChoice"
        text1: "Go back to sleep"
        url1: "sleepMore"
        text2: "Look around"
        url2: "lookAround"
        pause: true
      }
      
    ]
  }

  # -- sleepMore
  {
    chapter: "lost"
    page: "sleepMore"
    panels: [
      {
        widget: "shouting"
        text: "Hey, wake up!"
        animation: "shake"
      }

      {
        widget: "shouting"
        text: "Hey, you!"
        iterations: 2
        animation: "shake"
      }

      {
        widget: "twoChoice"
        text1: "Ignore him."
        url1: "walkAway"
        text2: "who the hell?"
        url2: "inspector"
        pause: true
      }

    ]
  }


  # -- lookAround
  {
    chapter: "lost"
    page: "lookAround"
    panels: [

      {
        widget: "caption"
        text: "You get up to look around"
      }

      {
        widget: "shouting"
        text: "Hey, you!"
        iterations: 2
        animation: "shake"
      }

      {
        widget: "caption"
        text: "Someone is shouting at you."
      }

      {
        widget: "twoChoice"
        text1: "Ignore them."
        url1: "walkAway"
        text2: "Who is it?"
        url2: "inspector"
        pause: true
      }

    ]
  }


  # -- lookAround
  {
    chapter: "lost"
    page: "walkAway"
    panels: [

      {
        widget: "caption"
        text: "You walk away"
      }

      {
        widget: "shouting"
        text: "Hey, I'm talking to you!"
        iterations: 2
        animation: "shake"
      }

      {
        widget: "twoChoice"
        text1: "Walk away"
        url1: "lookAround"
        text2: "Turn around"
        url2: "inspector"
        pause: true
      }

    ]
  }

]

