# Description:
#   Get instagram images by hash tag
#
# Dependencies:
#   "instagram-node-lib": "*"
#   https://github.com/mckelvey/instagram-node-lib
#
# Configuration:
#   HUBOT_INSTAGRAM_CLIENT_KEY
#   HUBOT_INSTAGRAM_ACCESS_KEY
#
# Commands:
#   hubot insta tag <tag> <count>- Show recent instagram tags
#   by default count is 1
#
# Author:
#   raysrashmi
#


Instagram = require('instagram-node-lib')

module.exports = (robot) ->
  robot.respond /prenium/i, (msg) ->
    msg.send "got it"
    authenticateUser(msg)
    Instagram.tags.search
      q: 'kyleinfrontofwalls'
      complete: (data) ->
        index = Math.floor(Math.random() * data.length)
        imageUrl = data[index]['images']['standard_resolution']['url']
        msg.send imageUrl

authenticateUser = (msg) ->
  config =
    client_key:     process.env.HUBOT_INSTAGRAM_CLIENT_KEY
    client_secret:  process.env.HUBOT_INSTAGRAM_ACCESS_KEY

  unless config.client_key
    msg.send "Please set the HUBOT_INSTAGRAM_CLIENT_KEY environment variable."
    return
  unless config.client_secret
    msg.send "Please set the HUBOT_INSTAGRAM_ACCESS_TOKEN environment variable."
    return
  Instagram.set('client_id', config.client_key)
  Instagram.set('client_secret', config.client_secret)




