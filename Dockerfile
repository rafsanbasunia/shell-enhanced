FROM phusion/baseimage:bionic-1.0.0

# Do not change the Docker container. This bionic container eats less juice than Ubuntu 20.04
CMD ["/sbin/my_init"]

# Basic modules to make the container more usable. You can add more btw... 
RUN apt-get update && apt-get install -y \
    bash \
    sudo \
    curl \
    git \
    make \
    busybox \
    wget \
    build-essential \
    nodejs \
    npm \
 && mkdir -p /home/files


# This is the default working directory. Don't change it if you don't know what you're doing.
WORKDIR /home
# Make Your Custom Directory with sudo

RUN mkdir -p /home/.config/qBittorrent
RUN mkdir -p /home/.config/rclone/

# This is you default dowload directory for qbit...
RUN mkdir -p /home/dl

COPY bot.sh /home
COPY Setup.sh /home

# This will copy your extra files which you need inside the container.
COPY /files /home/flies

# ngrok will forward localhost to http or https
RUN npm install -g ngrok


# This will run Setup.sh and excute all your command with sudo.
RUN sh /home/Setup.sh \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# This will copy your rclone config.
RUN cp /home/files/rclone.conf /home/.config/rclone/

# This will install the shell bot aka the core.. of your bot.
RUN git clone https://github.com/botgram/shell-bot.git \
 && cd shell-bot \
 && npm install

# Set your ngrok authtoken...
RUN ngrok authtoken $NGROK_TOKEN

RUN echo "All Operations Completed Successfully!"

# Start the bot
CMD bash /home/bot.sh
