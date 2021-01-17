resource "aws_dynamodb_table" "test" {
  name = "test"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "CommitHash"
  attribute {
    name = "CommitHash"
    type = "S"
  }
}