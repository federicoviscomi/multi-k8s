#!/bin/bash
# WARNING: plain text password!
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
