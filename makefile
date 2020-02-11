caddy-version=2.0.0-beta.13
golang-version=1.13.6
image-name=caddy
build:
			docker build . -t fraserdarwent/$(image-name):$(caddy-version) --build-arg CADDY_VERSION=$(caddy-version) --build-arg GOLANG_VERSION=$(golang-version)
release:
			make build
			docker tag fraserdarwent/$(image-name):$(caddy-version) fraserdarwent/$(image-name):latest
			docker push fraserdarwent/$(image-name):$(caddy-version)
			docker push fraserdarwent/$(image-name):latest