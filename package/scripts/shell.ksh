echo "*****************************************"
echo "running on $DOCKER_HOST"
echo "*****************************************"

if [ -z "$DOCKER_HOST" ]; then
   DOCKER_TOOL=docker
else
   DOCKER_TOOL=docker-legacy
fi

# set the definitions
INSTANCE=imagemagick-alpine
NAMESPACE=uvadave

$DOCKER_TOOL run -it $NAMESPACE/$INSTANCE /bin/sh -l

# return status
exit $?
