
// Send SIGNL4 alert from Node.js

// Your SIGNL4 team secret
const teamSecret = '<team-secret>'

const https = require('https')

// Alert data
const data = JSON.stringify({
    'Title': 'Alert',
    'Message': 'SIGNL4 alert from Node.js'
})

// SIGNL4 webhook URL
const options = {
  hostname: 'connect.signl4.com',
  port: 443,
  path: '/webhook/' + teamSecret,
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Content-Length': data.length
  }
}

const req = https.request(options, res => {
  console.log(`statusCode: ${res.statusCode}`)

  if (res.statusCode != 201) {
      // Error
      console.error('Error: ' + res.statusCode)
      return
  }

  // Success
  res.on('data', d => {
    process.stdout.write(d)
  })
})

// Error
req.on('error', error => {
  console.error(error)
})

req.write(data)
req.end()
