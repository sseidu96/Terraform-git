resource "aws_lightsail_instance" "gitlab_test" {
  name              = "custom_gitlab"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"

  key_pair_name = "livekey"

  user_data = <<-EOF
    #!/bin/bash
    yum update -y

    # Install packages
    yum install -y git wget curl unzip

    # Install Docker
    amazon-linux-extras install docker -y
    systemctl enable docker
    systemctl start docker

    # Add ec2-user to docker group
    usermod -aG docker ec2-user

    echo "User data execution completed" > /tmp/userdata.log
  EOF

  tags = {
    env  = "dev"
    Name = "custom_gitlab"
  }
}