source ./deploy_cluster.sh

get_env_vars

delete_cluster(){
    eksctl delete cluster --name=${cluster_name} --region=${region}
}