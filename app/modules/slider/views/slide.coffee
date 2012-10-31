View = require '../../../views/base/view'

template = require './templates/slide'

module.exports = class SlideView extends View
  template: template
  autoRender: true
  tagName: 'div'
  className: 'slide player'
  
  initialize: =>
    super
    
    @delegate 'click', 'img', @toggleSelection
    @delegate 'click', '.unlock-btn', @unlock
    
    @modelBind 'change:selected', @selectionChanged
  
  selectionChanged: =>
    if (@model.get 'selected') is true then @$el.addClass('selected')
    else @$el.removeClass('selected')
    
  toggleSelection: =>
    @model.set
      selected: !(@model.get 'selected')
      
  unlock: =>
    @model.unlock()