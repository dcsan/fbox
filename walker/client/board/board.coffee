globit = (name, val) ->
  window[name] = val

clog = (m, v) ->
  v ?= ""
  console.log(m, v)

Template.board.rendered = () ->
  console.log("board rendered")
  # svg = Snap("#boardSvg")

  # window.gg = {
  #   svg: svg
  # }

  w = window.innerWidth
  h = window.innerWidth

  snap = Snap(w, h)

  svg = {}

  Snap.load "/board/board.svg", (fp) ->
    console.log("loaded svg", fp)
    svg.fp = fp
    svg.root = fp.select("g")
    snap.append(svg.root)
    introAnim(svg)

    # window.gg = {
    #   s: s
    #   f: f
    #   svgRoot: svgRoot
    # }

introAnim = (svg) ->
  window.svg = svg

  anim = {
    height:150
    width: 150
    fill: "#ff0000"
  }

  TILECOUNT = 8
  _.each [1..TILECOUNT], (c) ->
    tag = "#s" + c
    hue = (360/TILECOUNT) * c
    anim.fill = Snap.hsl(hue, 100, 50)
    clog(tag)
    svg.root.select(tag).animate(anim, 3000)

  svg.s1 = s1

