data "aws_ami" "server_ami" {
    most_recent = true
    owners = ["099720109477"]

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}

resource "aws_key_pair" "devops-mtc-auth" {
    key_name = "devops-mtc-key"
    public_key = file("~/.ssh/devops-mtckey.pub")
}

