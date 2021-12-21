# `terraform-plugin-kafka-connect`

A [Terraform][1] plugin for managing [Apache Kafka Connect][2].
Forked from [Mongey/terraform-provider-kafka-connect][3] with changes
made to support MasterySystems requirements for kafka-connect in data replication.

## Example

Configure the provider directly, or set the ENV variable `KAFKA_CONNECT_URL`
```hcl
provider "kafka-connect" {
  url = "http://localhost:8083"
  basic_auth_username = "user" # Optional
  basic_auth_password = "password" # Optional
}

resource "kafka-connect_connector" "sqlite-sink" {
  name = "sqlite-sink"

  config = {
    "name"            = "sqlite-sink"
    "connector.class" = "io.confluent.connect.jdbc.JdbcSinkConnector"
    "tasks.max"       = 1
    "topics"          = "orders"
    "connection.url"  = "jdbc:sqlite:test.db"
    "auto.create"     = "true"
    "connection.user" = "admin"
  }

  config_sensitive = {
    "connection.password" = "this-should-never-appear-unmasked"
  }
}
```

## Provider Properties

| Property              | Type   | Example                 | Alternative environment variable name |
|-----------------------|--------|-------------------------|---------------------------------------|
| `url`                 | URL    | "http://localhost:8083" | `KAFKA_CONNECT_URL`                   |
| `basic_auth_username` | String | "user"                  | `KAFKA_CONNECT_BASIC_AUTH_USERNAME`   |
| `basic_auth_password` | String | "password"              | `KAFKA_CONNECT_BASIC_AUTH_PASSWORD`   |

## Resource Properties

| Property              | Type      | Description                                                          |
|-----------------------|-----------|----------------------------------------------------------------------|
| `name`                | String    | Connector name                                                       |
| `config`              | HCL Block | Connector configuration                                              |
| `config_sensitive`    | HCL Block | Sensitive connector configuration. Will be masked in output.         |


[1]: https://www.terraform.io
[2]: https://kafka.apache.org/documentation/#connect
[3]: https://github.com/Mongey/terraform-provider-kafka-connect
[third-party-plugins]: https://www.terraform.io/docs/configuration/providers.html#third-party-plugins
[install-go]: https://golang.org/doc/install#install
