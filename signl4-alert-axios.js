
// Send SIGNL4 alert from Node.js

// Your SIGNL4 team secret
const teamSecret = 'team-secret'

const axios = require('axios')

// Alert data
var data = JSON.stringify({
    'Title': 'Alert',
    'Message': 'SIGNL4 alert from Node.js'
})


async function run() {

  // SIGNL4 webhook URL
  const res = await axios.post('https://connect.signl4.com/webhook/' + teamSecret, data, {
    headers: {
      'Content-Type': 'application/json'
    }
  });

  // Result
  console.log('Result: ' + JSON.stringify(res.data));

}

run();
