#!/bin/bash

./server config_demo.ini 3000
sleep 10000
kill $!
