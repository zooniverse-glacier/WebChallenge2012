class Countdown
  target: +new Date() + 1000 * 60 * 60 * 24 * 7

  el: null
  tagName: 'span'
  className: 'its-the-final-countdown'
  template: '''
    <span class="weeks number"></span>
    <span class="weeks number"></span>
    <span class="separator">:</span>
    <span class="days number"></span>
    <span class="days number"></span>
    <span class="separator">:</span>
    <span class="hours number"></span>
    <span class="hours number"></span>
    <span class="separator">:</span>
    <span class="minutes number"></span>
    <span class="minutes number"></span>
    <span class="separator">:</span>
    <span class="seconds number"></span>
    <span class="seconds number"></span>
  '''

  constructor: (params = {}) ->
    @[key] = value for key, value of params

    @target = +@target

    @el ?= "<#{@tagName}></#{@tagName}>"
    @el = $(@el)
    @el.html @template
    @el.addClass @className

    @tick()

  tick: =>
    ms = @target - new Date()

    seconds = Math.floor ms / 1000
    minutes = Math.floor seconds / 60
    seconds = Math.floor seconds - (minutes * 60)
    hours = Math.floor minutes / 60
    minutes = Math.floor minutes - (hours * 60)
    days = Math.floor hours / 24
    hours = Math.floor hours - (days * 24)
    weeks = Math.floor days / 7
    days = Math.floor days - (weeks * 7)

    @render {weeks, days, hours, minutes, seconds}

    setTimeout @tick, 1000

  render: (times) ->
    for unit, value of times
      unitContainers = @el.find ".#{unit}.number"
      value = "000#{value}"[-2...].split ''
      for digit, i in value
        container = unitContainers.eq i
        unless container.html() is digit
          container.addClass 'flip'
          setTimeout $.proxy(container, 'removeClass', 'flip'), 50
          container.html digit

window.App.Countdown = Countdown
