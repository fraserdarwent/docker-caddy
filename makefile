caddy-version = 2.0.0-beta.13
golang-version= 1.13.6
build:
			docker build . -t fraserdarwent/docker-caddy:$(caddy-version) --build-arg CADDY_VERSION=$(caddy-version) --build-arg GOLANG_VERSION=$(golang-version)
release:
			make build
			docker tag fraserdarwent/docker-caddy:$(caddy-version) fraserdarwent/docker-caddy:latest
			docker push fraserdarwent/docker-caddy:$(caddy-version)
			docker push fraserdarwent/docker-caddy:latest