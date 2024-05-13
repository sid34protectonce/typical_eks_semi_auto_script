get_env_vars(){
    if [[ -z "${region}" ]]; then
        echo "region not found, thus exiting\n"
        exit 1
    fi

    if [[ -z "${cluster_name}" ]]; then
        echo "cluster_name not found, thus exiting\n"
        exit 1
    fi

    if [[ -z "${nodes_number}" ]]; then
        echo "nodes_number not found, going back to default value\n"
        export nodes_number=2
    fi
}


deploy_cluster(){
    echo "Changing the yaml"
    sed -e "s/basic-cluster/$cluster_name/g" \
    -e "s/eu-north-1/$region/g" \
    -e "s/desiredCapacity: 2/desiredCapacity: $nodes_number/g" \
    cluster.yaml > cluster-updated.yaml


    eksctl create -f cluster.yaml

    echo "Cluster deployed reverting the yaml"
    sed -e "s/$cluster_name/basic-cluster/g" \
    -e "s/$region/eu-north-1/g" \
    -e "s/desiredCapacity: $nodes_number/desiredCapacity: 2/g" \
    cluster.yaml > cluster-updated.yaml
}

get_env_vars
deploy_cluster