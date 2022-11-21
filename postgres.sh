#!/usr/bin/env bash

postgres \
    -D "$PGDATA" \
    -c unix_socket_directories="$PGDATA" \
    -c listen_addresses='*' \
    -c log_destination='stderr' \
    -c logging_collector=off \
    -c log_min_messages=info \
    -c log_min_error_statement=info \
    -c log_connections=on
