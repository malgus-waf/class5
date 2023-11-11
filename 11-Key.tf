resource "aws_key_pair" "MyLinuxBox" {
  key_name   = "MyLinuxBox"
  public_key = file("~/.ssh/mykey.pub")  # Path to your public key
}
