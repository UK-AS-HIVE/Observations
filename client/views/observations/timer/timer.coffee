require './timer.html'

Template.timer.onCreated ->
  @start = Date.now()
  @running = new ReactiveVar false
  @time = new ReactiveVar '00:00'

  self = @

  zeroPad = (a) ->
    a = a.toString(10)
    ("00"+a).slice(Math.min(-2, -a.length))

  Meteor.setInterval ->
    if self.running.get()
      t = (Date.now() - self.start) / 1000
      s = Math.floor(t % 60)
      m = Math.floor(t/60)
      time = zeroPad(m) + ':' + zeroPad(s)
      self.time.set time
  , 1000

Template.timer.helpers
  time: ->
    Template.instance().time.get()
  buttonText: ->
    if Template.instance().running.get()
      "Stop"
    else
      "Start"

  buttonClass: ->
    if Template.instance().running.get()
      "btn-danger"
    else
      "btn-success"

Template.timer.events
  'click button': (e, tpl) ->
    tpl.start = Date.now()
    tpl.running.set !tpl.running.get()
    Meteor.call 'recordTimerEvent', tpl.running.get()

