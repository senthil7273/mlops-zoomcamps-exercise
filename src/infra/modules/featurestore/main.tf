resource "google_vertex_ai_featurestore" "featurestore" {
  name     = "cancer"
  region = var.region
  force_destroy = true

  online_serving_config {
    fixed_node_count = 1
  }
}

resource "google_vertex_ai_featurestore_entitytype" "entity" {
  name     = var.entity_type
  featurestore = google_vertex_ai_featurestore.featurestore.id
}