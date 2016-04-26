require '/imports/api/collections/actions.coffee'
require '/imports/api/collections/events.coffee'

{Permissions} = require '/imports/api/permissions/permissions.coffee'

require '/imports/ui/views/observations/observations.coffee'
require '/imports/ui/views/manage/manage.coffee'
require '/imports/ui/views/login/login.html'

Template.body.helpers
  isAdmin: ->
    Permissions.userIsAdmin Meteor.user()?._id

