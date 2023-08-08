# running on a local dockerd
if [ -z "$DOCKER_HOST" ]; then
   DOCKER_TOOL=docker
else
   DOCKER_TOOL=docker-legacy
fi

# set the definitions
INSTANCE=imagemagick-jp2k
NAMESPACE=uvadave

OUTDIR=$(pwd)/distro/ImageMagick-7.x
mkdir -p ${OUTDIR} > /dev/null 2>&1

for target in /usr/local/lib/libMagickCore-7.Q16HDRI.so.10 \
              /usr/local/lib/libMagickWand-7.Q16HDRI.so.10 \
              /usr/local/bin/convert; do
   bn=$(basename $target)
   ${DOCKER_TOOL} run -v ${OUTDIR}:/mnt/mount --rm --entrypoint cp ${NAMESPACE}/${INSTANCE} ${target} /mnt/mount/${bn}
done

echo "Targets available in ${OUTDIR} on the docker host"
