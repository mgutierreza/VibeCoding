resource "aws_key_pair" "dev_key" {
  key_name   = "dev-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}
