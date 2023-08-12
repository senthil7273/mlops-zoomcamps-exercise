variable project_id {
    type = string
    description = "id of the project configured in GCP"
    default = "nifty-vault-387021"
    nullable = false
}

variable region {
    type = string
    default = "europe-west-1"
}

variable zone {
    type = string
    default = "europe-west-1b"
}

