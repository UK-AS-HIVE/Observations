{ SimpleSchema } = require 'meteor/aldeed:simple-schema'
{ Mongo } = require 'meteor/mongo'

Events = new Mongo.Collection 'events'
Events.attachSchema new SimpleSchema
  actionId:
    type: String
  action:
    type: String
  userId:
    type: String
  username:
    type: String
  timestamp:
    type: new Date()
  attachments:
    # Array of FileRegistry _id's
    optional: true
    type: [ String ]

exports.Events = Events
