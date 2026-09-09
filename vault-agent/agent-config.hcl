vault {
  address = "http://host.docker.internal:8200"
}

auto_auth {
  method "approle" {
    config = {
      role_id_file_path   = "/vault/agent/role-id"
      secret_id_file_path = "/vault/agent/secret-id"
    }
  }

  sink "file" {
    config = {
      path = "/vault/agent/.vault-token"
    }
  }
}

template {
  source      = "/vault/agent/template.ctmpl"
  destination = "/vault/agent/secrets.env"
}

exit_after_auth = false
