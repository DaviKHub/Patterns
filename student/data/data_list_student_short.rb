require_relative 'data_table'
require_relative 'data_list'

class DataListStudentShort < DataList
  private def column_names
    ["№", "initials", "git", "contact"]
  end

  private def build_row(index, object)
    [index, object.initials, object.git, object.contact]
  end
end