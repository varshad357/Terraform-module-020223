module "myakv0202" {
  #source = "./module/akvltim"   # Terraform Local Module - Local Path
  source = "github.com/varshad357/Terraform-module-020223"                     # Github Clone over HTTPS
  resourcegroupname = var.resourcegroupname
  resourcegrouplocation = var.resourcegrouplocation
  keyvalutname = var.keyvalutname
}
