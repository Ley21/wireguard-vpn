# Lightsail VPN Instance

This Terraform code provisions a Lightsail VPN instance in AWS. The instance is based on Ubuntu 20.04 and uses the Nano 1.0 bundle.

## Prerequisites

- Terraform installed on your local machine.
- AWS account credentials configured locally.

## Usage

1. Clone this repository to your local machine.

2. Navigate to the cloned directory.

3. Open the `variables.tf` file and update the variable values if desired.

4. Generate WireGuard Server and Client Keys:
   - Generate the Server Private Key:
     ```
     wg genkey | tee server_private_key | wg pubkey > server_public_key
     ```
   - Generate the Client Private Key (Repeat this step for each client):
     ```
     wg genkey | tee clientX_private_key | wg pubkey > clientX_public_key
     ```
   - Replace the placeholders in the `user_data.sh` file with the actual key values. (Refer to the comments in the file for guidance)

5. Open the `user_data.sh` file and adjust the configuration as needed:
   - Modify the WireGuard interface settings, such as IP addresses, port, and allowed IPs.
   - Add any additional post-up or post-down commands.
   - Customize the peer configurations for each client, including their public keys and allowed IPs.

6. Initialize the Terraform working directory:
    ```
    terraform init
    ```

7. Review the execution plan:
    ```
    terraform plan --var-file=london.tfvars
    ```

8. Deploy the infrastructure:
    ```
    terraform apply --var-file=london.tfvars
    ```
9. Once the deployment is complete, the public IP address of the Lightsail instance will be displayed as an output.

10. To destroy the infrastructure when no longer needed, run:
    ```
    terraform destroy
    ```

## Variables

The following variables can be adjusted in the `variables.tf` file:

- `instance_name`: Name of the Lightsail instance. (Default: "sego-vpn")
- `availability_zone`: Availability zone for the instance. (Default: "eu-west-2a")

## State Storage

To configure remote state storage, it's recommended to create an S3 bucket in AWS. Modify the `backend.tf` file and replace the `<bucket-name>` placeholder with your desired bucket name.

```hcl
terraform {
  backend "s3" {
    bucket = "<bucket-name>"
    key    = "terraform.tfstate"
    region = "us-east-1"  # Update with your desired region
  }
}
```

## Costs

The Lightsail VPN instance is based on the Nano 1.0 bundle, which has an associated cost per hour. Please refer to the AWS Lightsail pricing documentation for the most up-to-date pricing information.

## License

This Terraform code is provided under the [MIT License](LICENSE).

Feel free to customize the README file further to include any additional information o