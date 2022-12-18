# AWS Terraform Example



## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer. 
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

Please note that this code was written for Terraform 1.x.

## Quick start

**Please note that this example will deploy real resources into your AWS account. I have made every effort to ensure all the resources qualify for the [AWS Free Tier](https://aws.amazon.com/free/), but I am not responsible for any charges you may incur.** 

Configure your [AWS access 
keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as 
environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Review `variables.tf`:

```hcl
variable "xxx" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
}
```

Create `terraform.tfvars` to set variables:



Deploy the code:

```
terraform init
terraform apply
```

Clean up when you're done:

```
terraform destroy
```