{ Actions } = require '/imports/api/collections/actions.coffee'
{ Events } = require '/imports/api/collections/events.coffee'
{ _ } = require 'meteor/underscore'

exports.Permissions =
  userIsAdmin: (userId) ->
    _.contains Meteor.settings?.admins, Meteor.users.findOne(userId)?.name

