
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
        template: "caption"
        text: "Hey, where's your ticket!"
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
