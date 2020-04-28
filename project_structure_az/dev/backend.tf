terraform {
    backend "s3" {
        bucket = "azbucket-c29df1"
        key = "terraform-lessons/remote-state"
        region = "us-west-2"
    }
}