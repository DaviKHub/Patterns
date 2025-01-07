class FileStrategy
  def load(path)
    raise NotImplementedError
  end

  def save(path, data)
    raise NotImplementedError
  end
end