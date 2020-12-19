echo "Performing additional setup 1"

add-apt-repository -y ppa:poplite/qbittorrent-enhanced
apt-get install qbittorrent-enhanced-nox -qq -y
curl https://rclone.org/install.sh | bash

echo "Performing additional setup 2"
wget -qq https://raw.githubusercontent.com/rafsanbasunia/qbittorrentWebUI/master/qbittorent2.conf \
            -O /home/.config/qBittorrent/qBittorrent.conf

echo "Performing additional setup 3"