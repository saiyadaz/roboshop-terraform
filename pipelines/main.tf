variable "components"{
  default = ["frontend", "catalogue", "cart" , "user", "shipping", "payment", "dispatch", "mongodb", "mysql", "rabbitmq", "redis"]

}

resource "aws_instance" "instance" {
  count         = length(vars.components)
  ami           = "09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0719fd3602de52422"]
  tags = {
    Name= var.components[count.index]
  }
}