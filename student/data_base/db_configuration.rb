require 'pg'

class DBConfiguration
  DEFAULT = { dbname: 'students',
              user: 'postgres',
              password: '1234',
              host: 'localhost',
              port: 5432 }.freeze
  attr_reader :connect
  def initialize
    @connect = PG.connect(DEFAULT)
  end
  def execute_query(query, params=[])
    connect.exec_params(query, params)
  end
  def close
    connect.close
  end
end