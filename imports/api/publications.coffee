{ Actions } = require '/imports/api/collections/actions.coffee'

Meteor.publish 'actions', ->
  Actions.find()
