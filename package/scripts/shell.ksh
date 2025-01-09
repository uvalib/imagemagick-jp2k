echo "*****************************************"
echo "running on $DOCKER_HOST"
echo "*****************************************"

if [ -z "$DOCKER_HOST" ]; then
   DOCKER_TOOL=docker
   MNT=$PWD/tmp
else
   DOCKER_TOOL=docker-legacy
   MNT=/home/dpg3k/tmp
fi

# set the definitions
INSTANCE=imagemagick-alpine
NAMESPACE=uvadave

MOUNT="-v ${MNT}:/mnt/tmp"

$DOCKER_TOOL run -it ${MOUNT} $NAMESPACE/$INSTANCE /bin/sh -l

# return status
exit $?
