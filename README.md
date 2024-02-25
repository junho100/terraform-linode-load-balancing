# terraform-linode-archi-poc

Linode VM traffic routing using terraform

## Architecture Diagram

![linode-node-balancing drawio](https://github.com/junho100/terraform-linode-load-balancing/assets/55343124/92fb3756-ffd3-484e-bf3e-9befaf80c0b1)

## Getting started

1. create terraform.tfvars file in root dir
2. add api v4 token, password for logging in to vm

```
token=<TOKEN>
instance_password=<PASSWORD>
```

3. terraform plan, apply

## Document

https://velog.io/@junho100/terraform%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC-Linode-VM-%EC%9D%B4%EC%A4%91%ED%99%94-%EA%B5%AC%EC%84%B1
