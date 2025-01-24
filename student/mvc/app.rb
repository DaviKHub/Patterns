require 'fox16'
include Fox
require_relative '../mvc/list_view'
require_relative '../mvc/list_controller'
if __FILE__ == $0
  app = FXApp.new
  view = ListView.new(app, controller: nil)
  app.create
  app.run
end