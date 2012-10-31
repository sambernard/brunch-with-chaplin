mediator = require 'mediator'

module.exports = class ModuleLoader
  constructor: ->
    @initialize()

  moduleInstances: {}
  registeredModules: 
    slider: 'controllers/slider_controller'
    table: 'controllers/table_controller'
  

  collections: {}

  initialize: =>
    #console.debug 'ModuleLoader#initialize'
    mediator.subscribe 'module:load', @loadModule
    mediator.subscribe 'collection:load', @loadCollection

  loadCollection: (options) =>
    window.collections = @collections
    
    unless options.params?
      options.params = {}
    
    unless options.options?
      options.options = {}

    unless @collections[options.id]?
      try
        @collections[options.id] = new options.class(options.options)
        @collections[options.id].keepAlive = true
        @collections[options.id].initDeferred()
        @collections[options.id]['_dispose'] = @collections[options.id].dispose
        @collections[options.id].dispose = null
        @collections[options.id].init?()
        mediator.publish "collection:loaded::#{options.id}"
      catch err
        console.log err
  
    if @collections[options.id]?
      if options.done
        @collections[options.id].done ( =>
          options.done(@collections[options.id])
        )

  loadModule: (options) =>
    unless options.id?
      unless options.container?
        options.container = $("##{id}")

    unless options.initOptions?
      options.initOptions = {}

    unless options.params?
      options.params = {}

    options.params.container = options.container

    unless @moduleInstances[options.id]?
      try
        module = require @registeredModules[options.module]
        @moduleInstances[options.id] = new module()
        @moduleInstances[options.id].isModule = true
        @moduleInstances[options.id].initialize options.initOptions
        mediator.publish "module:loaded::#{options.id}"

      catch err
        console.log err
    
    @moduleInstances[options.id].done( => 
      @moduleInstances[options.id][options.action] options.params
    )
    
    

  disposeModule: (id) =>
    #console.debug('disposeModule', arguments)