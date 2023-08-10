echo "*****************************************"
echo "running on $DOCKER_HOST"
echo "*****************************************"

if [ -z "$DOCKER_HOST" ]; then
   DOCKER_TOOL=docker
else
   DOCKER_TOOL=docker-legacy
fi

MOUNT="-v $(pwd)/distro:/mnt/mount"

${DOCKER_TOOL} run -it ${MOUNT} public.ecr.aws/docker/library/alpine:3.18 /bin/sh -l

# return status
exit $?

#
# make the runtime env
#
apk add fftw-double-libs fontconfig freetype ghostscript ghostscript-fonts lcms2 libbz2 libgcc libgomp libheif libjxl libltdl libraw libx11 libxext libxml2 openjpeg pango tiff zlib
