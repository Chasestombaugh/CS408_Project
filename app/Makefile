.PHONY: clean build

-include ../.env

build:
	docker buildx build --platform linux/amd64,linux/arm64 -t $(DOCKER_USERNAME)/$(APP_NAME):$(APP_VERSION) --push .

clean:
	npm run clean