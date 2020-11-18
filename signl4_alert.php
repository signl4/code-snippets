<?php

// Send SIGNL4 alert from PHP

// Your SIGNL4 team secret
$teamSecret = '<team-secret>';

$url = 'https://connect.signl4.com/webhook/' . $teamSecret;
 
// User cURL
$ch = curl_init($url);
 
// Alert data
$data = array(
    'Title' => 'Alert',
    'Message' => 'SIGNL4 alert from PHP'
);

$jsonData = json_encode($data);

// Send the request
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // No echo for curl_errno
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json')); 
 
//Execute the request
$result = curl_exec($ch);

if (!curl_errno($ch)) {
	$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	if ($http_code == 201) {
		// Success
		echo $result . '\r\n';
	}
	else {
		// Error
		echo 'Error: ' . $http_code . '\r\n';
	}
}
else {
	// Error
	echo 'Error\r\n';
}

curl_close($ch);

?>
