class HtmlTree
  attr_reader :tag, :attributes, :branch
  attr_accessor :content

  def initialize(tag:, attributes: {}, content: nil)
    @tag = tag
    @attributes = attributes
    @content = content
    @branch = []
  end

  def add_branch(tag)
    @branch.push(tag) if tag.is_a?(HtmlTree)
  end

  def count_branches
    branch.size
  end

  def has_branch?
    !branch.empty?
  end

  def attributes_string
    (attributes || {}).map { |key, value| " #{key}='#{value}'" }.join
  end

  def to_s(space = 0)
    spaces = "\t" * space
    open_tag = "<#{tag}#{attributes_string}>"
    close_tag = "</#{tag}>"

    unless content.nil? && branch.empty?
      string = "#{spaces}#{open_tag}\n"
      string += "#{spaces}\t#{content}\n" if content
      branch.each { |branch| string += branch.to_s(space + 1) }
      string += "#{spaces}#{close_tag}\n"
      string
    else
      "#{spaces}#{open_tag}/>\n"
    end
  end

end