resource "google_storage_bucket" "bucket" {
  name     = "test-bucket-gom-project-1234"
  location = "europe-west2"
}

resource "google_storage_bucket" "gcs_bucket" {
  name     = "test-bucket-gom-project-5678"
  location = "europe-west2"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-gom-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-gom-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

