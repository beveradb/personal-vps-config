#!/bin/bash

/opt/bitnami/bncert-tool \
  --installdir "/opt/bitnami" \
  --domains "andrewbeveridge.co.uk beveradb.com homearea.beveradb.com beveridge.uk beveridges.uk beveridges.co.uk homearea.info techfixuk.com www.andrewbeveridge.co.uk www.beveradb.com www.beveridge.uk www.beveridges.uk www.beveridges.co.uk www.homearea.info" \
  --enable_https_redirection 1 \
  --enable_nonwww_to_www_redirection 0 \
  --enable_www_to_nonwww_redirection 1 \
  --email "andrew@beveridge.uk" \
  --accept_tos 1 

