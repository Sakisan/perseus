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
    medal.click ->
      text = $(this).parent().find('img.text')
      text.removeClass('hidden')
      # $(this).addClass('absolute')

    text = $(medal_container).find('img.text')
    text.click ->
      medal = $(this).parent().find('img.medal')
      $(this).addClass('hidden')
      # medal.removeClass('absolute')
