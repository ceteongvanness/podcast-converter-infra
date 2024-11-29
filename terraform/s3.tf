# s3.tf
resource "aws_s3_bucket" "audio_storage" {
  bucket = "podcast-converter-audio-${var.environment}"

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}

resource "aws_s3_bucket_public_access_block" "audio_storage" {
  bucket = aws_s3_bucket.audio_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}