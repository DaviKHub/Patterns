require 'fox16'
include Fox

class TestApp < FXMainWindow
  def initialize(app)
    super(app, "Тест таблицы", width: 800, height: 600)

    table = FXTable.new(self, opts: LAYOUT_FILL)
    table.setTableSize(3, 4)
    table.setColumnText(0, "№")
    table.setColumnText(1, "ФИО")
    table.setColumnText(2, "Git")
    table.setColumnText(3, "Контакт")

    data = [
      [1, "Иванов И.И.", "https://github.com/ivanov", "+79211234567"],
      [2, "Петров П.П.", "https://github.com/petrov", "+79217654321"],
      [3, "Сидоров С.С.", "https://github.com/sidorov", "+79219876543"]
    ]

    data.each_with_index do |row, row_index|
      row.each_with_index do |value, col_index|
        table.setItemText(row_index, col_index, value.to_s)
      end
    end

    table.update
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

if __FILE__ == $0
  app = FXApp.new
  TestApp.new(app)
  app.create
  app.run
end