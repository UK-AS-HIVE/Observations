{ Actions } = require '/imports/api/collections/actions.coffee'
Meteor.methods
  'removeAction': (id) ->
    Actions.remove id
