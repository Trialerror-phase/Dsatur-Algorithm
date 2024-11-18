# Define Ruby interpreter and project directory
RUBY = ruby
PROJECT_DIR = dsatur_project

# Define source files
SRC_FILES = $(PROJECT_DIR)/graph.rb $(PROJECT_DIR)/dsatur.rb $(PROJECT_DIR)/generate_graphs.rb $(PROJECT_DIR)/main.rb

# Define the main target for running the program
run: $(SRC_FILES)
	$(RUBY) $(PROJECT_DIR)/main.rb

# Target to run a simple test (e.g., testing the graph generation functionality)
test_generate_graphs: $(PROJECT_DIR)/generate_graphs.rb $(PROJECT_DIR)/graph.rb
	$(RUBY) -r $(PROJECT_DIR)/generate_graphs.rb -e 'puts generate_general_graph(10).inspect'

# Target to test the DSatur algorithm on a small graph
test_dsatur: $(PROJECT_DIR)/dsatur.rb $(PROJECT_DIR)/graph.rb
	$(RUBY) -r $(PROJECT_DIR)/dsatur.rb -e 'puts dsatur(Graph.new).inspect'

# Clean up (e.g., remove any generated files if needed)
clean:
	@echo "Nothing to clean for now."
	@echo "If there are temporary files in the future, clean them here."

# Help target to list available commands
help:
	@echo "Makefile commands:"
	@echo "  make run              - Run the main script (main.rb)"
	@echo "  make test_generate_graphs - Test the graph generation functions"
	@echo "  make test_dsatur      - Test the DSatur algorithm with a sample graph"
	@echo "  make clean            - Clean temporary files"
