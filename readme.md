## Terraform environments with locals

Sample usage of terraform locals and terraform workspace to isolate environment.

#### Create workspace


```
$ terraform workspace new dev
Created and switched to workspace "dev"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.

$ terraform workspace list

  default
* dev
```
(*) means active workspace.

-------

#### Usage
```
$ terraform workspace select default
$ terraform plan
```
result:
> (+) instance_type = "t2.micro"
>
> Plan: 1 to add, 0 to change, 0 to destroy.


```
$ terraform workspace select dev
$ terraform plan
```
result:
> (+) instance_type = "t2.small"
>
> Plan: 3 to add, 0 to change, 0 to destroy.
