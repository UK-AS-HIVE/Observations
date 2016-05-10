require '/imports/api/collections/actions.coffee'
require '/imports/api/collections/events.coffee'

{Permissions} = require '/imports/api/permissions/permissions.coffee'

Template.body.helpers
  isAdmin: ->
    Permissions.userIsAdmin Meteor.user()?._id

