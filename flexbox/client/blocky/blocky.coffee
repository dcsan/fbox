# TODO - body.onresize events to reorient/redraw the slider
# window.addEventListener("resize", myFunction);
# and remove on leaving


Template.blocky.rendered = () ->
  console.log("blocky.rendered")

  aspect = window.innerWidth / window.innerHeight

  wideSlider =
    orient: "wide"
    dots: false
    arrows: false
    vertical: false
    slidesToShow: 5

  tallSlider =
    orient: "tall"
    dots: false
    arrows: true
    vertical: true
    slidesToShow: 10

  if (aspect > 1)
    orient = tallSlider
  else
    orient = wideSlider

  defaultOpts =
    infinite: false
    focusOnSelect: false
    swipeToSlide: true

  opts = _.extend(defaultOpts, orient)
  console.log(opts)

  $('#carousel').slick(opts)


Template.blocky.destroyed = () ->
  console.log("blocky.destroyed")