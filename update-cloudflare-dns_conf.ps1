﻿##### Config

## Which IP should be used for the record: internal/external
## Internal interface will be chosen automaticly as a primary default interface
$what_ip = "internal"
## DNS A record to be updated
$dns_record = "ddns.example.com"
## Cloudflare's Zone ID
$zoneid = "ChangeMe"
## Cloudflare Zone API Token
$cloudflare_zone_api_token = "ChangeMe"
## Use Cloudflare proxy on dns record true/false
$proxied = $false
## 120-7200 in seconds or 1 for Auto
$ttl = 120
## DNS record comment
$comment = ""

## Telegram Notifications yes/no (only sent if DNS is updated)
$notify_me_telegram = "no"
## Telegram Chat ID
$telegram_chat_id = "ChangeMe"
## Telegram Bot API Key
$telegram_bot_API_Token = "ChangeMe"

## Discord Server Notifications yes/no (only sent if DNS is updated)
$notify_me_discord = "no"
## Discord Webhook URL (create a webhook on your Discord server via Server Settings > Integrations)
$discord_webhook_URL = "ChangeMe"

## Notifications with Proxy yes/no
$notify_with_proxy = "no"
## HTTP Proxy URL
$notify_proxy_URL = "ChangeMe"