terraform {
  backend "remote" {
    organization = "myorgdemo"  # ✅ Correct value

    workspaces {
      name = "dev"
    }
  }
}
