# Setup Shopware

## Build container

`$ . scripts/start.sh`

## First installation

Delete `install.lock` in `shopware/recovery/install/data/`

Browse `localhost:8080/recovery/install/index.php`

##### Shopware database

- `server: mysql`
- `user: app`  
- `password: app`  
- `database: shopware`  
 
### Import dump

`$ . scripts/restore.sh`

### Mac performance issue

File access in mounted volumes are slow. For more information go to `https://docs.docker.com/docker-for-mac/osxfs-caching/`.
