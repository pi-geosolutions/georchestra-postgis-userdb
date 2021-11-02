#!/bin/bash

for file in `ls $PGTUNE_FOLDER/*.sql`; do
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --no-password -f $file
done
