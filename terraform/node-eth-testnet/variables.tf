variable "name" { default = "node-eth-testnet" }
variable "region" { default = "eu-north-1" }
variable "cidr_vpc" { default = "192.168.227.0/24" }
variable "cidr_subnet_a" { default = "192.168.227.0/24" }
variable "public_key_path" { default = "~/.ssh/id_rsa.pub" }
variable "image_debian11" { default = "ami-0211d4d77072856f6" }
variable "image_debian12" { default = "ami-0506d6d51f1916a96" }
variable "image_ubuntu20" { default = "ami-0767f67667eb97b06" }
variable "Type" { default = "ec2" }
variable "Environment" { default = "test" }
variable "Network" { default = "holesky" }
variable "testnet" { default = "true" }
variable "mainnet" { default = "false" }
variable "Terraform" { default = "true" }
variable "servers" {
  type = map(any)
  default = {
    node-eth-holesky-nethermind-01 = "192.168.227.186"
    node-eth-holesky-nethermind-02 = "192.168.227.192"
  }
}
