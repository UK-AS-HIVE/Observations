require '/imports/api/collections/actions.coffee'
require '/imports/api/collections/events.coffee'

{Permissions} = require '/imports/api/permissions/permissions.coffee'

Template.body.helpers
  isAdmin: ->
    Permissions.userIsAdmin Meteor.user()?._id

Tracker.autorun ->
  if Meteor.userId()
    Cookie.set 'meteor_login_token', localStorage['Meteor.loginToken']
    Cookie.set 'meteor_login_token_expires', localStorage['Meteor.loginTokenExpires']
  else
    Cookie.remove 'meteor_login_token'
    Cookie.remove 'meteor_login_token_expires'

