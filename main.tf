provider "aws" {
  region = var.aws_region
}

data "aws_ami" "jkCI"{
	most_recent = true
	
	filter {
		name = "name"
		values = ["amzn2-ami-*"]
	}

	filter {
     name   = "architecture"
     values = ["x86_64"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
  owners = ["self", "amazon"]

}

resource "aws_instance" "jk_instance" {
    ami           = data.aws_ami.jkCI.id
    instance_type = var.jk_instance_type 
		key_name			= var.jk_key
		user_data			= file("${path.module}/user-data.sh")
		security_groups = [aws_security_group.jk_sg.name, ]
    tags = {
        Name = "Jenkins CI"
    }
		
		depends_on =[aws_security_group.jk_sg]
}

