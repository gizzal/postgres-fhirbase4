#!/bin/bash
docker build -t registry.portavita.net/portavita/dbfhirbase-r4 .
#docker run --network=docker_default --name="dbfhirbase-r4" -it registry.portavita.net/portavita/dbfhirbase-r4