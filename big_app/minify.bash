#!/bin/bash

docker-slim  build --target my/big-shiny-app --show-clogs  --include-path-file 'r_path_includes' --publish-port 7123 --http-probe=false
