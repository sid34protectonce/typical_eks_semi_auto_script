source ./deploy_cluster.sh

get_env_vars

delete_cluster(){
    eksctl delete cluster --name=${cluster_name} --region=${region}

    if [ $? -ne 0 ]; then
        echo "Delete command failed with exit code $?"
        exit 1
    fi
}