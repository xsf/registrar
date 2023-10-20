# XSF Registrar

[xmpp.org/registrar](https://xmpp.org/registrar/)

## Building

### Make

Validate using:

```shell
make validate
```

Build using:

```shell
make build
```

### Docker

```shell
sudo docker build -t xmppxsf/registrar .
```

```shell
sudo docker run -p 80:80 -t -i xmppxsf/registrar
```

View at [localhost/registrar/](http://localhost/registrar/)
