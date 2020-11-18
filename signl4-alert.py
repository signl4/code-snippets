

# Send SIGNL4 alert from Python

import requests

# Your SIGNL4 team secret
teamSecret = '<team-secret>'

# SIGNL4 webhook URL
webhook_url = 'https://connect.signl4.com/webhook/' + teamSecret

# Alert data
alert_data = {
    'Title': 'Alert',
    'Message': 'SIGNL4 alert from Python'}

result = requests.post(url = webhook_url, json = alert_data)

if result.status_code == 201:
    # Success
    print(result.text)
else:
    # Error
    print('Error: ' + str(result.status_code))
