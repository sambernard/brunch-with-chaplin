Controller = require 'controllers/base/controller'
mediator = require 'mediator'
Header = require 'modules/header/models/header'
HeaderView = require 'modules/header/views/header_view'

module.exports = class HeaderController extends Controller
  initialize: ->
    super
    @model = new Header()
    @view = new HeaderView({@model})
