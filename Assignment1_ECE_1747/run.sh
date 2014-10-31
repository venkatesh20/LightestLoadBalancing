#!/bin/bash

for i in {1..201}
do
  ./client --nogui :3000 &
done
