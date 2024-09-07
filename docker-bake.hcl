group "ci_targets" {
  targets = ["backupninja"]
}
target "ci_platforms" {
	platforms = ["linux/amd64", "linux/arm64"]
}

target "docker-metadata-action" {}

group "default" {
  targets = ["backupninja"]
}

target "backupninja-local" {
  tags = ["backupninja:local"]
}

target "backupninja" {
	inherits = ["backupninja-local", "ci_platforms", "docker-metadata-action"]
	context = "backupninja"
	dockerfile = "Dockerfile"
}