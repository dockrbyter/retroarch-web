
FROM debian:bullseye

LABEL maintainer "David 'Inglebard' RICQ <davidricq87@orange.fr>"

RUN apt-get update && apt-get install -y \
	ca-certificates \
	unzip \
	sed \
	p7zip-full \
	coffeescript \
	xz-utils \
	nginx \
	wget \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV RETROARCH_VERSION 1.12.0
ENV ROOT_WWW_PATH /var/www/html


RUN cd ${ROOT_WWW_PATH} \
	&& wget https://buildbot.libretro.com/stable/${RETROARCH_VERSION}/emscripten/RetroArch.7z \
	&& 7z x -y RetroArch.7z \
	&& mv retroarch/* . \
	&& rmdir retroarch \
	&& sed -i '/<script src="analytics.js"><\/script>/d' ./index.html \
	#&& cp canvas.png media/canvas.png \
	&& chmod +x indexer \
	#&& mkdir -p ${ROOT_WWW_PATH}/assets/frontend \
	&& mkdir -p ${ROOT_WWW_PATH}/assets/cores \
	#&& cd ${ROOT_WWW_PATH}/assets/frontend \
	#&& wget https://buildbot.libretro.com/assets/frontend/bundle.zip \
	#&& unzip bundle.zip -d bundle \
	&& cd ${ROOT_WWW_PATH}/assets/frontend/bundle \
	&& ../../../indexer > .index-xhr \
	&& cd ${ROOT_WWW_PATH}/assets/cores \
	&& ../../indexer > .index-xhr \
	&& rm -rf ${ROOT_WWW_PATH}/RetroArch.7z \
	&& rm -rf ${ROOT_WWW_PATH}/assets/frontend/bundle.zip

WORKDIR ${ROOT_WWW_PATH}

EXPOSE 80

COPY entrypoint.sh /

CMD [ "sh", "/entrypoint.sh"]
