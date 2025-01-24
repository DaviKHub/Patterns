class FileStrategy
  def read(path)
    raise NotImplementedError
  end

  def save(path, data)
    raise NotImplementedError
  end
end