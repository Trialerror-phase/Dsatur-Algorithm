def dsatur(graph)
    uncolored_vertices = graph.adj_list.keys
    degree_saturation = Hash.new(0)
    graph.adj_list.each { |vertex, neighbors| degree_saturation[vertex] = neighbors.length }
  
    until uncolored_vertices.empty?
      vertex = select_vertex(uncolored_vertices, degree_saturation, graph)
      assign_color(vertex, graph)
      uncolored_vertices.delete(vertex)
      update_saturation(vertex, degree_saturation, graph)
    end
  
    graph.colors
  end
  
  def select_vertex(uncolored, saturation, graph)
    # Select the vertex with the highest saturation or highest degree
    uncolored.max_by { |v| [saturation[v], graph.adj_list[v].size] }
  end
  
  def assign_color(vertex, graph)
    used_colors = graph.adj_list[vertex].map { |neighbor| graph.colors[neighbor] }.compact
    new_color = ((1..Float::INFINITY).find { |c| !used_colors.include?(c) })
    graph.colors[vertex] = new_color
  end
  
  def update_saturation(vertex, saturation, graph)
    graph.adj_list[vertex].each do |neighbor|
      if graph.colors[neighbor].nil?
        saturation[neighbor] += 1
      end
    end
  end
  
  