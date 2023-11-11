resource "aws_key_pair" "MyLinuxBox" {
  key_name   = "MyLinuxBox"
  public_key = file("${path.module}/MyLinuxBox.pem.pub")  # Path to your public key
}
