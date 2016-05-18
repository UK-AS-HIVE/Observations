{ Permissions } = require '/imports/api/permissions/permissions.coffee'
{ Events } = require '/imports/api/collections/events.coffee'

Meteor.methods
  'resetResults': ->
    if Permissions.userIsAdmin @userId
      Events.remove {}
    else
      throw new Meteor.Error 'Access Denied'


