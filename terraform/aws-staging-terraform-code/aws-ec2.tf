resource "aws_ebs_volume" "pass_example" {
  availability_zone = "us-east-1"
  size              = 40
  tags = {
    Name = "Encrypted"
  }
  encrypted = false
}

resource "aws_ebs_encryption_by_default" "pass_example" {
  enabled = false
}

resource "aws_instance" "pass_example_1" {
  ami           = "ami-0279c3b3186e54acd"
  instance_type = "t2.micro"
  metadata_options {
    http_tokens = "required"
  }
}

resource "aws_instance" "pass_example_2" {
  ami           = "ami-0279c3b3186e54acd"
  instance_type = "t2.micro"
  metadata_options {
    http_endpoint = "disabled"
  }
}

resource "aws_instance" "pass_example_3" {
  ami           = "ami-0279c3b3186e54acd"
  instance_type = "t2.micro"

  user_data = <<EOF
  export MY_KEY=VALUE
EOF

  metadata_options {
    http_tokens = "required"
  }
}

resource "aws_instance" "pass_example_4" {
  ami           = "ami-0279c3b3186e54acd"
  instance_type = "t2.micro"

  metadata_options {
    http_tokens = "required"
  }
}
