module.exports = () ->
  database_config = require('./config/database.json')
  knex = require('knex')(database_config)

  return {
    init: () ->
      knex.schema.hasTable('accounts').then (exists) ->
        if !exists
          console.log 'Create accounts table'
          knex.schema.createTable 'accounts', (table) ->
            table.increments('id').primary()
            table.string('login', 32).unique().notNullable()
            table.string('password', 128).notNullable()
      knex.schema.hasTable('users').then (exists) ->
        if !exists
          console.log 'Create users table'
          knex.schema.createTable 'users', (table) ->
            table.increments('id').primary()
            table.string('account_id').unique().notNullable()
            table.string('first_name', 32)
            table.string('last_name', 32)
            table.string('status', 16)
            table.string('lat', 16)
            table.string('lng', 16)
      knex.schema.hasTable('tags').then (exists) ->
        if !exists
          console.log 'Create tags table'
          knex.schema.createTable 'tags', (table) ->
            table.increments('id').primary()
            table.string('name').unique().notNullable()
      knex.schema.hasTable('userstags').then (exists) ->
        if !exists
          console.log 'Create userstags table'
          knex.schema.createTable 'userstags', (table) ->
            table.increments('id').primary()
            table.string('user_id').notNullable()
            table.string('tag_id').notNullable()
    accounts:
      login: (obj, cb) ->
        knex.select('*').from('accounts').rightJoin('users', () ->
          @.on('users.account_id', '=', 'accounts.id')
        ).where({'accounts.login': obj.login, 'accounts.password': obj.password}).then (data) ->
          if typeof cb is 'function'
            cb(data)
      create: (obj, cb) ->
        knex.insert(obj).into('accounts').then (data) ->
          if typeof cb is 'function'
            cb(data[0])
    users:
      create: (obj, cb) ->
        knex.insert(obj).into('users').then (data) ->
          if typeof cb is 'function'
            cb(data[0])
  }