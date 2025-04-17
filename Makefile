SWAGGER_UI_VERSION:=v4.15.5

python:
	cd proto && \
	python3 -m grpc_tools.protoc -I. --python_out=../../payd-admin/v1/messages --pyi_out=../../payd-admin/v1/messages --grpc_python_out=../../payd-admin/v1/messages *.proto

gen_buf_lock:
	buf mod update

generate:
	buf generate

generate/swagger-ui:
	SWAGGER_UI_VERSION=$(SWAGGER_UI_VERSION) ./scripts/generate-swagger-ui.sh