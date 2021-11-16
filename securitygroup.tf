# sec group

resource "aws_security_group" "SG_HTTP" {
  name        = "allow_HTTP"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.tut_proj6.id

  ingress {
      description      = "HTTP from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.tut_proj6.cidr_block]
      
    }

    ingress {
      description      = "SSH from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.tut_proj6.cidr_block]
      
    }



  egress  {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }


  tags = {
    Name = "allow_HTTP"
  }
}