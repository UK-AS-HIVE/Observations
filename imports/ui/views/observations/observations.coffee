require './observations.html'
{Actions} = require '/imports/api/collections/actions.coffee'
require '/imports/api/methods/recordObservedEvent.coffee'
{ ReactiveVar } = require 'meteor/reactive-var'

Template.observations.onCreated ->
  @subscribe 'actions'
  @recorded = new ReactiveVar false

Template.observations.helpers
  actions: ->
    Actions.find()
  recorded: ->
    Template.instance().recorded.get()

Template.observations.events
  'click .action-button': (e, tpl) ->
    Meteor.call 'recordObservedEvent', @_id, (err, res) ->
      if res
        tpl.recorded.set true
        Meteor.setTimeout ->
          tpl.recorded.set false
        , 2000
