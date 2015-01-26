Template.story.helpers({
  activeLabel: function () {
    if (this.details.active) {
      return '<i class="ion-checkmark-circled"></i> Active';
    } else {
      return '<i class="ion-minus-circled"></i> Inactive';
    }
  }
});

Template.story.events({
  'click [data-action=fake]': function (event, template) {
    event.preventDefault();
    alert('Gotcha!');
  }
});
