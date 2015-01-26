lost = [
  {
    chapter: "lost"
    page: "train"
    panels: [
      {
        template: "headline"
        text: "Lost in America"
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


interview = [
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

@rawPages = [].concat(lost, interview)

# rawPages += lost
# rawPages += interview

console.log(JSON.stringify(rawPages, undefined, 2))

# console.log("rawPages", rawPages)