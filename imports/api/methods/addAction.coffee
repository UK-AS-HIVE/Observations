{ Actions } = require '/imports/api/collections/actions.coffee'
{ Permissions } = require '/imports/api/permissions/permissions.coffee'

Meteor.methods
  'addAction': (name) ->
    if Permissions.userIsAdmin @userId
      Actions.insert { name: name }
