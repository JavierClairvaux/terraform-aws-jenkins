variable "aws_region"{
	default = "us-east-2"
}

variable "jk_instance_type"{
	description = "Instance type on which DroneCI will run"
}

variable "jk_key"{
	description = "SSH key to access instance"
}


