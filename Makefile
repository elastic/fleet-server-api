.PHONY: install
install:
	go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest

.PHONY: generate
generate: install
	mkdir -p api
	oapi-codegen -generate types -o ./api/types.gen.go -package api openapi.yml
	oapi-codegen -generate client -o ./api/client.gen.go -package api openapi.yml
	oapi-codegen -generate gorilla -o ./api/server.gen.go -package api openapi.yml

.PHONY: opengenerate
opengenerate:
	openapi-generator generate -i openapi.yml -g go --type-mappings=string+application\/json=json.RawMessage
