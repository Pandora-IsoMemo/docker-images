# Docker Registry auf dem MPI Server

## Start

```sh
docker run -d -p 8081:5000 --restart=always --name registry2 -v /srv/objstore/docker-registry:/var/lib/registry registry:2.7
```

## Update für neue Version

```sh
docker pull registry:2.7
docker stop registry2
docker rm registry2
# Start des Containers genau wie oben!
```

## Maintenance

Wie alles im Zusammenhang mit Docker ist auch die Registry sehr speicherhungrig. Alte Images können entfernt werden mit:

```sh
docker exec registry2 registry garbage-collect /etc/docker/registry/config.yml --delete-untagged=true
df -h /srv/objstore/ ## zum überprüfen des genutzten und vorhandenen Speichers
```


# docker-images
