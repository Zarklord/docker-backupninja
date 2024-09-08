FROM debian:12.7-slim

RUN apt-get update
RUN apt-get install -y postgresql-common
RUN /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y

RUN	apt-get install -y --no-install-recommends \
	ca-certificates \
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
	rclone

RUN apt-get autoremove \
    && apt-get autoclean \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 ./usr/share/backupninja/* /usr/share/backupninja/
COPY --chmod=0755 ./entrypoint.sh /entrypoint.sh

ENV TZ="UTC"

ENTRYPOINT ["/entrypoint.sh"]
CMD []