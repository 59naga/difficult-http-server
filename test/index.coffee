# Dependencies
difficultHttpServer= require '../src'
express= require 'express'
supertest= require 'supertest'
escapeRegExp= require 'lodash.escaperegexp'

path= require 'path'
fs= require 'fs'

# Environment
jasmine.DEFAULT_TIMEOUT_INTERVAL= 5000
PORT= 59798
cwd= path.join __dirname,'fixtures'

# Specs
describe 'difficultHttpServer',->
  server= null
  app= null
  beforeAll (done)->
    app= express()
    app.use difficultHttpServer {cwd}
    server= app.listen PORT,done

  afterAll (done)->
    server.close done

  it 'GET /',(done)->
    # coffeelint: disable=max_line_length
    regexp= '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>DifficultHTTPServer</title><script src="pkgs.js"></script><script src="index.js"></script><link href="index.css" rel="stylesheet"></head><body ui-view></body></html>'
    # coffeelint: enable=max_line_length

    supertest app
    .get '/'
    .expect 200
    .expect 'Content-type','text/html'
    .expect 'etag','db5b2972b562e62f45b7b3e7b7c20096'
    .expect 'content-encoding','gzip'
    .expect 'content-length',170
    .expect 'date',/.+?/
    .expect regexp
    .end (error,response)->
      if error then done.fail error else done()
      
  it 'GET /index.js(use browserify-ngannotate/plain-jadeify/brfs)',(done)->
    base64text= (fs.readFileSync __dirname+'/fixtures/assets/asset.txt').toString 'base64'

    regexps= [
      # coffeeify
      /this===coffee-react\(script\)/

      # coffee-react
      /React.createElement\("div",{className:"commentBox"},/

      # browserify-ngannotate
      /.controller\("annotate",\["\$scope",function/

      # plain-jadeify
      new RegExp escapeRegExp '<body ui-view></body>'
      
      # brfs
      new RegExp escapeRegExp base64text
    ]

    supertest app
    .get '/index.js'
    .expect 200
    .expect 'Content-type','application/javascript'
    .expect regexps[0]
    .expect regexps[1]
    .expect regexps[2]
    .expect regexps[3]
    .expect regexps[4]
    .end (error,response)->
      if error then done.fail error else done()

  it 'GET /index.css',(done)->
    regexps= [
      # preface of meyer-reset
      /^html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6/

      # imported assets/**
      /font-size:10vw/

      # Not include sourcemap
      /\}$/
    ]

    supertest app
    .get '/index.css'
    .expect 200
    .expect 'Content-type','text/css'
    .expect 'etag','ea2b05def8cba306857d3ce80b31c87a'
    .expect 'content-encoding','gzip'
    .expect 'content-length',449
    .expect 'date',/.+?/
    .expect regexps[0]
    .expect regexps[1]
    .expect regexps[2]
    .end (error,response)->
      if error then done.fail error else done()
