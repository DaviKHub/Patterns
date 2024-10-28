class Person
  attr_reader :id, :git # автоматическая генерация геттеров

  def initialize(id: nil, git: nil)
    self.id = id if id
    self.git = git if git
  end

  def id=(id)
    self.class.valid_id?(id) ? @id = id : raise(ArgumentError, id)
  end

  def git=(git)
    self.class.valid_git?(git) ? @git = git : raise(ArgumentError, git)
  end

  def self.valid_id?(id)
    id.match?(/\A\d{10}\z/)
  end

  def self.valid_git?(git)
    git.match?(/\Ahttps:\/\/github.com\/[a-zA-Z0-9_-]+\z/)
  end

  private def git_present?(git)
    !git.nil? && !git.empty?
  end

  def self.parse_from_string(string)
    data = {}
    string.split('; ').each do |pair|
      key, value = pair.split(': ').map(&:strip)
      case key.downcase
      when "id"
        data[:id] = value
      when "github"
        data[:git] = value
      end
    end
    data
  end
end