stories.lookTicket = [

  {
    chapter: "lost"
    page: "lookTicket"
    panels: [

      {
        widget: "headline"
        text: "lost ticket"
      }

      {
        text: "you look in your backpack for the ticket"
      }

      {
        widget: "backpack"
        items: [
          {icon: "/items/sandwich.jpg", cname: "sandwich"}
          {icon: "/items/flashlight.jpg", cname: "flashlight"}
        ]
        pause: true
      }

      # this gets skipped by nextPanel
      {
        widget: 'chatline'
        text: "hmm."
      }

      {
        widget: 'chatline'
        text: "What am I going to do with that?"
        usericon: "/assets/lost/avatars/inspector.png"
      }

      {
        widget: 'chatline'
        text: "If you don't have a ticket, you have to get off the train."
        usericon: "/assets/lost/avatars/inspector.png"
      }

      {
        widget: "continue"
        text: "to be continued..."
        url: "/tbc"
      }

    ]
  }

]