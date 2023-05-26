# Main configuration
provider "aws" {
  region = var.region
}

resource "aws_lightsail_instance" "sego-vpn" {
  name              = var.instance_name
  availability_zone = var.availability_zone
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = "nano_1_0"

  user_data = file("${path.module}/user_data.sh")  # Read user_data from the external script file
}


# Lightsail Instance Access
resource "aws_lightsail_instance_public_ports" "sego-vpn" {
  instance_name = aws_lightsail_instance.sego-vpn.name

  port_info {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  port_info {
    protocol = "udp"
    from_port = 51820
    to_port   = 51820
  }
}


output "public_ip_address" {
  value = aws_lightsail_instance.sego-vpn.public_ip_address
}
