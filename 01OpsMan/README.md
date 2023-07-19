# Creates MongoDB Ops Manager deployment on AWS EC2 machines
Spins up a 3 node OM deployment

[![image-2.png](https://i.postimg.cc/RVX84kgJ/image-2.png)](https://postimg.cc/JGHKQ2VR)

## Pre-requisites
Install 

    - terraform
    - ansible
 
## Step 1 - Edit the `terraform.tfvars` to configure the deployment as per requirements
1. Update the - `MUST CUSTOMIZE` - section to provide the key-pair you want to use
   A key pair in the region must be created and private key path must be provided 

   This is majorly to discourage creation of too many keys

2. Optionally, update the - `RECOMEMNDED TO CUSTOMIZE` - section to provide the region to deploy in
   By default, the deployment happens in "ap-southeast-2" region

3. Optionally, update the - `MAY CUSTOMIZE` - section

## Step 2 - Spin up the OM Infra

### 2.1 Login to get aws credentials

    aws sso login

### 2.2 Apply the terraform configuration 
The following creates the infra via Terraform and the runs an Ansible playbook to configure the OM setup.
The Terraform code automatically creates the Ansible Inventory file and runs the Ansible playbook, so only `tf apply` does the job for you. 

    alias tf=terraform
    tf init
    tf plan -out p0
    tf apply p0

The Ops Manager is installed on 2 nodes and is available at the Load Balancer URL provided in Terraform Output

https://<lb-external-url>:8443

## Step 3 (optional) - How to edit and re-run the Ansible playbook
Once Infra is created by Terraform, the terraform resource that runs the ansible playbook can be marked as tainted, and on next apply it will recreate that resource. Since it is a null resource, it won't impact any Infra in cloud.

    tf taint null_resource.execute-ansible-playbook
    tf apply -auto-approve

or run the playbook manually

    ansible-playbook -i ./ansible/ansible_inventory ./ansible/configure_om_playbook.yml
