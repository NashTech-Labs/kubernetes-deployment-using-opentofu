# Kubernetes Deployment with OpenTofu

## Overview

This repository contains opentofu scripts to deploy and manage the kubernetes application. Using OpenTofu, you can easily provision and manage the necessary resources in your cloud provider of choice.

## Getting Started

1. Clone this repository:

    ```bash
    git clone https://github.com/NashTech-Labs/kubernetes-deployment-using-opentofu.git
    ```

2. Set up your Terraform configuration file. Create a `terraform.tfvars` file and configure the required variables:

    ```hcl
    # terraform.tfvars

    host         = "your-host"
    client_key     = "your-client-key"
    ```

3. Initialize OpenTofu:

    ```bash
    tofu init
    ```

4. Review the deployment plan:

    ```bash
    tofu plan
    ```

5. Deploy the infrastructure:

    ```bash
    tofu apply
    ```

6. Confirm the deployment by typing `yes` when prompted.

## Cleanup

To destroy the created infrastructure, run:

```bash
tofu destroy
