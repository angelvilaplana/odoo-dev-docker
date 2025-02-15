#!/bin/bash

set -e

source scripts/install-odoo.sh
su odoo -s scripts/odoo.sh $1
