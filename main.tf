resource "aws_lightsail_instance" "gitlab_test" {
  name              = "custom_gitlab"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"

  # key_pair_name = "livekey"

  tags = {
    env = "dev"
  }
}