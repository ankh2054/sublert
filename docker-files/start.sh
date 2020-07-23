#!/bin/bash

add_urls() {
    # Out DOMAINS ENV as plaintext
   declare -a DOMAINS="$DOMAINS"
   for domain in "${DOMAINS[@]}"
    do
    : 
    /usr/bin/python3python3 /root/subalerts/sublert.py -u $domain -q true
    done


}

slack_nitification(){
/usr/bin/python3 /root/subalerts/sublert.py -r -l
}


run_subalert(){
while [ 1 ]
do
	/usr/bin/python3 /root/subalerts/sublert.py -r -l >> /root/sublert/sublert.log 2>&1
	sleep 43200 # Run every 12 hours 
done
}


add_urls
slack_nitification
run_subalert