require_relative 'data_table'
require_relative 'data_list'

class DataListStudentShort < DataList
  def get_data
    index = 1
    result = [self.get_names]
    selected = self.get_selected
    selected.each do |selected_index|
      object = self.data[selected_index]
      row = [index, object.initials, object.git, object.contact]
      result.append(row)
      index += 1
    end
    DataTable.new(result)
  end

  def get_names
    ["id", "initials", "git", "contact"]
  end
end