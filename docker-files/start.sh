#!/bin/bash

add_urls() {
    # Out DOMAINS ENV as plaintext
   declare -a DOMAINS="$DOMAINS"
   for domain in "${DOMAINS[@]}"
    do
    : 
    /usr/bin/python3/python3 /root/sublerts/sublert.py -u $domain -q true
    done


}

create_config(){

cat > /root/sublerts/config.py <<EOF
#!/usr/bin/python

# Slack webhooks for notifications
posting_webhook = "${SLACK_WEB_HOOK}"
errorlogging_webhook = "${SLACK_WEB_HOOK}"
slack_sleep_enabled = True  # bypass Slack rate limit when using free workplace, switch to False if you're using Pro/Ent version.
at_channel_enabled = True   # Add @channel notifications to Slack messages, switch to False if you don't want to use @channel

# crtsh postgres credentials, please leave it unchanged.
DB_HOST = 'crt.sh'
DB_NAME = 'certwatch'
DB_USER = 'guest'
DB_PASSWORD = ''
EOF

}


}
slack_nitification(){
/usr/bin/python3 /root/sublerts/sublert.py -r -l
}


run_subalert(){
while [ 1 ]
do
	/usr/bin/python3 /root/sublerts/sublert.py -r -l >> /root/sublerts/sublert.log 2>&1
	sleep 43200 # Run every 12 hours 
done
}

create_config
add_urls
slack_nitification
run_subalert