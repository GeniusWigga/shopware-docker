#!/usr/bin/env bash

cat backup.sql | docker exec -i mysql-container /usr/bin/mysql -uapp -papp shopware
