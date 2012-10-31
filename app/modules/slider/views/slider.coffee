CollectionView = require '../../../views/base/collection_view'
SlideView = require './slide'

template = require './templates/slider'

module.exports = class SliderView extends CollectionView
  template: template
  className: 'slider'
  tagName: 'div'
  listSelector: '.slides'
  fallbackSelector: '.noCodes'  
  
  getView: (player) ->
    new SlideView model: player