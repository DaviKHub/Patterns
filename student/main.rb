require_relative '../student/models/person'
require_relative '../student/models/student'
require_relative '../student/models/student_short'
require_relative '../student/binary_tree/binary_tree'
require_relative '../student/binary_tree/tree_node'
require_relative '../student/data_list/data_list'
require_relative '../student/data_list/data_table'
require_relative '../student/data_list/data_list_student_short'
require_relative '../student/student_list/strategy/file_strategy_yaml'
require_relative '../student/student_list/strategy/file_strategy_json'
require_relative '../student/student_list/strategy/file_strategy_txt'
require_relative '../student/student_list/strategy/file_strategy'
require_relative '../student/student_list/data_base/student_list_db'
require_relative '../student/mvc/list_controller'

if __FILE__ == $0
  app = FXApp.new
  view = ListView.new(app)
  app.create
  app.run
end