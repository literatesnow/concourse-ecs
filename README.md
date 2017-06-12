# Concourse-ecs

Wrapper script which writes environment variables to files and starts concourse. Useful if you want to store your SSH keys in the environment instead of a data volume.

## Usage

Files can be created from environment variables matching the pattern ``FILE_n_PATH`` and ``FILE_n_CONTENTS.

Environment Variable|Description
---|---
FILE_n_PATH|The name of the file to create
FILE_n_CONTENTS|The contents of the file

Multiple pairs of environment variables can be specified.

## Example

Environment Variable|Value
---|---
CONCOURSE_BASIC_AUTH_USERNAME|main
CONCOURSE_BASIC_AUTH_PASSWORD|example
CONCOURSE_EXTERNAL_URL|https://concourse.example.com
CONCOURSE_POSTGRES_DATA_SOURCE|postgres://concourse:concourse@postgers-rds:5432/concourse
CONCOURSE_SESSION_SIGNING_KEY|/concourse-keys/session_signing_key
FILE_1_PATH|/concourse-keys/session_signing_key
FILE_1_CONTENTS|-----BEGIN RSA PRIVATE KEY-----\n[...]\n-----END RSA PRIVATE KEY-----\n
CONCOURSE_TSA_HOST_KEY|/concourse-keys/tsa_host_key
FILE_2_PATH|/concourse-keys/tsa_host_key
FILE_2_CONTENTS|-----BEGIN RSA PRIVATE KEY-----\n[...]\n-----END RSA PRIVATE KEY-----\n
CONCOURSE_TSA_AUTHORIZED_KEYS|/concourse-keys/authorized_worker_keys
FILE_3_PATH|/concourse-keys/authorized_worker_keys
FILE_3_CONTENTS|ssh-rsa [...] concourse@example
