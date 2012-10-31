CollectionView = require '../../../views/base/collection_view'
RowView = require './row'

template = require './templates/table'

module.exports = class TableView extends CollectionView
  template: template
  className: 'table'
  tagName: 'table'
  listSelector: 'tbody'
  fallbackSelector: '.noCodes'
   
  getTemplateFunction: =>
     @template
  
  getView: (player) ->
    new RowView model: player