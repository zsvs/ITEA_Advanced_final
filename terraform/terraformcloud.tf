terraform {
  cloud {
    organization = "svs-home"

    workspaces {
      name = "final_project"
    }
  }
}
