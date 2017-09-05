FROM busybox

MAINTAINER Erik Kaareng-sunde <esu@enonic.com>

RUN mkdir -p /enonic-xp/home/repo
RUN adduser -h /enonic-xp/ -H -u 1337 -D -s /bin/sh enonic-xp
RUN chown -R enonic-xp /enonic-xp/
VOLUME /enonic-xp/home/repo
ADD logo.txt /logo.txt
CMD cat /logo.txt