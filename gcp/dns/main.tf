provider "google" {
  project = "kurumba-islands"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}

resource "google_dns_managed_zone" "kurumbano" {
  name        = "kurumbano-zone"
  dns_name    = "kurumba.no."
  description = "Kurumba DNS Zone"
}


resource "google_dns_record_set" "test_record" {
  name         = "_test_dns.${google_dns_managed_zone.kurumbano.dns_name}"
  managed_zone = google_dns_managed_zone.kurumbano.name
  type         = "A"
  ttl          = 300

  rrdatas = ["192.169.1.1"]
}

resource "google_dns_record_set" "wildcard_record" {
  name         = "*.${google_dns_managed_zone.kurumbano.dns_name}"
  managed_zone = google_dns_managed_zone.kurumbano.name
  type         = "A"
  ttl          = 300

  rrdatas = ["85.165.128.218"]
}


