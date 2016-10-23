#!/usr/bin/env bash
./build-all.sh
docker push aliak00/dmd
docker push aliak00/ldc
docker push aliak00/gdc
