

provider "aws"{
  region = "ap-southeast-2"
}

resource "aws_instance" "instance" {
 ami = "ami-0789a5fb42dcccc10"
 instance_type = "t2.micro"
 key_name = "tomkey"
  tags = {
    Name = "tomubuntu"
  }
 provisioner "remote-exec"{
  inline=["sudo apt-get -y install python"]
  connection{
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/ubuntu/tomkey")}"
    }
 }
}
