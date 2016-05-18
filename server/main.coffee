require '/imports/api/collections/actions.coffee'
{Events} = require '/imports/api/collections/events.coffee'

require '/imports/api/publications.coffee'
{Permissions} = require '/imports/api/permissions/permissions.coffee'
require '/imports/api/methods/recordObservedEvent.coffee'
require '/imports/api/methods/addAction.coffee'
require '/imports/api/methods/removeAction.coffee'

Meteor.startup ->
  WebApp.connectHandlers.use '/export', Meteor.bindEnvironment (req, res, next) ->
    cookies = {}
    _.each req.headers?.cookie?.split(';'), (c) ->
      [cookie, value] = c.trim().split('=', 2)
      cookies[cookie] = value
    token = cookies['meteor_login_token']
    unless token? and Permissions.userIsAdmin Meteor.users.findOne(
        "services.resume.loginTokens.hashedToken": Accounts._hashLoginToken(token)
      )?._id
      res.statusCode = 403
      res.end 'Access denied.'
      return

    #{writeCSV} = require 'meteor/hive:export-csv'
    writeCSV Events, {}, ['action', 'username', 'timestamp'], 'observations', res
