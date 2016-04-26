require './timer.html'

Template.timer.onCreated ->
  @start = Date.now()
  @time = new ReactiveVar()

  self = @

  zeroPad = (a) ->
    a = a.toString(10)
    ("00"+a).slice(Math.min(-2, -a.length))

  Meteor.setInterval ->
    t = (Date.now() - self.start) / 1000
    s = Math.floor(t % 60)
    m = Math.floor(t/60)
    self.time.set (zeroPad(m) + ':' + zeroPad(s))
  , 1000

Template.timer.helpers
  time: ->
    Template.instance().time.get()

