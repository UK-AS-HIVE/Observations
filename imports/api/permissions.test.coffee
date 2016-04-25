{Permissions} = require './permissions.coffee'
{Meteor} = require 'meteor/meteor'
{expect} = require 'meteor/practicalmeteor:chai'

describe 'Permissions', ->
  before ->
    Meteor.users =
      findOne: (s) ->
        if s == 'fake1' or s.name == 'admin'
          _id: 'fake1'
          name: 'admin'
        else if s == 'fake2' or s.name == 'normal'
          _id: 'fake2'
          name: 'normal'

    Meteor.settings.admins =
      ['admin']

  it 'should acknowledge admins', ->
    expect(Permissions.userIsAdmin('fake1')).to.equal true

  it 'should reject non-admins', ->
    expect(Permissions.userIsAdmin('fake2')).to.equal false

  it 'should reject unknown users', ->
    expect(Permissions.userIsAdmin('unknown')).to.equal false

