require_relative './html_tree'

class Tree
  include Enumerable

  attr_accessor :root

  def initialize(html_string = nil)
    @root = parse_html(html_string) if html_string
  end

  private def parse_html(html_string)
    tags = divide_tags(html_string)
    construction_tree(tags)
  end

  private def divide_tags(html_string)
    html_string.scan(/<[^>]+>|[^<]+/)
  end

  def parse_tag(tag)
    tag.match(/<(\w+)(.*?)>/) do |match|
      tag_name = match[1]
      attributes = parse_attributes(match[2])
      return [tag_name, attributes]
    end
  end

  def parse_attributes(attributes_string)
    attributes = {}
    attributes_string.scan(/(\w+)=['"](.*?)['"]/) do |key, value|
      attributes[key] = value
    end
    attributes
  end

  private def construction_tree(tags)
    stack = []
    root = nil

    tags.each do |tag|
      if tag.start_with?('<') && !tag.start_with?('</')
        tag_name, attributes = parse_tag(tag)
        html_tree = HtmlTree.new(tag: tag_name, attributes: attributes)

        if stack.any?
          stack.last.add_branch(html_tree)
        else
          root = html_tree
        end

        stack.push(html_tree) unless tag.end_with?('/>')
      elsif tag.start_with?('</')
        stack.pop
      else
        next if tag.strip.empty?
        stack.last.content = tag.strip if stack.any?
      end
    end

    root
  end

  def to_s
    @root.to_s
  end

  def bfs
    return if @root.nil?

    queue = [@root]
    while queue.any?
      current_node = queue.shift
      yield(current_node)
      queue.concat(current_node.branch)
    end
  end

  def dfs
    return if @root.nil?

    stack = [@root]
    while stack.any?
      current_node = stack.pop
      yield(current_node)
      current_node.branch.reverse.each { |child| stack.push(child) }
    end
  end

  def each_bfs(&block)
    bfs(&block)
  end

  def each_dfs(&block)
    dfs(&block)
  end
  def each(&block)
    dfs(&block)
  end
end