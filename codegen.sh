yarn codegen && sgqlc-codegen schema ./schema/schema.json ./schema/schema.py && chmod 777 ./schema
echo "from sgqlc.types.relay import Connection, connection_args"