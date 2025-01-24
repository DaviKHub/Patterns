require_relative '../student_list/student_list'
require_relative '../models/student_short'
require_relative '../student_list/strategy/file_strategy_json'

class ListController
  attr_reader :data_list, :students_list
  attr_accessor :view

  def initialize(view)
    @view = view
    begin
      @students_list = StudentsList.new(filepath: '/Users/david/Patterns/Patterns_proj/student/data/students.json',
                                        strategy: FileStrategyJSON.new)
      @students_list.read
    rescue => e
      raise "Ошибка при загрузке данных: #{e.message}"
    end

    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
  end

  def refresh_data
    if @students_list.students.empty?
      puts "Нет данных для отображения."
      return
    end

    students_short_list = @students_list.get_k_n_student_short_list(@view.current_page, @view.students_per_page)
    @data_list.data = students_short_list.data
    @data_list.count = @students_list.get_student_short_count
    @data_list.offset = (@view.current_page - 1) * @view.students_per_page
    @data_list.notify
  end

  def change_page(page)
    begin
      total_items = @students_list.get_student_short_count
      total_pages = (total_items.to_f / @view.students_per_page).ceil

      new_page = @view.current_page + page
      return if new_page < 1 || new_page > total_pages

      @view.current_page = new_page
      refresh_data
    rescue => e
      raise "Ошибка при изменении страницы: #{e.message}"
    end
  end
end