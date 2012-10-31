Chaplin = require 'chaplin'

mediator = require 'mediator'

module.exports = class Controller extends Chaplin.Controller

#overwrite chaplinController- otherwise init is called twice
  constructor: () ->
    @initDeferred()
    super()
  
  initialize: (options) ->

    unless @asModule or @asController?
      @init(options)
    else
      if @isModule and @asModule
        @asModule(options)
      else if @isModule isnt true and @asController?
        @asController(options)  
      
    return @promise()
          
  # Creates a new deferred and mixes it into the controller
  # This method can be called multiple times to reset the
  # status of the Deferred to 'pending'.
  initDeferred: ->
    _(this).extend $.Deferred()
    
  #initialize will wrap this in a Deferred Object
  init: () =>
    @loaded()
  
  loaded: () =>
    @resolve.apply(arguments)
    
  loadCollection: (collection_id, collection_class) =>  
    mediator.publish 'collection:load',
      id: collection_id
      class: collection_class
      done: (collection) =>
        @collection = collection
        @loaded()