while ! kubectl get nodes > /dev/null 2>&1;
do
    echo "waiting for k8s cluster to start"
    sleep 10
done

kubectl get --raw /apis | grep -q metrics.k8s.io || kubectl apply -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/metrics-server/v1.8.x.yaml
