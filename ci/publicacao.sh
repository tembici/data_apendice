#!/bin/bash

# verificando se existe schedule no projeto
 SCHEDULE=`curl --header "PRIVATE-TOKEN: ${PRIVATE_TOKEN}" "https://gitlab.com/api/v4/projects/${CI_PROJECT_ID}/pipeline_schedules"`;
 
# criando schedule

if [ "$SCHEDULE" == "[]" ]; then
 
 curl --request POST --header "PRIVATE-TOKEN: $PRIVATE_TOKEN" --form description="Merge Branch Master" --form ref="master" --form cron="0 7 * * *" --form cron_timezone="UTC" --form active="true" "https://gitlab.com/api/v4/projects/${CI_PROJECT_ID}/pipeline_schedules";
 
 else
 
 echo "Já existe Job de atualização"
 
 fi

exit