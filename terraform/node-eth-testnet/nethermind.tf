resource "aws_security_group" "sg_nethermind_nimbus" {
  name   = "sg_nethermind_nimbus"
  vpc_id = aws_vpc.vpc.id


  dynamic "ingress" {
    for_each = ["22", "30303", "9000"]
    content {
      description = "Allow TCP ports (ssh, eth1 p2p, eth2 p2p)"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "ingress" {
    for_each = ["30303", "9000"]
    content {
      description = "Allow UDP ports (eth1 p2p, eth2 p2p)"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    description = "Allow TCP ports (rpc) within VPC"
    from_port   = 8545
    to_port     = 8545
    protocol    = "tcp"
    cidr_blocks = [var.cidr_subnet_a]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }
}

resource "aws_instance" "node-eth-holesky-nethermind-01" {
  ami                     = var.image_debian12
  instance_type           = "m5a.xlarge"
  subnet_id               = aws_subnet.subnet_public_a.id
  vpc_security_group_ids  = [aws_security_group.sg_nethermind_nimbus.id]
  key_name                = aws_key_pair.deployment.key_name
  depends_on              = [aws_internet_gateway.igw]
  disable_api_termination = "true"
  provider                = aws.primary

  private_ip = var.servers["node-eth-holesky-nethermind-01"]

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "200"
    delete_on_termination = "false"

    tags = {
      Name        = "node-eth-holesky-nethermind-01"
      Type        = "ebs"
      Environment = var.Environment
      Chain       = "ethereum"
      Network     = var.Network
      testnet     = var.testnet
      mainnet     = var.mainnet
      Terraform   = var.Terraform
    }
  }

  tags = {
    Name        = "node-eth-holesky-nethermind-01"
    Type        = var.Type
    Environment = var.Environment
    Chain       = "ethereum"
    Network     = var.Network
    testnet     = var.testnet
    mainnet     = var.mainnet
    Terraform   = var.Terraform
  }
}

###   resource "aws_eip" "node-eth-holesky-nethermind-01" {
###     vpc                       = true
###     provider                  = aws.primary
###   
###     instance                  = aws_instance.node-eth-holesky-nethermind-01.id
###     associate_with_private_ip = var.servers[ "node-eth-holesky-nethermind-01" ]
###     depends_on                = [ aws_internet_gateway.igw ]
###   
###     tags = {
###       Name                    = "node-eth-holesky-nethermind-01"
###     }
###   }


resource "aws_instance" "node-eth-holesky-nethermind-02" {
  ami                     = var.image_debian12
  instance_type           = "m5a.xlarge"
  subnet_id               = aws_subnet.subnet_public_a.id
  vpc_security_group_ids  = [aws_security_group.sg_nethermind_nimbus.id]
  key_name                = aws_key_pair.deployment.key_name
  depends_on              = [aws_internet_gateway.igw]
  disable_api_termination = "true"
  provider                = aws.primary

  private_ip = var.servers["node-eth-holesky-nethermind-02"]

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "200"
    delete_on_termination = "false"

    tags = {
      Name        = "node-eth-holesky-nethermind-02"
      Type        = "ebs"
      Environment = var.Environment
      Chain       = "ethereum"
      Network     = var.Network
      testnet     = var.testnet
      mainnet     = var.mainnet
      Terraform   = var.Terraform
    }
  }

  tags = {
    Name        = "node-eth-holesky-nethermind-02"
    Type        = var.Type
    Environment = var.Environment
    Chain       = "ethereum"
    Network     = var.Network
    testnet     = var.testnet
    mainnet     = var.mainnet
    Terraform   = var.Terraform
  }
}

###   resource "aws_eip" "node-eth-holesky-nethermind-02" {
###     vpc                       = true
###     provider                  = aws.primary
###   
###     instance                  = aws_instance.node-eth-holesky-nethermind-02.id
###     associate_with_private_ip = var.servers[ "node-eth-holesky-nethermind-02" ]
###     depends_on                = [ aws_internet_gateway.igw ]
###   
###     tags = {
###       Name                    = "node-eth-holesky-nethermind-02"
###     }
###   }
