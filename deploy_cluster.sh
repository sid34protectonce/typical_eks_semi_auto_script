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
    eksctl create cluster --name=${cluster_name} --nodes=${nodes_number} --region=${region}
}