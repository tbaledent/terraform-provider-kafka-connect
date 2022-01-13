module github.com/tbaledent/terraform-provider-kafka-connect

go 1.16

require (
	bou.ke/monkey v1.0.2 // indirect
	github.com/hashicorp/terraform-plugin-sdk/v2 v2.10.1
	github.com/tbaledent/go-kafka-connect/v2 v2.1.4
)

replace git.apache.org/thrift.git => github.com/apache/thrift v0.0.0-20180902110319-2566ecd5d999
