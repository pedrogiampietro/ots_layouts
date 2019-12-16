<?php
// if we set ONLY_PAGE, then it will not login / connect to MySQL until we use SQL query in our script
define('ONLY_PAGE', true);
$_GET['view'] = 'guild_image';
$_REQUEST['view'] = 'guild_image';
include('index.php');
