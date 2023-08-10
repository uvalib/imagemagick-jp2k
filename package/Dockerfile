#
# build image magic
#
FROM public.ecr.aws/docker/library/alpine:3.18

# standard for default build (see https://build.alpinelinux.org/buildlogs/build-edge-ppc64le/community/imagemagick/imagemagick-7.1.1.14-r0.log)
RUN apk update && apk upgrade && apk add --no-cache build-base chrpath fftw-dev fontconfig-dev freetype-dev ghostscript-dev lcms2-dev libheif-dev libjpeg-turbo-dev libpng-dev libraw-dev librsvg-dev libtool libwebp-dev libx11-dev libxext-dev libxml2-dev pango-dev perl-dev tiff-dev zlib-dev libjxl-dev freetype fontconfig ghostscript ghostscript-fonts lcms2 graphviz

# add extras we need for the build
RUN apk add --no-cache make git openjpeg openjpeg-dev

WORKDIR /build
ENV version_tag 7.1.1-15
RUN git clone -b ${version_tag} https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.x
RUN cd ImageMagick-7.x && ./configure --enable-shared=no && make install

#
# end of file
#
