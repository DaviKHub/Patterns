require_relative 'models/student'
require_relative 'models/student_short'
require_relative 'data_base/db_configuration'
require_relative 'data_base/student_list_DB'

db_handler=DBConfiguration.new
student_list_db=StudentListDB.new(db_handler)
retrieved_student = student_list_db.get_by_id(3)
puts retrieved_student

puts student_list_db.get_count