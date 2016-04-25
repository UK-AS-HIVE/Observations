{ SimpleSchema } = require 'meteor/aldeed:simple-schema'
{ Mongo } = require 'meteor/mongo'

Actions = new Mongo.Collection 'actions'
Actions.attachSchema new SimpleSchema
  name:
    type: String
    label: "Action Name"

exports.Actions = Actions
