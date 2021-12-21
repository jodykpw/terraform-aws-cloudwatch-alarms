# Create a Null Resource and Provisioners
resource "null_resource" "name" {
  depends_on = [module.ec2_public]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type          = "ssh"
    host          = module.ec2_public.public_ip[0]  
    user          = "ec2-user"
    password      = ""
    private_key   = file("private-key/terraform-key.pem")

    # Resolve error connecting to SSH_AUTH_SOCK error with terraform apply.
    # https://titanwolf.org/Network/Articles/Article?AID=d3cdab62-ea06-4068-babc-94e84a55fe89
    agent         = false # ← Do not go through agent.
  }  

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }
## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
## Local Exec Provisioner:  local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
## Creation Time Provisioners - By default they are created during resource creations (terraform apply)
  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
  }  
}