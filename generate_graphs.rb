# Generates a random general graph
def generate_general_graph(vertex_count, edge_probability = 0.3)
    graph = Graph.new
    (1..vertex_count).each { |v| graph.add_vertex(v) }
  
    (1..vertex_count).each do |v1|
      (v1 + 1..vertex_count).each do |v2|
        graph.add_edge(v1, v2) if rand < edge_probability
      end
    end
    graph
  end
  
  # Generates a bipartite graph (perfect graph)
  def generate_bipartite_graph(part1_size, part2_size)
    graph = Graph.new
    part1 = (1..part1_size).to_a
    part2 = ((part1_size + 1)..(part1_size + part2_size)).to_a
  
    (part1 + part2).each { |v| graph.add_vertex(v) }
  
    part1.each do |v1|
      part2.each do |v2|
        graph.add_edge(v1, v2)
      end
    end
    graph
  end
  