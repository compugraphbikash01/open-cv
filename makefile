# Makefile to build the calib3d module of OpenCV

# Variables
OPENCV_DIR = $(shell pwd)
BUILD_DIR = $(OPENCV_DIR)/build
CMAKE_FLAGS = -D CMAKE_BUILD_TYPE=Release -D BUILD_LIST=calib3d ..
NUM_JOBS = 2 

# Targets
all: build

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Configure CMake
configure: $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake $(CMAKE_FLAGS) $(OPENCV_DIR)

# Build the calib3d module with reduced parallel jobs
build: configure
	cd $(BUILD_DIR) && make -j2

# Clean build directory
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all configure build clean
