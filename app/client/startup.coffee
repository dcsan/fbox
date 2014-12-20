@Transform = null

FView.ready ->
  Transform = famous.core.Transform

  # Famono: load famo.us shims and CSS
  famous.polyfills
  famous.core.famous # CSS