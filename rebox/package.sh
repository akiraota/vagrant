#!/bin/bash

cd /
rm -rf /var/ww/html
rm -rf /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm -rf /lib/udev/rules.d/75-persistent-net-generator.rules
yum clean all
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
find /var/log -type f | while read f; do echo -ne ‘’ > $f; done
rm -rf /root/.bash_history
umount /vagrant
shutdown -h now

exit 0
