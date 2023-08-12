variable project_id {
    type = string
    description = "id of the project configured in GCP"
    value= "nifty-vault-387021"
    nullable = false
}

variable region {
    value = "europe-west-1"
}

variable zone {
    value = "europe-west-1b"
}

output "region" {
    value = var.region
}