FROM debian:bullseye

ENV USER steam
ENV HOMEDIR "/home/${USER}"
ENV STEAMCMDDIR "/usr/games/steamcmd"
ENV STEAMAPPID 896660
ENV SETAMAPP valheim
ENV STEAMAPPDIR "${HOMEDIR}/${SETAMAPP}-dedicated"


RUN set -x \
	&& printf "deb http://deb.debian.org/debian stable main contrib non-free\n" >> /etc/apt/sources.list \
	&& printf "deb-src http://deb.debian.org/debian stable main contrib non-free\n" >> /etc/apt/sources.list \
	&& printf "deb http://deb.debian.org/debian stable-updates main contrib non-free\n" >> /etc/apt/sources.list \
	&& printf "deb-src http://deb.debian.org/debian stable-updates main contrib non-free\n" >> /etc/apt/sources.list \
	&& dpkg --add-architecture i386 \
  && apt-get update \
	&& echo steam steam/question select "I AGREE" | debconf-set-selections \
	&& echo steam steam/license note '' | debconf-set-selections \ 
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests \
		lib32stdc++6=10.2.1-6 \
		lib32gcc-s1=10.2.1-6 \
		ca-certificates=20210119 \
		# nano=5.4-2+deb11u2 \
		# curl=7.74.0-1.3+deb11u7 \
		# locales=2.31-13+deb11u5 \
		steamcmd \
  && useradd -ms /bin/bash ${USER}

# USER ${USER}
# WORKDIR /home/${USER}
# RUN set -x \
#   && touch iamherenow \
# 	&& "$STEAMCMDDIR" +force_install_dir "$STEAMAPPDIR" +login anonymous +app_update "$STEAMAPPID" +quit
# 
# EXPOSE 2456/tcp \
# 	2456/udp \
# 	2457/udp

