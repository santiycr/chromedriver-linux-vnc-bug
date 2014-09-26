#!/bin/sh
set -e

echo ''
echo 'INSTALLING'
echo '----------'

# Add Google public key to apt
wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -

# Add Google to the apt-get source list
echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list

# Update app-get
apt-get update

# Install Java, Chrome, Xvfb, and unzip
apt-get -y install openjdk-7-jre google-chrome-stable tightvncserver unzip

# Download and copy the ChromeDriver to /usr/local/bin
cd /tmp
wget -nv "https://chromedriver.storage.googleapis.com/2.10/chromedriver_linux32.zip"
wget -nv "https://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar" \
    -O selenium-server-standalone.jar
unzip chromedriver_linux32.zip
mv chromedriver ~vagrant
mv selenium-server-standalone.jar ~vagrant

# Start Vnc display, Chrome, and Selenium in the background
echo "Starting VNC Display ..."
mkdir -p /root/.vnc
cp ~vagrant/passwd /root/.vnc/passwd
mkdir -p ~vagrant/.vnc
mv ~vagrant/passwd ~vagrant/.vnc/passwd

chown -R vagrant: ~vagrant

sudo -H -u vagrant -- vncserver -geometry 1024x768 :95

echo "Starting Selenium ..."
cd ~vagrant
su - vagrant -c "export DISPLAY=:95; cd ~vagrant; nohup java -jar selenium-server-standalone.jar &"
