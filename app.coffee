# Web 应用
path = require 'path'
express = require 'express'
passport = require 'passport'

config = require './libs/config'

{setting, db, mailer} = config

app = express()

require('./libs/mongodb') db
require('./libs/passport') passport
require('./libs/express') app, passport, setting, db
require('./libs/mailer') setting, db
require('./libs/events') setting
require('./starry/routes') app, setting

module.exports = app