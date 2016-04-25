Meteor.methods
  'recordObservedEvent': (actionId) ->
    Events.insert
      actionId: actionId
      userId: @userId
      timestamp: new Date()
