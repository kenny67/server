#!/bin/bash

source .export

envsubst '${PROJECT_NAME}' < appspec.yml.tpl > appspec.yml

envsubst '${PROJECT_NAME}' < scripts/after_install.sh.tpl > scripts/after_install.sh

envsubst '${PROJECT_NAME}' < scripts/before_install.sh.tpl > scripts/before_install.sh

envsubst '${PROJECT_NAME}' < scripts/start_server.sh.tpl > scripts/start_server.sh

envsubst '${PROJECT_NAME}' < scripts/stop_server.sh.tpl > scripts/stop_server.sh