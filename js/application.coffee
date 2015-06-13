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

  # audio fragments
  youwin = new Audio "audio/You win sound effect 5.mp3"
  tada = new Audio "audio/177120__rdholder__2dogsound-tadaa1-3s-2013jan31-cc-by-30-us.wav"
  achievement = new Audio "audio/270404__littlerobotsoundfactory__jingle-achievement-00.wav"
  game = new Audio "audio/220184__gameaudio__win-spacey.wav"
  applaus = new Audio "audio/Applausss.mp3"
  soundtrack = $('#soundtrack')[0]
  soundtrack.volume -= 0.8
  # soundtrack.pause()

  # interactie
  applause = $('#applause')
  applause.click ->
    applause.addClass('hidden')
    applaus.pause()
  # webcam
  webcamlayer = $('#webcamlayer')
  webcamlayer.click ->
    webcamlayer.addClass('hidden')
  sayCheese = new SayCheese('#webcam', { snapshots: false, width:900 });
  sayCheese.start()


  # medals click events
  medal_containers = $('#medals').find('.l-col')
  for medal_container in medal_containers
    # alles
    medal = $(medal_container).find('.medal')
    text = $(medal_container).find('.text')
    text.click ->
      crown = $(this).parent().find('.crown')
      crown.removeClass('hidden')
      timeAction = 4000
      reset = ->
          crown.addClass('hidden')
          crown.removeClass('transitioning')
          crown.removeClass('action')
      resetcycle = ->
          reset()
          crown.removeClass('hidden')
          setTimeout actioncycle, 1000
      actioncycle = ->
        crown.addClass('transitioning')
        crown.addClass('action')
        resetID = setTimeout resetcycle, timeAction
        crown.click ->
          clearTimeout resetID
          reset()
      setTimeout actioncycle, 200
    medal.hover ->
      text = $(this).parent().find('.text')
      text.removeClass('hidden')
    text.mouseout ->
      $(this).addClass('hidden')
    crown  = $(medal_container).find('.crown')
    crown.click ->
      $(this).addClass('hidden')
      text = $(this).parent().find('.text')
      text.addClass('hidden')

    # per medal
    if medal.hasClass('youwin')
      text.click ->
        youwin.play()
    if medal.hasClass('tada')
      text.click ->
        tada.play()
    if medal.hasClass('achievement')
      text.click ->
        achievement.play()
    if medal.hasClass('game')
      text.click ->
        game.play()
        webcamlayer.removeClass('hidden')
    if medal.hasClass('applause')
      text.click ->
        applause.removeClass('hidden')
        applaus.play()
