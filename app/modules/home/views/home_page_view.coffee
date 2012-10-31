template = require './templates/home'
PageView = require '../../../views/base/page_view'
# Players = require 'models/players'
# Roster = require 'models/roster'
# PlayerChoices = require 'models/player_choices'

mediator = require 'mediator'

module.exports = class HomePageView extends PageView
  template: template
  className: 'home-page'
  
#   initialize: =>
#     @delegate 'keypress', '.unlockCode', @addCode
#   
#   addCode: (e) ->
#     if e.keyCode is 13
#       $.post "/game/players/enterCode/#{$(e.target).val()}/.json",
#       (data) => 
#         unless data.result? and data.result is false then (mediator.publish 'collections:fetch')
#         else alert 'invalid code'
#       
#       return false
  
  afterRender: =>
    super()

## Module Loader Examples:

#     mediator.publish 'collection:load',
#       id: 'roster'
#       class: Roster
#       done: (collection) =>
#         @collection = collection  
    
#     mediator.publish 'collection:load',
#       id: 'current_players'
#       class: Players
#       done: (collection) =>
#         @collection = collection        

#     mediator.publish 'collection:load',
#       id: 'player_choices'
#       class: PlayerChoices
#       done: (collection) =>
#         @collection = collection
# 
#     mediator.publish 'module:load', 
#       id: 'slider'
#       module: 'slider'
#       container: @$('#sliderView')
#       action: 'basic'
#       params:
#         test: '123'
#       initOptions:
#         collection_id: 'player_choices'
#         collection_class: PlayerChoices
#         
#     mediator.publish 'module:load', 
#       id: 'table'
#       module: 'table'
#       container: @$('#tableView')
#       action: 'basic'
#       params:
#         test: '123'
#       initOptions:
#         collection_id: 'player_choices'
#         collection_class: PlayerChoices
#         
#     mediator.publish 'module:load', 
#       id: 'roster'
#       module: 'table'
#       container: @$('#rosterView')
#       action: 'basic'
#       params:
#         test: '123'
#       initOptions:
#         collection_id: 'roster'
#         collection_class: Roster