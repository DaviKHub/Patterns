require 'pg'

class DBConfiguration
  DEFAULT = { dbname: 'students',
              user: 'postgres',
              password: '1234',
              host: 'localhost',
              port: 5432 }.freeze
  @instance = nil

  def self.instance(dbconfig = DEFAULT)
    @instance ||= new(dbconfig)
  end

  attr_reader :connect

  private def initialize(dbconfig)
    @connect = PG.connect(dbconfig)
  end

  def execute_query(query, params = [])
    connect.exec_params(query, params)
  end

  def close
    connect.close
  end

  private_class_method :new
end