require '/imports/api/collections/actions.coffee'
require '/imports/api/collections/events.coffee'

{Permissions} = require '/imports/api/permissions/permissions.coffee'

Template.body.helpers
  isAdmin: ->
    Permissions.userIsAdmin Meteor.user()?._id

Template.body.events
  'click .logout-button': ->
    Meteor.logout()

Tracker.autorun ->
  if Meteor.userId()
    Cookie.set 'meteor_login_token', Accounts._storedLoginToken()
    Cookie.set 'meteor_login_token_expires', Accounts._storedLoginTokenExpires()
  else
    Cookie.remove 'meteor_login_token'
    Cookie.remove 'meteor_login_token_expires'

