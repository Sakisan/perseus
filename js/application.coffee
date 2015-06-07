$(document).ready ->

  # achtergrond aspect ratio
  video = $('#achtergrond')

  rx = 1200
  ry = 900
  rv = rx / ry

  jwindow = $(window)
  ww = jwindow.width()
  wh = jwindow.height()
  rd = ww / wh

  scale = rd / rv

  if scale > 1
    video.css('-webkit-transform','scaleX('+scale+')')
    video.css('-moz-transform','scaleX('+scale+')')
  else if scale < 1
    video.css('-webkit-transform','scaleY('+scale+')')
    video.css('-moz-transform','scaleY('+scale+')')

  # medals
  medal_containers = $('#medals').find('.l-col')
  for medal_container in medal_containers
    medal = $(medal_container).find('img.medal')
    text = $(medal_container).find('img.text')
    text.click ->
      crown = $(this).parent().find('img.crown')
      crown.removeClass('hidden')
    medal.hover ->
      text = $(this).parent().find('img.text')
      text.removeClass('hidden')
    text.mouseout ->
      $(this).addClass('hidden')
    crown  = $(medal_container).find('img.crown')
    crown.click ->
      $(this).addClass('hidden')
      text = $(this).parent().find('img.text')
      text.addClass('hidden')
