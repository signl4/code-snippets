
# Send SIGNL4 alert from Bash

# SIGNL4 team secret
team_secret="team-secret"

# Alert data
data()
{
  cat <<EOF
{
  "Title": "Alert",
  "Message": "SIGNL4 alert from Bash Shell"
}
EOF
}

curl -d "$(data)" -H "Content-Type: application/json" "https://connect.signl4.com/webhook/$team_secret"
