# AWS EKS Infrastructure Automation with Terraform

## THIS PROJECT IS DIFFERENT FROM V1

The Jenkins deployment automation was changed to Jenkins running on docker not on EC2 directly

## PROJECT STRUCTURE
**The project is split into directories for simplicity**

> infrastructure >dev         _Dev environment_
> infrastructure >modules     _modules environment_
> eks

## TO DEPLOY THE TERAFORM INFRA
Install terraform (required_version = 0.12)
[Follow the link to install terraform](https://learn.hashicorp.com/terraform/azure/install_az)

### Deployment Process
The deployment is environment defined

Switch to appropriate directory for your environment
```
cd dev/
```
deploy infrastructure with the command below
```
terraform init
terraform apply
```
***The environment will spin up***

## TO SEE THE CLUSTER 
Configure kubectl
***terraform output kubeconfig and config-map-auth to be passed into files for authentication to cluster***
```
***terraform output kubeconfig > ~/.kube/config***
terraform output config-map-aws-auth > config-map-aws-auth.yaml
```

## Configure config-map-auth-aws
terraform output config-map-aws-auth # save output in config-map-aws-auth.yaml
```
kubectl apply -f config-map-aws-auth.yaml
```

## See nodes coming up
```
kubectl get nodes
```
TO AVOID RUNNING BILLS ON AWS CLEAR THE DEPLOYMENT
## Destroy
To make sure all the resources created by Kubernetes are removed (LoadBalancers, Security groups), and issue:
```
terraform destroy
```