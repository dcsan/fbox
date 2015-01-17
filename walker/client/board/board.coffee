globit = (name, val) ->
  window[name] = val


Template.board.rendered = () ->
  console.log("board rendered")
  # svg = Snap("#boardSvg")

  # window.gg = {
  #   svg: svg
  # }

  snap = Snap(500, 500)

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

  s1 = svg.root.select("#s2")
  s1.attr({
    
  })


  svg.s1 = s1

  s1.animate {
    height:150
    width: 150
    fill: "#961726"
  }, 1000

