#!/bin/bash

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:rksdk/lib
./rknn_yolov5_demo model/yolov5s-640-640.rknn bus.jpg