#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "please give a GPU id as a parameter (or -1 for CPU mode)"
    exit 1
fi

re='^-?[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   echo "GPU id must be a numeric parameter"
   exit 1
fi

GPU_ID=$1

exec python -u examples/mnist/train_mnist.py --gpu=$GPU_ID
