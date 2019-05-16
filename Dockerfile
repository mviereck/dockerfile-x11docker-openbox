# x11docker/openbox
#
FROM alpine
RUN apk add --no-cache openbox terminus-font

# Additional setup for x11docker option --wm=container
RUN mkdir -p /etc/x11docker && \
    sed /ShowMenu/d /etc/xdg/openbox/rc.xml >/etc/x11docker/openbox-nomenu.rc && \
    echo "x11docker:-:1999:1999:x11docker,,,:/tmp:/bin/sh" >> /etc/passwd && \
    echo "x11docker:-:1999:" >> /etc/group

CMD openbox
