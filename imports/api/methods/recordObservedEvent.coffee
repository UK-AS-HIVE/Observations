{ Actions } = require '/imports/api/collections/actions.coffee'
{ Events } = require '/imports/api/collections/events.coffee'

Meteor.methods
  'recordObservedEvent': (actionId) ->
    if @userId and a = Actions.findOne(actionId)
      Events.insert
        actionId: actionId
        action: a.name
        userId: @userId
        username: Meteor.users.findOne(@userId).username
        timestamp: new Date()
