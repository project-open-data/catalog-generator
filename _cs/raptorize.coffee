# Heavily modified from: jQuery Raptorize Plugin 1.0
# www.ZURB.com/playground

class Raptorz

  audioSupported: false
  locked: false
  raptorImageMarkup: '<img id="elRaptor" style="display: none" src="' + Application.url + '/assets/img/raptor.png" />'
  raptorAudioMarkup: '<audio id="elRaptorShriek" preload="auto"><source src="' + Application.url + '/assets/media/raptor-sound.mp3" /><source src="' + Application.url + '/assets/img/raptor-sound.ogg" /></audio>'
  css:
    "position":"fixed"
    "bottom": "-700px"
    "right" : "0"
    "display" : "block"
  konami: [38,38,40,40,37,39,37,39,66,65]
  key_history: []
  raptor: null

  constructor: ->
    @audioSupported = Modernizr.audio.ogg || Modernizr.audio.mp3
    $(window).on "keydown.raptorz", @stalk

  #cleva, cleva girl...
  stalk: (e) =>
    @key_history.push e.keyCode
    @key_history.shift() if @key_history.length > @konami.length
    @attack() if _.isEqual @key_history, @konami

  # Append Raptor
  append: ->
    $('body').append @raptorImageMarkup
    $('body').append @raptorAudioMarkup if @audioSupported
    @raptor = $('#elRaptor')
    @reset()

  rawr: ->
    return unless @audioSupported
    document.getElementById('elRaptorShriek').play()

  attack: ->

    return if @locked

    @append() unless @raptor?
    @locked = true

    #Sound Hilarity
    @rawr()

    #Movement Hilarity
    @raptor.animate
      "bottom" : "0"
    , =>
      @raptor.animate
        "bottom" : "-130px"
      , 100, =>
        @raptor.delay(300).animate
          "right" : @raptor.position().left + 400
        , 2200, =>
          @reset()
          
  reset: ->
    @key_history = []
    @locked = false
    @raptor.css @css

Application.raptorz = new Raptorz()