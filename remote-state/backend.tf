terraform {
    backend "s3" {
        bucket = "terra-state-az1"
        key = "mykey"
        region = "us-west-2"
    }
}