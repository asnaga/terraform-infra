terraform {
  backend "remote" {
    organization = "asnaga"  # ✅ Correct value

    workspaces {
      name = "dev"
    }
  }
}
