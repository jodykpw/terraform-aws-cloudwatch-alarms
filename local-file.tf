resource "local_file" "config" {
  # Output vars to config
  filename = "config.json"
  content  = "{}"
  
  ## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  ## Destory Time Provisioners - Will be executed during "terraform destroy" command (when = destroy)
  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    # on_failure = continue
  }  
}