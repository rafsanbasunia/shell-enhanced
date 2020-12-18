# shell-enhanced

This bot is based on [shell-bot](https://github.com/botgram/shell-bot) by [botgram](https://github.com/botgram/).

This shell bot is pre-installed with ![qbt](https://i.ibb.co/LPLGww7/langfr-220px-New-q-Bittorrent-Logo-svg.png) and ![rcln](https://i.ibb.co/9hWFsbs/Rclone-logo-2.jpg). So you can download from trackers where aria2 is restricted! 😅

If you want extra modules or softwere inside the container, the add your commands in Setup.sh and make sure every command executes successfully. Setup.sh will execute your commands with sudo. Inside the conatiner, you don't have sudo access😐


## How to Deploy :
1. Click on Use This Template(this will fork and make your repository privet) 😕
2. Hit [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/rafsanbasunia/shell-enhanced.git)

If you are not able to Duplicated the repo, then download and upload to your GitHub account mannually. 😂

## How to use ![qbt](https://i.ibb.co/LPLGww7/langfr-220px-New-q-Bittorrent-Logo-svg.png) :
🟡 After a successfull deploy, Run this command ```/run yes y | qbittorrent-nox & ngrok http 10001```

🟡 ngrok will give you http and https link for your webUI. Copy it and paste on your browser hit ENTER. You'll have your qb webUI ✔

IMPORTANT ❗

After few seconds if it shows ```Too many Connections ``` then ngrok token is wrong. To set authToken RUN this ```/run ngrok authtoken yourtoken``` to set your own ngrok token.

By default qb-nox is running on 10001 port. So do not change ngrok http port to something else.

## How to upload Cloud :
1. Make sure you filled all the neccessary values in rclone.conf.
2. The default qb download directory is /home/dl. After all the downloads are finished, run ```/cancel``` to cancel the ngrok process(qB will be running in the background). You can use this command to backup your file in your cloud folder - ```/run rclone sync /home/dl yourRcloneConfigName:```. To upload in a specific directory in the root folder of the cloud, run - ```/run rclone sync /home/dl yourRcloneConfigName:directoryname```

Caution ❗

Rclone sync will sync the exact /home/dl folder. So if you have other files in the root directory of your cloud, make sure you take a backup. You can use copy insted of sync, but this eats more ram. Beware ! If ram usage increases upto 500MiB, your dyno will reboot 😏

## Commands for shell-bot :

Use /run <command> and I'll execute it for you. While it's running, you can:

‣ Reply to one of my messages to send input to the command, or use /enter.

‣ Use /end to send an EOF (Ctrl+D) to the command.

‣ Use /cancel to send SIGINT (Ctrl+C) to the process group, or the signal you choose.

‣ Use /kill to send SIGTERM to the root process, or the signal you choose.

‣ For graphical applications, use /redraw to force a repaint of the screen.

‣ Use /type or /control to press keys, /meta to send the next key with Alt, or /keypad to show a keyboard for special keys.

You can see the current status and settings for this chat with /status.

 Use /env to manipulate the environment, /cd to change the current directory, /shell to see or change the shell used to run commands and /resize to change the size of the terminal.

By default, output messages are sent silently (without sound) and links are not expanded. This can be changed through /setsilent and /setlinkpreviews. Note: links are never expanded in status lines.

# Additional features

Use /upload <file> and I'll send that file to you. If you reply to that message by uploading me a file, I'll overwrite it with yours.

You can also use /file <file> to display the contents of file as a text message. This also allows you to edit the file, but you have to know how...

## Credits :
