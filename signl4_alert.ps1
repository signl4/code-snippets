
# Send SIGNL4 alert from PowerShell

# SIGNL4 team secret
$team_secret = "<team-secret>"
# Alert data
$data = @{
 "Title"="Alert"
 "Message"="SIGNL4 alert from PowerShell"
} | ConvertTo-Json -Depth 4

Invoke-RestMethod "https://connect.signl4.com/webhook/$team_secret" -Method POST -ContentType "application/json" -Body $data
