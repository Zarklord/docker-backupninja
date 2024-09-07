FROM debian:12.7-slim

RUN apt-get update && \
	apt-get install --no-install-recommends \
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
	postgresql \
# 	.mysql support
	mariadb-server

RUN apt-get autoremove \
    && apt-get autoclean \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV TZ="UTC"

ENTRYPOINT ["/usr/sbin/backupninja"]
CMD ["--debug --now"]	