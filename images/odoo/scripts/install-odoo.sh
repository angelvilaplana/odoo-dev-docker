#!/bin/bash

chown odoo:odoo -R /opt/odoo
chown odoo:odoo -R /etc/odoo
chown odoo:odoo -R /var/lib/odoo
chown odoo:odoo -R /var/log/odoo

if [ -z "$(ls -A /opt/odoo/odoo)" ]; then
    git clone https://www.github.com/odoo/odoo --depth 1 --branch ${ODOO_VERSION} /opt/odoo/odoo
    chown odoo:odoo -R /opt/odoo/odoo
fi

pip3 install -r /opt/odoo/odoo/requirements.txt

if [ ! -f "$ODOO_RC" ]; then
    cp /tmp/odoo.conf /etc/odoo/odoo.conf
fi
