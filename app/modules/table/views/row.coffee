View = require '../../../views/base/view'

template = require './templates/row'

module.exports = class RowView extends View
  template: template
  autoRender: true
  tagName: 'tr'
  className: 'player'
  
  initialize: =>
    super
    
    @modelBind 'change:selected', @selectionChanged
  
  selectionChanged: =>
    if (@model.get 'selected') is true then @$el.addClass('selected')
    else @$el.removeClass('selected')