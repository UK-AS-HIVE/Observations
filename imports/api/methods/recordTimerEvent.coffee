{ Events } = require '/imports/api/collections/events.coffee'

Meteor.methods
  'recordTimerEvent': (running) ->
    Events.insert
      type: if running then 'timerStart' else 'timerStop'
      userId: @userId
      username: Meteor.users.findOne(@userId).username
      timestamp: new Date()
