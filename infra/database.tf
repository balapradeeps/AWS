/*
resource "aws_security_group" "allow_db_connections" {
  name   = "sec_group_allow_db_connections"
  vpc_id = aws_vpc.main.id
  revoke_rules_on_delete = true

  ingress = [
    {
      description      = "allow db connections"
      from_port        = 0 # any port
      to_port          = "${yamldecode(file("../env.yml"))["DB_PORT"]}"
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.main.cidr_block]
      ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
      self             = true
      security_groups  = ["wtregergrqwgwrgwq"]
      prefix_list_ids  = []
    }
  ]

  egress = [
    {
      description      = "allow all egress connections"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      self             = true
      security_groups  = ["wtregergrqwgwrgwq"]
      prefix_list_ids  = []
    }
  ]
}
*/

resource "aws_docdb_cluster" "database_cluster" {
  master_username        = yamldecode(file("../env.yml"))["DB_USER_NAME"]
  master_password        = yamldecode(file("../env.yml"))["DB_USER_PASSWORD"]
  final_snapshot_identifier = false
  backup_retention_period = 0
  skip_final_snapshot    = true
  apply_immediately = true
  #vpc_security_group_ids = ["securitygroupsids"]
}

resource "aws_docdb_cluster_instance" "database" {
  cluster_identifier = resource.aws_docdb_cluster.database_cluster.id
  instance_class     = "db.t3.medium"
}
