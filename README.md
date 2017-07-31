# caddy-docker
CaddyServer in docker with configurable plugins

A minimal [CaddyServer][1] imagr bases on [Paul Galow's one][2] to act as web proxy with automatic TLS termination with autoconfiguration from Let's Encryt.
This image include dynamic plugins configuration.

## Build
```
docker build .
```

## Debugging

To enter and inspect the running Caddy container run:
```
docker exec -it caddy ash
```

