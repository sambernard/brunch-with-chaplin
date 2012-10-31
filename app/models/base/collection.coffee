Chaplin = require 'chaplin'

mediator = require 'mediator'

module.exports = class Collection extends Chaplin.Collection
  # Mixin a synchronization state machine
  # _(@prototype).extend SyncMachine

  init: =>
    mediator.subscribe 'collections:fetch', => 
      @fetch()
  
    @resolve()
    