# Do not edit anything Here
cd /home/shell-bot
cat > config.json << EOF
{
    "authToken": "$BOT_TOKEN",
    "owner": $OWN_ID
}
EOF
echo "Created config for Shell bot"

echo "Starting Shell bot"
node server
