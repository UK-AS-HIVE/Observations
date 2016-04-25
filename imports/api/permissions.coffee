{ Actions } = require '/imports/api/collections/actions.coffee'
{ Events } = require '/imports/api/collections/events.coffee'

Actions.allow
  insert: -> false
  update: -> false
  remove: -> false

Events.allow
  insert: -> false
  update: -> false
  remove: -> false
