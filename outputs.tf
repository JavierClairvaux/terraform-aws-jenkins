output "jenkins_public_ip" {
	  value = aws_instance.jk_instance.public_ip
	}

