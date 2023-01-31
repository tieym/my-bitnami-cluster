#! /bin/bash


 backends="$(PGCONNECT_TIMEOUT=15 PGPASSWORD="$PGPOOL_POSTGRES_PASSWORD" psql -U "$PGPOOL_POSTGRES_USERNAME" \
        -d postgres -h "localhost" -p "5432" -tA -c "SHOW pool_nodes;")"
        

if [[ $backends != *"down"* ]]
then 
        echo "all nodes are working"
        exit 0
    else
        echo "one or more nodes are down"
        exit 1
fi





