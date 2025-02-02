require 'pg'
require_relative '../data_base/student_list_db'

class Connection
  DEFAULT = { dbname: 'students',
              user: 'postgres',
              password: '1234',
              host: 'localhost',
              port: 5432 }.freeze
  @instance = nil

  def self.instance
    @instance ||= new
  end

  attr_reader :connect

  def initialize
    @connect = PG.connect(DEFAULT)
  end

  def
  @connect.exec_params(query, params) end

  def execute(query, params = [])
    @connect.exec_params(query, params)
  end

  def close
    @connect.close
  end

  private_class_method :new
end