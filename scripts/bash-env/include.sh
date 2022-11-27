#! /bin/bash
varcheck() {
  for var in $@; do
      echo "${var} = ${!var}"
      if [[ -z "${!var}" ]]; then
        echo "Must provide ${var} in environment" 1>&2
        exit 1
      fi
  done
}

	