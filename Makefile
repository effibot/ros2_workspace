# Compiler
CXX := g++

# Compiler flags
CXXFLAGS := -std=c++11 -Wall

# Directories
SRC_DIR := src
BUILD_DIR := build

# Source files
SRCS := $(wildcard $(SRC_DIR)/*.cpp)

# Object files
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# Executables
EXECS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%,$(SRCS))
# phony targets
.PHONY: all clean run action

# Default target
all: $(EXECS)

# Rule to build object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Rule to build executables
$(BUILD_DIR)/%: $(BUILD_DIR)/%.o
	$(CXX) $(CXXFLAGS) $< -o $@

# Clean target
clean:
	rm -rf $(BUILD_DIR)/*



# Rule to execute a specific program with arguments
# loop through all executables and run the one that matches the target name
# passed as an argument to the make command after 'run'. 
# additional arguments can be passed to the program by adding them after the target name
run: $(EXECS) 
	$(all)
	@$(eval make_args = $(filter-out $@, $(MAKECMDGOALS)))
	@$(eval target = $(word 1, $(filter-out $@, $(make_args))))
	@$(eval args = $(filter-out $(target), $(make_args)))
	@if echo "$(EXECS)" | grep -qw "$(BUILD_DIR)/$(target)"; then \
        	./$(BUILD_DIR)/$(target) $(args); \
    	else \
        	echo "Target $(target) non trovato"; \
        	exit 1; \
    	fi
%:
	@:
