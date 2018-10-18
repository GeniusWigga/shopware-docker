# Setup Shopware

## Build container

`$ . scripts/start.sh`

## First installation

delete `install.lock` in `shopware/recovery/install/data/`

browse `localhost:8080/recovery/install/index.php`

##### Shopware database

- `server: mysql`
- `user: app`  
- `password: app`  
- `database: shopware`  
 
### Import dump

`$ . scripts/restore.sh`
