terraform {
    backend "s3" {
        bucket = "terra-state-az1"
        key = "terraform-lessons/remote-state"
        region = "us-west-2"
    }
}