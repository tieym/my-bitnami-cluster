#! bin/bash

# this script is meant to quickly build a small cluster for demonstration purposes.

# to use this script (redhat9): 
# 1. source build-cluster-example.sh
# 2. buildnodes (number of nodes you want)

# this cluster does not have a pgpool proxy and is only usable for the machine it is running on.

function buildnodes(){



        #build partner node list
        partnerlist=""

        echo $1-1
        for(( i=0; i<= $1-1; i++ ))
        do
                echo "making $i"
                partnerlist="$partnerlist,pg-$i"
        done

        for(( i=0; i<= $1-1; i++ ))
        do
                 podman run --detach --name pg-$i \
                --network my-network \
                --env REPMGR_PARTNER_NODES=$partnerlist \
                --env REPMGR_NODE_NAME=pg-$i \
                --env REPMGR_NODE_NETWORK_NAME=pg-$i \
                --env REPMGR_PRIMARY_HOST=pg-1 \
                --env REPMGR_PASSWORD=root \
                --env POSTGRESQL_POSTGRES_PASSWORD=root \
                --env POSTGRESQL_USERNAME=admin \
                --env POSTGRESQL_PASSWORD=root \
                --env POSTGRESQL_DATABASE=customdatabase \
                test
        done

}
