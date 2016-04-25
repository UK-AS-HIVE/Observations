require './observations.html'
{Actions} = require '/imports/api/collections/actions.coffee'
require '/imports/api/methods/recordObservedEvent.coffee'

Template.observations.helpers
  actions: ->
    Actions.find()

Template.observations.events
  'click .action-button': ->
    Meteor.call 'recordObservedEvent', @_id

