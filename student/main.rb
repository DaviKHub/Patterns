require_relative '../student/models/student'
require_relative '../student/models/student_short'
require_relative '../student/data_list/data_list'
require_relative '../student/data_list/data_table'
require_relative '../student/data_list/data_list_student_short'
require_relative '../student/student_list/strategy/file_strategy_yaml'
require_relative '../student/student_list/strategy/file_strategy_json'
require_relative '../student/student_list/strategy/file_strategy_txt'
require_relative '../student/student_list/strategy/file_strategy'
require_relative '../student/student_list/student_list'
require_relative '../student/binary_tree/tree_node'
require_relative '../student/binary_tree/binary_tree'
require_relative '../student/student_list/data_base/db_configuration'
require_relative '../student/student_list/data_base/student_list_db'
require_relative '../student/student_list/data_base/connection'
require_relative '../student/student_list/adapter/student_db_adapter'
require_relative '../student/student_list/adapter/student_list_adapter'
require_relative '../student/student_list/adapter/adapter'
require_relative '../student/mvc/app'
require 'fox16'
include Fox

begin
  strategy_yaml=FileStrategyYAML.new
  list_adapter1=StudentListAdapter.new('student_test.yaml', strategy_yaml)
  list=list_adapter1.get_k_n_student_short_list(1,10)
  puts list.ge

end