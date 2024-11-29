require_relative 'tree'

tree = Tree.new(
'<html>
  <body>
    <div class="container">
      <p id="greeting">Hello, World!</p>
      <p>Test</p>
    </div>
    <div class="hello">
    </div>
  </body>
</html>'
)
tree.each_bfs{|a|print "#{a.tag} "}
puts
tree.each_dfs{|a|print "#{a.tag} "}