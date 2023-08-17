variable project_id {
    type = string
    description = "id of the project configured in GCP"
    default = ""
    nullable = false
}

variable region {
    type = string
    default = "europe-west1"
}

variable zone {
    type = string
    default = "europe-west1-b"
}

