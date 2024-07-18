# General
RK_SDK_PATH = ./rksdk

# Detect architecture
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
  LIB_ARCH = $(shell uname -m)
endif

# Paths
RGA_PATH = ./rksdk/include/rga
MPP_PATH = ./rksdk/include/mpp
RKNN_API_PATH = ./rksdk/include/librknn_api
ZLMEDIAKIT_PATH = ./rksdk/include/zlmediakit

# Variables
CXX = g++
# CXXFLAGS = -std=c++11 -I. -I./include -I${RKNN_API_PATH} -I${RGA_PATH} -I${MPP_PATH} -I${ZLMEDIAKIT_PATH}
CXXFLAGS = -std=c++11 -I. -I./include -I${RKNN_API_PATH} -I${RGA_PATH} -I${ZLMEDIAKIT_PATH}
LDFLAGS = -Wl,--allow-shlib-undefined -L${RK_SDK_PATH}/lib -lmk_api -lrga -lrknnrt -lrockchip_mpp

# Libraries
OPENCV_LIBS = $(shell pkg-config --libs --cflags opencv4)

# Source files
SRC_FILES = src/main.cc src/preprocess.cc src/postprocess.cc
VIDEO_SRC_FILES = src/main_video.cc src/postprocess.cc utils/mpp_decoder.cpp utils/mpp_encoder.cpp utils/drawing.cpp

# Targets
all: rknn_yolov5_demo rknn_yolov5_video_demo

rknn_yolov5_demo: $(SRC_FILES)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(OPENCV_LIBS) ${LDFLAGS}

rknn_yolov5_video_demo: $(VIDEO_SRC_FILES)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(OPENCV_LIBS) ${LDFLAGS}

clean:
	rm -f rknn_yolov5_demo rknn_yolov5_video_demo
