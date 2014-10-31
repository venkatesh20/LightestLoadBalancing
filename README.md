LightestLoadBalancing
=====================

Repository for ECE 1747 Assignment 1

This repository contains the modified SimMud source code for the lightest load balancing algorithm. Most of the changes made were to server/WorldMap.cpp (implementation of balance_lightest) and server/WorldUpdateModule.cpp (addition of counters for various types of requests and updates). The config_demo*.ini file was modified to test for the following 2 cases:
1. There is no quest and players are moving randomly.
2. A quest occurs and players flock to a particular region.

The load-balancing takes place when the number of players on the heaviest server goes past the overload threshold (set in config_demo*.ini)

The .csv files contain the raw data from the counters processed using the perl script test.pl.
