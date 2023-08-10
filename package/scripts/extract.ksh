#
#
#

#set -x

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
BINDIR=bin
ETCDIR=etc/ImageMagick-7

mkdir -p ${OUTDIR}/${BINDIR} > /dev/null 2>&1
mkdir -p ${OUTDIR}/${ETCDIR} > /dev/null 2>&1

# binary
for target in /usr/local/bin/magick; do
   echo "Extracting ${target}..."
   bn=$(basename $target)
   ${DOCKER_TOOL} run -v ${OUTDIR}:/mnt/mount --rm --entrypoint cp ${NAMESPACE}/${INSTANCE} ${target} /mnt/mount/${BINDIR}/${bn}
done

# config
for target in /usr/local/etc/ImageMagick-7/colors.xml \
              /usr/local/etc/ImageMagick-7/delegates.xml \
              /usr/local/etc/ImageMagick-7/log.xml \
              /usr/local/etc/ImageMagick-7/mime.xml \
              /usr/local/etc/ImageMagick-7/policy.xml \
              /usr/local/etc/ImageMagick-7/quantization-table.xml \
              /usr/local/etc/ImageMagick-7/thresholds.xml \
              /usr/local/etc/ImageMagick-7/type-apple.xml \
              /usr/local/etc/ImageMagick-7/type-dejavu.xml \
              /usr/local/etc/ImageMagick-7/type-ghostscript.xml \
              /usr/local/etc/ImageMagick-7/type-urw-base35.xml \
              /usr/local/etc/ImageMagick-7/type-windows.xml \
              /usr/local/etc/ImageMagick-7/type.xml; do
   echo "Extracting ${target}..."
   bn=$(basename $target)
   ${DOCKER_TOOL} run -v ${OUTDIR}:/mnt/mount --rm --entrypoint cp ${NAMESPACE}/${INSTANCE} ${target} /mnt/mount/${ETCDIR}/${bn}
done

echo "Targets available in ${OUTDIR} on the docker host"

#
# end of file
#
