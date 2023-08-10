# running on a local dockerd
if [ -z "$DOCKER_HOST" ]; then
   DOCKER_TOOL=docker
else
   DOCKER_TOOL=docker-legacy
fi

# set the definitions
INSTANCE=imagemagick-alpine
NAMESPACE=uvadave

OUTDIR=$(pwd)/distro/
mkdir -p ${OUTDIR} > /dev/null 2>&1

for target in /usr/local/bin/magick; do
   bn=$(basename $target)
   ${DOCKER_TOOL} run -v ${OUTDIR}:/mnt/mount --rm --entrypoint cp ${NAMESPACE}/${INSTANCE} ${target} /mnt/mount/${bn}
done

echo "Targets available in ${OUTDIR} on the docker host"
