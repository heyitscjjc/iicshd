<?php

/*

watson-assistant-php
====================

A pure PHP implementation of IBM's Watson Assistant service


Metadata
--------

| Data       | Value                            |
| ----------:| -------------------------------- |
|    Version | 1.0                              |
|    Updated | 2019-03-27T13:11:02+00:00        |
|     Author | Adam Newbold, https://adam.lol   |
| Maintainer | Neatnik LLC, https://neatnik.net |
|   Requires | PHP 5.6 or 7.0+, curl            |


Changelog
---------

### 1.0

 * Initial release


License
-------

Copyright (c) 2019 Neatnik LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


Legal
-----

IBM Watson® is a registered trademark of IBM Corporation.

*/

# Begin configuration

$workspace = '01ae9e7d-7a59-43bf-8db7-5392661441cd';
$username = 'apikey';
$password = '5n_o_uV8056uGeLj2asr9TIYoGvLy0gJyW84gpd_bPbN';
$version = '2019-12-09';
$gateway = 'https://gateway.watsonplatform.net/assistant/api'; // Dallas
//$gateway = 'https://gateway-wdc.watsonplatform.net/assistant/api'; // Washington, DC
//$gateway = 'https://gateway-fra.watsonplatform.net/assistant/api'; // Frankfurt
//$gateway = 'https://gateway-syd.watsonplatform.net/assistant/api'; // Sydney
//$gateway = 'https://gateway-tok.watsonplatform.net/assistant/api'; // Tokyo
//$gateway = 'https://gateway-lon.watsonplatform.net/assistant/api'; // London

# End configuration

session_start();

if(isset($_REQUEST['reset'])) {
	session_destroy();
	$_SESSION = null;
	$destination = 'http://'.$_SERVER['HTTP_HOST'].'/'.$_SERVER['PHP_SELF'];
	header('Location: '.$destination);
	exit;
}

if(!isset($_SESSION['context'])) {
	$_SESSION['context'] = null;
}

if(isset($_REQUEST['query'])) {
	$query = $_REQUEST['query'];
}
else {
	$query = null;
}

?><!DOCTYPE html>
<html lang="en">
<head>
<title>Watson Assistant</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
</head>
<body>

<main>

<h1><span class="icon-utility-live-chat"></span> Watson Assistant</h1>

<form action="?" method="post">
<p><input type="text" id="query" name="query" placeholder="<?php echo $query; ?>"> <input type="submit" value="Send"></p>
</form>

<?php

$curl = curl_init();
$context = json_encode($_SESSION['context']);
$data = '{"input": {"text": "'.$query.'"}, "context": '.$context.'}';

curl_setopt_array($curl, array(
	CURLOPT_HTTPHEADER => array('Content-type: application/json'),
	CURLOPT_POST => true,
	CURLOPT_URL => "$gateway/v1/workspaces/$workspace/message?version=$version",
	CURLOPT_USERPWD => "$username:$password",
	CURLOPT_POSTFIELDS => $data,
	CURLOPT_RETURNTRANSFER => true,
	CURLOPT_SSL_VERIFYPEER => true
));

$response = curl_exec($curl);

$err = curl_error($curl);
curl_close($curl);
$response = json_decode($response);
//$_SESSION['context'] = $response->context;
$output = implode('<br>', $response->output->text);

if($query != null) {
	echo '<p class="you"><strong>You:</strong> '.$query.'</p>';
}

echo '<p class="watson"><strong>Watson:</strong> '.$output.'</p>';

?>

</main>

<script type="text/javascript">
document.getElementById("query").focus();
</script>

</body>
</html>
