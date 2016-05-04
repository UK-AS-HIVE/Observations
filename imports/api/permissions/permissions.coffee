{ Actions } = require '/imports/api/collections/actions.coffee'
{ Events } = require '/imports/api/collections/events.coffee'
{ _ } = require 'meteor/underscore'
{ Meteor } = require 'meteor/meteor'
{ Accounts } = require 'meteor/accounts-base'


exports.Permissions =
  userIsAdmin: (userId) ->
    Roles.userIsInRole userId, 'admin'

if Meteor.isServer
  Meteor.startup ->
    _.each Meteor.settings?.admins, (a) ->
      if u = Meteor.users.findOne({username: a})
        Roles.addUsersToRoles u._id, ['admin']

  Accounts.onLogin (attempt) ->
    if attempt.user?._id
      _.each Meteor.settings?.admins, (a) ->
        if a == attempt.user.username
          Roles.addUsersToRoles attempt.user._id, ['admin']

