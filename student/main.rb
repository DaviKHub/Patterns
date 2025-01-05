require_relative 'models/student'
require_relative 'models/student_short'
require_relative 'data_base/db_configuration'
require_relative 'data_base/student_list_DB'

db_handler1=DBConfiguration.instance
result = db_handler1.execute_query("SELECT * FROM student WHERE id = $1", [3])
result.each do |element|
  puts element
end
db_handler2 = DBConfiguration.instance
puts db_handler2.equal?(db_handler2) # true
db_handler1.close