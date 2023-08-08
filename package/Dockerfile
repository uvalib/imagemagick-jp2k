#
# build image magic
#
FROM public.ecr.aws/docker/library/alpine:3.18
RUN apk update && apk upgrade && apk add --no-cache make git build-base openjpeg openjpeg-dev

WORKDIR /build
ENV version_tag 7.1.1-15
RUN git clone -b ${version_tag} https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.x
RUN cd ImageMagick-7.x && ./configure && make install

#
# end of file
#
