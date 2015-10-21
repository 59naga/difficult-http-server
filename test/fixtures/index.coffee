fs= require 'fs'
require './assets'
require './index.jade'
text= fs.readFileSync __dirname+'/assets/asset.txt'

# Use angular
app= angular.module 'myApp',[]
app.controller 'annotate',($scope)->
  console.log '$scope is alive'

# Use react
class CommentBox extends React.Component
  render: ->
    <div className="commentBox">
      Hello, world! I am a CommentBox.
    </div>
