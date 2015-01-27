
# all new stories get added as stories.X (doesnt matter what X is)

stories.lost = [
  {
    chapter: "lost"
    page: "train"
    panels: [
      {
        template: "headline"
        text: "Lost in America"
      }

      {
        template: "caption"
        text: "You woke up suddenly."
      }

      {
        template: "wideImage"
        src: "/assets/lost/train/train-int.jpg"
      }

      {
        template: "caption"
        text: "The man in front turned around to look at you."
      }

      {
        template: "thinking"
        text: "'Where am I, and who are these people?'"
        afterthought: " you think to yourself."
      }

      {
        template: "caption"
        text: "But you don't say anything."
      }

      {
        template: "caption"
        text: "How many hours had you slept?"
      }

      {
        template: "caption"
        text: "You could be anywhere, rolling through middle America."
      }

      {
        template: "twoChoice"
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
        template: "shouting"
        text: "Hey, wake up!"
        animation: "shake"
      }

      {
        template: "shouting"
        text: "Hey, you!"
        iterations: 2
        animation: "shake"
      }

      {
        template: "twoChoice"
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
        template: "caption"
        text: "You get up to look around"
      }

      {
        template: "shouting"
        text: "Hey, you!"
        iterations: 2
        animation: "shake"
      }

      {
        template: "caption"
        text: "Someone is shouting at you."
      }

      {
        template: "twoChoice"
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
        template: "caption"
        text: "You walk away"
      }

      {
        template: "shouting"
        text: "Hey, I'm talking to you!"
        iterations: 2
        animation: "shake"
      }

      {
        template: "twoChoice"
        text1: "Walk away"
        url1: "lookAround"
        text2: "Turn around"
        url2: "inspector"
        pause: true
      }

    ]
  }



  # -- inspector
  {
    chapter: "lost"
    page: "inspector"
    panels: [

      {
        template: "headline"
        text: "the train inspector"
      }

      {
        template: "wideImage"
        src: "/assets/lost/train/inspector.jpg"
      }

      {
        template: "chatline"
        usericon: "/assets/lost/avatars/inspector.png"
        text: "hey, show me your ticket"
      }


      {
        template: "shouting"
        text: "Where's your ticket?"
        iterations: 2
        animation: "shake"
      }

      {
        template: "caption"
        text: "Where's your ticket!"
      }
      {
        template: "caption"
        text: "You need a ticket to be on this train you know."
      }

      {
        template: "twoChoice"
        text1: "Ignore him."
        url1: "walkAway"
        text2: "go back to sleep"
        url2: "sleepMore"
        pause: true
      }

    ]
  }



]


stories.interview = [
  {
    page: "office"
    chapter: "interview"
    panels: [
      {
        template: "headline"
        text: "Your first day"
      }
    ]
  }
]
