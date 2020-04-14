#!/bin/bash

set -eu

echo "--- :date: bump datestamp"

date +%s > datestamp
