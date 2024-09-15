FROM debian:12.7-slim

# setup postgres apt repository
RUN apt-get update \
	&& apt-get install -y postgresql-common \
	&& /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y

# install docker apt repository
RUN apt-get install -y ca-certificates curl \
	&& install -m 0755 -d /etc/apt/keyrings \
	&& curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc \
	&& chmod a+r /etc/apt/keyrings/docker.asc \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
	&& apt-get update

RUN	apt-get install -y --no-install-recommends \
	xtail \
    tzdata \
    backupninja \
#	.dup support
	duplicity trickle \
#	.rdiff support
	rdiff-backup \
#	.sys support
	debconf-utils hwinfo mdadm \
#	.makecd support
	genisoimage wodim \
#	.rsync support
	rsync \
#	.svn support
	subversion \
#	.tar support
	bzip2 \
#	.borg support
	borgbackup \
#	.restic support
	restic \
#   .pgsql support
	postgresql-16 \
# 	.mysql support
	mariadb-server \
#	.rclone support
	rclone \
# 	run docker commands
	docker-ce-cli \
#   ssh into machines
	openssh-client

RUN apt-get autoremove \
    && apt-get autoclean \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 ./usr/share/backupninja/* /usr/share/backupninja/
COPY --chmod=0755 ./entrypoint.sh /entrypoint.sh

ENV TZ="UTC"

ENTRYPOINT ["/entrypoint.sh"]
CMD []