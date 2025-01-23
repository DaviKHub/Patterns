require_relative 'mvc/app'
require 'pg'
require 'fox16'
include Fox
begin
  if __FILE__ == $0
    FXApp.new do |app|
      StudentApp.new(app)
      app.create
      app.run
    end
  end
rescue ArgumentError => e
  puts e.message
end