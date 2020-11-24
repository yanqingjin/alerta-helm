## Install/Upgrade

example for okd (helm3)
```
$ helm upgrade -i alerta . -f values-okd.yaml --create-namespace --namespace alerta
```

example for k8s (helm3)
```
$ helm upgrade -i alerta . -f values-k8s.yaml --create-namespace --namespace alerta
```