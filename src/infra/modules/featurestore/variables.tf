variable feature_store_name {
    type = string
    description = "name of the feature store"
    default = "cancer"
}

variable entity_type {
    type = string
    description = "name of the entity type"
    default = "geography"
}

variable region { 
    type = string
    description = "region of the feature store"
    default = "europe-west1"
}