class Graph
    attr_accessor :adj_list, :colors
  
    def initialize
      @adj_list = {}
      @colors = {}
    end
  
    def add_vertex(vertex)
      @adj_list[vertex] ||= []
    end
  
    def add_edge(v1, v2)
      @adj_list[v1] << v2
      @adj_list[v2] << v1
    end
  end
  