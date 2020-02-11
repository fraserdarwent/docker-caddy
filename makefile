caddy-version=2.0.0-beta.13
golang-version=1.13.6
name=caddy
build:
			docker build . -t fraserdarwent/$(name):$(caddy-version) --build-arg CADDY_VERSION=$(caddy-version) --build-arg GOLANG_VERSION=$(golang-version)
release:
			make build
			docker tag fraserdarwent/$(name):$(caddy-version) fraserdarwent/$(name):latest
			docker push fraserdarwent/$(name):$(caddy-version)
			docker push fraserdarwent/$(name):latest