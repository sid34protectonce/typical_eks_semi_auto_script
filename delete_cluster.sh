get_env_vars_new(){
        if [[ -z "${region}" ]]; then
        echo "region not found, thus exiting\n"
        exit 1
    fi

    if [[ -z "${cluster_name}" ]]; then
        echo "cluster_name not found, thus exiting\n"
        exit 1
    fi
}


delete_cluster(){
    eksctl delete cluster --name=${cluster_name} --region=${region}

    if [ $? -ne 0 ]; then
        echo "Delete command failed with exit code $?"
        exit 1
    fi
}

get_env_vars_new
delete_cluster