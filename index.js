// Dependencies
var express= require('express');
var cjs= require('express-cjs');
var onefile= require('express-onefile');

// Public
module.exports= function(options){
  var middleware= express.Router();
  middleware.use(onefile(options));
  middleware.use(cjs({root:options.cwd}));

  // Fix by https://gist.github.com/59naga/b6bb5cd3ef3e2eb6cc09
  middleware.use(function(req,res,next){
    if(req.url.match(/.gz$/)){
      res.set('Content-Encoding','gzip');
    }
    if(req.url.match(/.js.gz$/)){
      res.set('Content-Type','application/javascript');
    }

    next();
  });
  middleware.use(express.static(options.cwd));

  return middleware;
};
