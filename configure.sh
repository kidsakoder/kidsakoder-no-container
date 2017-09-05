#!/bin/bash


echo "###############################################################################"
echo "### Enonic XP configurator"
INSTANCE_HOSTNAME=$1

if [[ "x$1" = "x" ]]
	then
	echo "hostname argument is missing, aborting."
	exit 1
fi

APACHE2_VHOST_TEMPLATE=apache2/sites/vhost.example.conf.template
EXP_VHOST_FILE=exp/config/com.enonic.xp.web.vhost.cfg


echo "###############################################################################"
echo "### Creating apache2 config for $INSTANCE_HOSTNAME"

cp $APACHE2_VHOST_TEMPLATE apache2/sites/$INSTANCE_HOSTNAME.conf
sed -i".tmp" -e "s/SITE_HOSTNAME_ESCAPED/$(echo $INSTANCE_HOSTNAME | sed 's/\./\\\\./g')/g" apache2/sites/$INSTANCE_HOSTNAME.conf
sed -i".tmp" -e "s/SITE_HOSTNAME/$INSTANCE_HOSTNAME/g" apache2/sites/$INSTANCE_HOSTNAME.conf
rm apache2/sites/$INSTANCE_HOSTNAME.conf.tmp

echo "###############################################################################"
echo "### Adding $INSTANCE_HOSTNAME to Enonic XP vhosts"

sed -i".tmp" -e "s/SITE_HOSTNAME/$INSTANCE_HOSTNAME/g" $EXP_VHOST_FILE
rm $EXP_VHOST_FILE.tmp

echo "###############################################################################"
echo "### Adding $INSTANCE_HOSTNAME to docker-compose.yml"

sed -i".tmp" -e "s/SITE_HOSTNAME/$INSTANCE_HOSTNAME/g" docker-compose.yml
rm docker-compose.yml.tmp

echo "###############################################################################"
echo "### Ready to build and deploy with docker-compose"
echo "###############################################################################"
