require '/imports/api/collections/actions.coffee'
{Events} = require '/imports/api/collections/events.coffee'

require '/imports/api/publications.coffee'
require '/imports/api/permissions/permissions.coffee'
require '/imports/api/methods/recordObservedEvent.coffee'
require '/imports/api/methods/addAction.coffee'
require '/imports/api/methods/removeAction.coffee'

Meteor.startup ->
  WebApp.connectHandlers.use '/export', Meteor.bindEnvironment (req, res, next) ->
    #{writeCSV} = require 'meteor/hive:export-csv'
    writeCSV Events, {}, ['action', 'username', 'timestamp'], 'observations', res
