#!/usr/bin/with-contenv bashio

WELCOMETEXT="$(bashio::config 'welcometext')"
ESCAPED_WELCOMETEXT="$(echo ${WELCOMETEXT} | sed \"s/\\\"/\\\\\"/g\")"
echo "welcometext=\"${ESCAPED_WELCOMETEXT}\"" >> /config/mumble-server.ini

SERVERPASSWORD="$(bashio::config 'serverpassword')"
ESCAPED_SERVERPASSWORD="$(echo ${SERVERPASSWORD} | sed \"s/\\\"/\\\\\"/g\")"
echo "serverpassword=\"${ESCAPED_SERVERPASSWORD}\"" >> /config/mumble-server.ini

echo "bandwidth=558000" >> /config/mumble-server.ini
echo "users=10" >> /config/mumble-server.ini
echo "messageburst=5" >> /config/mumble-server.ini
echo "messagelimit=1" >> /config/mumble-server.ini
echo "allowping=true" >> /config/mumble-server.ini

# ICE Configuration must be last
echo "; You can configure any of the configuration options for Ice here. We recommend" >> /config/mumble-server.ini
echo "; leave the defaults as they are." >> /config/mumble-server.ini
echo "; Please note that this section has to be last in the configuration file." >> /config/mumble-server.ini
echo ";" >> /config/mumble-server.ini
echo "[Ice]" >> /config/mumble-server.ini
echo "Ice.Warn.UnknownProperties=1" >> /config/mumble-server.ini
echo "Ice.MessageSizeMax=65536" >> /config/mumble-server.ini

cat /config/mumble-server.ini

usr/bin/murmurd -fg -ini /config/mumble-server.ini
