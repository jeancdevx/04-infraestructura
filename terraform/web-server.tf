resource "docker_container" "app" {
  name="http-echo"
  image="hashicorp/http-echo:1.0"

  command = [
    "-listen", ":5678",
    "-text", "Hello, World!"
  ]

  networks_advanced {
    name = docker_network.labnet.name
  }
}

resource "docker_network" "labnet" {
  name = "labnet"
}