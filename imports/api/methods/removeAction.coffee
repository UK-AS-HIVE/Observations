{ Actions } = require '/imports/api/collections/actions.coffee'
{ Permissions } = require '/imports/api/permissions/permissions.coffee'

Meteor.methods
  'removeAction': (id) ->
    if Permissions.userIsAdmin @userId
      Actions.remove id

