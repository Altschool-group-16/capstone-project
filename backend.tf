# Variables
variable "ID" {
  description = "Unique identifier."
  type        = string
}

# Resources
resource "aws_security_group" "InstanceSecurityGroup" {
  name        = "UdaPeople-${var.ID}"
  description = "Allow port 22, port 9100 and port 3030."

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3030
    to_port     = 3030
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "EC2Instance" {
  instance_type = "t2.micro"
  security_group_names = [aws_security_group.InstanceSecurityGroup.name]
  key_name      = "udacity" # Replace with your own key pair name if necessary
  ami           = "ami-068663a3c619dd892" # Replace with the appropriate AMI ID for your region and requirements

  tags = {
    Name = "backend-${var.ID}"
  }
}
