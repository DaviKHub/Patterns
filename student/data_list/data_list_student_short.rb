require_relative 'data_table'
require_relative 'data_list'

class DataListStudentShort < DataList

  private def get_names
    ["№", "initials", "git", "contact"]
  end

  private def build_row(index)
    [index + 1, @data[index].initials, @data[index].git, @data[index].contact]
  end
end