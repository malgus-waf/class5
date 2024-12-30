terraform {
    backend "s3" {
        bucket = "mylocalterraform"
        key = "MyLinuxBox"
        region = "eu-west-1"      
}
}
