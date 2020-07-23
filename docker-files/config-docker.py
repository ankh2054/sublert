#!/usr/bin/python

# Slack webhooks for notifications
posting_webhook = "slack_posting_webhook"
errorlogging_webhook = "slack_logging_webhook"
slack_sleep_enabled = True  # bypass Slack rate limit when using free workplace, switch to False if you're using Pro/Ent version.
at_channel_enabled = True   # Add @channel notifications to Slack messages, switch to False if you don't want to use @channel

# crtsh postgres credentials, please leave it unchanged.
DB_HOST = 'crt.sh'
DB_NAME = 'certwatch'
DB_USER = 'guest'
DB_PASSWORD = ''