{ Actions } = require '/imports/api/collections/actions.coffee'

Meteor.methods
  'addAction': (name) ->
    # check permissions
    Actions.insert { name: name }
