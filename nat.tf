resource "aws_nat_gateway" "nat_gateway" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.public-subnet-2.id
}