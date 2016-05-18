require './manage.html'
{ Actions } = require '/imports/api/collections/actions.coffee'

Template.manage.onCreated ->
  @subscribe 'actions'
  @confirming = new ReactiveVar false
  @message = new ReactiveVar

Template.manage.onRendered ->
  @autorun =>
    if @message.get()
      # Show messages for 5 seconds.
      Meteor.setTimeout =>
        @message.set null
      , 5000

Template.manage.helpers
  actions: ->
    Actions.find()
  confirming: ->
    Template.instance().confirming.get()
  message: ->
    Template.instance().message.get()

Template.manage.events

  'click .remove-action': ->
    Meteor.call 'removeAction', @_id

  'keyup input[name=name], click .add-action': (e, tpl) ->
    if e.keyCode is 13 or !e.keyCode
      Meteor.call 'addAction', tpl.$('input[name=name]').val(), (err, res) ->
        if res
          tpl.$('input[name=name]').val('')

  'click button[data-action=reset]': (e, tpl) ->
    tpl.confirming.set true

  'click button[data-action=cancel]': (e, tpl) ->
    tpl.confirming.set false
    tpl.message.set null

  'keyup input[name=confirmReset], click button[data-action=confirm]': (e, tpl) ->
    if e.keyCode is 13 or !e.keyCode
      if tpl.$('input[name=confirmReset]').val().toLowerCase() is 'yes'
        Meteor.call 'resetResults', (err, res) ->
          if err
            tpl.message.set 'Something went wrong. Please try again later.'
          else
            tpl.confirming.set false
            tpl.message.set 'Results reset.'
      else
      tpl.message.set "Please type 'Yes' to confirm."
