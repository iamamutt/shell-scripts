#! /bin/bash

XSH_SRC=${BASH_SOURCE[0]:-${(%):-%x}}
script_dir=$(cd "$(dirname "${XSH_SRC}")" &>/dev/null && pwd)
script_file=$(basename "${XSH_SRC}")

echo "#>> Script $script_file started at $(date +'%Z %Y-%m-%d %H:%M:%S')"

ALYX_CONTAINER_NAME=${1:-alyx_alyx}
POPULATE_CONTAINER_NAME=${2:-alyx_ingest_1}

SQL_DUMP_EXPIRES=3

err_exit() {
	set -e
	echo "#! Error: $*" >&2
	return 1
}

ALYX_CID="$(docker ps -a -q --no-trunc -f name=$ALYX_CONTAINER_NAME)"
echo "# INFO: Alyx container name: $ALYX_CONTAINER_NAME"
echo "# INFO: Alyx container id: $ALYX_CID"
[ -z "$ALYX_CID" ] && err_exit "Cannot find alyx container."

INGEST_CID="$(docker ps -a -q --no-trunc -f name=$POPULATE_CONTAINER_NAME)"
echo "# INFO: Populate/Ingest container name: $POPULATE_CONTAINER_NAME"
echo "# INFO: Populate/Ingest container id: $INGEST_CID"
[ -z "$INGEST_CID" ] && err_exit "Cannot find ingestion container."

echo "#> Ingestion jobs terminate started at $(date +'%Z %Y-%m-%d %H:%M:%S')"
docker exec -t $INGEST_CID ingest terminate
sleep 15

echo "#> Database reload started at $(date +'%Z %Y-%m-%d %H:%M:%S')"
docker exec -t $ALYX_CID alyx reloaddb

echo "#> Cleanup started at $(date +'%Z %Y-%m-%d %H:%M:%S')"
docker exec -t $ALYX_CID alyx --dump_exp=$SQL_DUMP_EXPIRES cleandls
find "${script_dir}/logs/${script_file}_"*.log -type f -mtime +6 -delete 2>/dev/null

echo "#<< Script $script_file finished at $(date +'%Z %Y-%m-%d %H:%M:%S')"
