# DDNS Cloudflare PowerShell Script

[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://mit-license.org/)

- DDNS Cloudflare PowerShell script for **Windows**.
- Supports both IPv4 and IPv6.
- Multiple DNS records supported.
- Choose any source IP address to update **external** or **internal** _(WAN/LAN)_.
- For multiple LAN interfaces like Wifi, Docker Networks and Bridges the script will automatically detect the primary Interface by priority.
- Cloudflare's options for proxy and TTL configurable via the parameters.
- Optional Telegram or Discord Notifications (Can be Proxied)

## Requirements

- Cloudflare [api-token](https://dash.cloudflare.com/profile/api-tokens) with ZONE-DNS-EDIT Permissions
- DNS Record must be pre created (api-token should only edit dns records)
- Enabled running unsigned PowerShell(`-ExecutionPolicy Bypass`)

### Creating Cloudflare API Token

To create a CloudFlare API token for your DNS zone go to [https://dash.cloudflare.com/profile/api-tokens][cloudflare-api-token-url] and follow these steps:

1. Click Create Token
2. Select Create Custom Token
3. Provide the token a name, for example, `example.com-dns-zone-readonly`
4. Grant the token the following permissions:
   - Zone - DNS - Edit
5. Set the zone resources to:
   - Include - Specific Zone - `example.com`
6. Complete the wizard and use the generated token at the `CLOUDFLARE_API_TOKEN` variable for the container

## Installation

[Download the DDNS-Cloudflare-PowerShell zip file](https://github.com/cyb233/DDNS-Cloudflare-PowerShell/archive/refs/heads/main.zip) & Unzip,
rename the folder to _DDNS-Cloudflare-PowerShell_ place in a directory of your choosing (e.g. _C:\DDNS-Cloudflare-PowerShell_)

## Config Parameters

Update the config parameters inside the update-cloudflare-dns_conf.ps1 by editing accordingly. See below for examples.

### Parameters foe DNS record 

| **Option** | **Example**      | **Description**                                           |
| ---------- | ---------------- | --------------------------------------------------------- |
| type       | A                | The type of DNS record: A/AAAA                            |
| what_ip    | internal         | Which IP should be used for the record: internal/external |
| dns_record | ddns.example.com | DNS record which will be updated                          |
| ttl        | 60               | 60-7200 in seconds or 1 for Auto                          |
| comment    | ddns             | comment for dns record                                    |
| proxied    | $false           | Use Cloudflare proxy on dns record true/false             |

### Parameters for Cloudflare

| **Option**                | **Example** | **Description**                              |
| ------------------------- | ----------- | -------------------------------------------- |
| cloudflare_zone_api_token | ChangeMe    | Cloudflare API Token **KEEP IT PRIVATE!!!!** |
| zoneid                    | ChangeMe    | Cloudflare's Zone ID                         |

### Optional Notifications Parameters for Telegram

| **Option**             | **Example** | **Description**                   |
| ---------------------- | ----------- | --------------------------------- |
| notify_me_telegram     | yes         | Use Telegram notifications yes/no |
| telegram_chat_id       | ChangeMe    | Chat ID of the bot                |
| telegram_bot_API_Token | ChangeMe    | Telegram's Bot API Token          |

To generate a Telegram Bot, chat with the [@BotFather](https://t.me/@BotFather).

### Optional Notification Parameters for Discord

| **Option**          | **Example**                | **Description**                               |
| ------------------- | -------------------------- | --------------------------------------------- |
| notify_me_discord   | yes                        | Use Discord notifications yes/no              |
| discord_webhook_URL | http://WebhookURL.com/asd/ | Webhook URL from your Discord server settings |

To generate a webhook URL, follow the [official Discord instructions](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks).

### Optional Notification Parameters with Proxy

| **Option**        | **Example**           | **Description**                 |
| ----------------- | --------------------- | ------------------------------- |
| notify_with_proxy | yes                   | Notifications with Proxy yes/no |
| notify_proxy_URL  | http://127.0.0.1:8080 | HTTP Proxy URL                  |

## Running The Script

Open cmd/powershell

Example:

```bash
powershell.exe -ExecutionPolicy Bypass -File "C:\DDNS-Cloudflare-PowerShell\update-cloudflare-dns.ps1"
```

## Automation With Windows Task Scheduler

Example:
Run at boot with 1 min delay and repeat every 1 min

- Open Task Scheduler
- Action -> Crate Task
- **General Menu**
  - Name: update-cloudflare-dns
  - Run whether user is logged on or not
- **Trigger**
  - New...
  - Begin the task: At startup
  - Delay task for: 1 minute
  - Repeat task every: 1 minute
  - for duration of: indefinitely
  - Enabled
- **Actions**
  - New...
  - Action: Start a Program
  - Program/script: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`
  - Add arguments: `-ExecutionPolicy Bypass -File "C:\DDNS-Cloudflare-PowerShell\update-cloudflare-dns.ps1"`
  - ok
  - Enter your user's password when prompted
- **Conditions**
  - Power: Uncheck - [x] Start the task only if the computer is on AC power

## Logs

This Script will create log files  
Log files will be located at `logs` directory under the directory of `update-cloudflare-dns.ps1`

Log file name:

```bash
$FileName = "update-cloudflare-dns_$DAY.log"
```

## License

### MIT License

Copyright© 3os.org @2020

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.

<!-- urls -->
<!-- appendices -->

[cloudflare-api-token-url]: https://dash.cloudflare.com/profile/api-tokens "Cloudflare API Token"

<!-- end appendices -->
