check_vars(){
    if [[ -z "${node_name}" ]]; then
        echo "region not found, thus exiting\n"
        exit 1
    fi

    if [[ -z "${node_label}" ]]; then
        echo "region not found, thus exiting\n"
        exit 1
    fi
}

kubectl label nodes ${node_name} ${node_label}=true