# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name = "my-launch-template"
  description = "My Launch template"
  image_id = data.aws_ami.amzlinux2.id
  instance_type = var.private_instance_type

  vpc_security_group_ids = [ module.private_sg.security_group_id ]
  key_name = var.instance_keypair
  user_data = filebase64("${path.module}/script-app1.sh")
  ebs_optimized = false # free tier, set to false 
  #default_version = 1
  update_default_version = true 
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs { 
      volume_size = 10
      delete_on_termination = true
      volume_type = "gp2" # default  is gp2 
    }
  }
  monitoring {
    enabled = false # free tier, set to false
  }   
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "asg"
    }
  }  
  
}

