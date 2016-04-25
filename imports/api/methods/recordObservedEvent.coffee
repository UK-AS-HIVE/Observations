{ Events } = require '/imports/api/collections/events.coffee'

Meteor.methods
  'recordObservedEvent': (actionId) ->
    if Actions.findOne(actionId) and @userId
      Events.insert
        actionId: actionId
        userId: @userId
        timestamp: new Date()
