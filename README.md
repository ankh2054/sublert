                                       _____       __    __          __
                                      / ___/__  __/ /_  / /__  _____/ /_
                                      \__ \/ / / / __ \/ / _ \/ ___/ __/
                                     ___/ / /_/ / /_/ / /  __/ /  / /_
                                    /____/\__,_/_.___/_/\___/_/   \__/

                                        Author: Yassine Aboukir
                                            Version: 1.4.7
<p align="center"><a href="https://twitter.com/yassineaboukir" target="_blank"><img src="https://img.shields.io/twitter/follow/yassineaboukir.svg?logo=twitter"></a></p>

## What's this about?
Sublert is a security and reconnaissance tool that was written in Python to leverage certificate transparency for the sole purpose of monitoring new subdomains deployed by specific organizations and issued TLS/SSL certificate. The tool is supposed to be scheduled to run periodically at fixed times, dates, or intervals (Ideally each day). New identified subdomains will be sent to Slack workspace with a notification push. Furthermore, the tool performs DNS resolution to determine working subdomains.

## Requirements
- Virtual Private Server (VPS) running on Unix. (I personally use digitalOcean)
- Python 2.x or 3.x.
- Free Slack workspace.

## Installation & Configuration
Please refer to below article for a detailed technical explanation:
- https://medium.com/@yassineaboukir/automated-monitoring-of-subdomains-for-fun-and-profit-release-of-sublert-634cfc5d7708

## Usage

Short Form    | Long Form     | Description
------------- | ------------- |-------------
-u            | --url       | Adds a domain to monitor. E.g: yahoo.com.
-d            | --delete      | Domain to remove from the monitored list. E.g: yahoo.com.
-a            | --list       | Listing all monitored domains.
-t            | --threads       | Number of concurrent threads to use (Default: 20).
-r            | --resolve      | Perform DNS resolution.
-l            | --logging     | Enable Slack-based error logging.
-m            | --reset        | Reset everything.
-q            | --question        | Set to true to disable questions asking for input (Default: no).


# Running Subalert using Docker 

- Will configure a container and run subalert every 12 hours.
- All found subdomains will be send to a slack channel.
- Once started if everything went well,  it sends a test alert to your slack channel.

## ENV Variables

|ENV & ARG                 |Value                          |Description                                    |
|--------------------------|------------------------------------------|------------------------------------|
|**SLACK_WEB_HOOK**        |`https://hooks.slack.com/services/xxxx`   | Your Slackwebhook                  |
|**DOMAINS**               |`test.io,test.com,abc123.com`             | List of initial domains to scan    |


## Build the production container

```
docker build https://github.com/yassineaboukir/sublert.git -t subalert
```

## Run the container passing required ENV variables


```Dockerfile:
docker run  --name subalert -d \ 
-e "SLACK_WEB_HOOK=xxxxxxxxxxxxx" \
-e "DOMAINS=test.io,test.com,abc123.com" \
subalert
```

## To add more domains once conatiner is live

```
 sudo docker exec -ti subalert python3 /root/sublerts/sublert.py -u domain.com -q true
``


## Feedback and issues?
If you have any feedback, anything that you want to see implemented or running into issues using Sublert, please feel free to file an issue on https://github.com/yassineaboukir/sublert/issues

## Support
If you appreciate my work and wish to support it, feel free to: <a href="http://buymeacoffee.com/yassineaboukir"><img src="https://cdn-images-1.medium.com/max/738/1*G95uyokAH4JC5Ppvx4LmoQ@2x.png" width="150"></a>



