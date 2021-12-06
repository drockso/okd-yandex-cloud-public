#!/bin/sh
curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | sudo bash -s -- -i /opt/yandex-cloud -n
/opt/yandex-cloud/bin/yc config profile delete okd-installer
/opt/yandex-cloud/bin/yc config profile create okd-installer
/opt/yandex-cloud/bin/yc config profile activate okd-installer
/opt/yandex-cloud/bin/yc config set token AQAAAABapz7aAATuwQz4HL1Zm0a6s0aoxdxeMIw
/opt/yandex-cloud/bin/yc config set cloud-id b1gr730us03dmecpdled
/opt/yandex-cloud/bin/yc config set folder-id b1gos8r65b7o4vvslhdl
/opt/yandex-cloud/bin/yc config list