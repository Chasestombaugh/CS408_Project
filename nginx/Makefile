.PHONY: build

-include ../.env

build:
	docker buildx build --platform linux/amd64,linux/arm64 -t $(DOCKER_USERNAME)/$(APP_NAME)-nginx:$(APP_VERSION) --push .
