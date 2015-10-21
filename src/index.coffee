# Public
difficultHttpServer= (options={})->
  # Dependencies
  express= require 'express'
  cjs= require 'express-cjs'
  onefile= require 'express-onefile'

  # Setup middleware
  middleware= express.Router()

  # Fix by https://gist.github.com/59naga/b6bb5cd3ef3e2eb6cc09
  middleware.use (req, res, next)->
    if req.url.match /.gz$/
      res.set 'Content-Encoding', 'gzip'

    if req.url.match /.js.gz$/
      res.set 'Content-Type', 'application/javascript'

    next()

  middleware.use express.static(options.cwd)
  middleware.use onefile(options)
  middleware.use cjs(options)

  middleware

module.exports= difficultHttpServer
