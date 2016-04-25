require './manage.html'
{ Actions } = require '/imports/api/collections/actions.coffee'

Template.manage.helpers
  actions: ->
    Actions.find()

Template.manage.events
  'click .remove-action': ->
    Meteor.call 'removeAction', @_id

  'click .add-action': (e, tpl) ->
    Meteor.call 'addAction', tpl.$('input[name=name]').val(), (err, res) ->
      if res
        tpl.$('input[name=name]').val('')
