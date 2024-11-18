# dsatur_project/main.rb
require 'graphviz'

require_relative 'graph'
require_relative 'dsatur'
require_relative 'generate_graphs'
require 'benchmark'

# Test general graph
general_graph = generate_general_graph(10)
puts "General Graph Coloring:"
puts dsatur(general_graph)
puts "Colors used: #{general_graph.colors.values.uniq.size}"

# Test bipartite graph
bipartite_graph = generate_bipartite_graph(5, 5)
puts "\nBipartite Graph Coloring:"
puts dsatur(bipartite_graph)
puts "Colors used: #{bipartite_graph.colors.values.uniq.size}"

# Benchmark time
general_time = Benchmark.realtime { dsatur(general_graph) }
bipartite_time = Benchmark.realtime { dsatur(bipartite_graph) }

puts "\nExecution Time Comparison:"
puts "General Graph: #{general_time.round(4)} seconds"
puts "Bipartite Graph: #{bipartite_time.round(4)} seconds"
