<?php
if(!defined('INITIALIZED'))
	exit;
$playersOnline = $config['status']['serverStatus_players'];
$casts = $SQL->query("SELECT COUNT(1), IFNULL(SUM(`spectators`), 0) FROM `live_casts`;")->fetch();
$cacheSec = 30;
$cacheFile = 'cache/topplayers.tmp';
if (file_exists($cacheFile) && filemtime($cacheFile) > (time() - $cacheSec)) {
	$topData = file_get_contents($cacheFile);
} else {
	$topData = '';
	$i = 0;
	foreach($SQL->query("SELECT `name`, `level` FROM `players` WHERE `group_id` < 2 AND `account_id` != 3 ORDER BY `level` DESC LIMIT 5")->fetchAll() as $player) {
		$i++;
		$topData .= '<tr><td style="width: 80%"><strong>'.$i.'.</strong> <a href="?view=characters&name='.urlencode($player['name']).'">'.$player['name'].'</a></td><td><span class="label label-primary">Lvl. '.$player['level'].'</span></td></tr>';
	}
	file_put_contents($cacheFile, $topData);
}
$today = strtotime('today 10:00');
$tomorrow = strtotime('tomorrow 10:00');
$now = time();
$remaining = ($now > $today ? $tomorrow : $today) - $now;
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Telara</title>
	<link rel="icon" type="image/png" href="<?php echo $layout_name; ?>/images/favicon.png">
	<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/all.css?id=381e835c663e272d14e7">

<!-- jQuery -->
		<script src="<?php echo $layout_name; ?>/js/jquery.js"></script>
		<script src="<?php echo $layout_name; ?>/js/jquery.fancybox-1.3.4.pack.js"></script>
		<script src="<?php echo $layout_name; ?>/js/jquery.ui.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script src="<?php echo $layout_name; ?>/js/main.js"></script>
		<script src="<?php echo $layout_name; ?>/js/ajaxmonteiro.js"></script>


    </head>

<body>

<div class="container">
    <div class="row">
        <div id="header">
            <img src="<?php echo $layout_name; ?>/images/logo.png">
        </div>
    </div>

    <div id="navbar">
        <a href="?view=news">
    <div class="navbar-item news">
        <img src="<?php echo $layout_name; ?>/images/news.png">
        <span>News</span>
    </div>
</a>

<a href="?view=topguilds">
    <div class="navbar-item news">
        <img src="<?php echo $layout_name; ?>/images/skills.png">
        <span>Top Guilds</span>
    </div>
</a>

<a href="?view=highscores">
    <div class="navbar-item highscore">
        <img src="<?php echo $layout_name; ?>/images/highscore.png">
        <span>Highscore</span>
    </div>
</a>

<a href="?view=store">
    <div class="navbar-item store">
        <img src="<?php echo $layout_name; ?>/images/store.png">
        <span>Store</span>
    </div>
</a>

<a href="?view=offers">
    <div class="navbar-item donate">
        <img src="<?php echo $layout_name; ?>/images/donate.png">
        <span>Buy Points</span>
    </div>
</a>    </div>

    <div class="row">
                    <div class="col-xs-2 left-menu">
                <div class="panel-default">

                    <div id="server-status">
										<?php
										if($config['status']['serverStatus_online'] == 1)
											echo '<span style="color:green">Online</span>';
										else
											echo '<span style="color:red">Offline</span>';
										?>
                    </div>

                    <a href="?view=online">
                        <div class="top"></div>
                    </a>
                    <div class="body">
                        <li><a href="?view=news">Home</a></li>
						<li><a href="?view=characters">Characters</a></li>
						<li><a href="?view=guilds">Guilds</a></li>
						<li><a href="?view=deaths">Deaths</a></li>
						<li><a href="?view=wars">Guild Wars</a></li>
						<li><a href="?view=downloads">Downloads</a></li>
						<li><a href="?view=cast">Cast System</a></li>
						<li><a href="?view=info">Informations</a></li>
                    </div>

                    <div class="bottom"></div>
                </div>
            </div>
        
        <div class="col-xs-8 middle-content">
                                    
                <div class="panel" style="margin-bottom:30px;">
                <div class="top"></div>
                <div class="body">
                    <div class="title">
					<?php if ($subtopic == '' || $subtopic == 'news') { ?>
                    </div>
										
					<?php } ?>
					<?PHP echo $main_content; ?>

                    <br>
					
                </div>

            </div>
			                <div class="bottom"></div>
                    
                 </div>
        </div>

                    <div class="col-xs-2 right-menu" style="margin-left:3px;">
                        <div id="account-panel">
                        <a href="#" class="download"></a>
							<form class="form" role="form" action="?view=account" method="post">
                            <input type="hidden" name="_token" value="ZdpddQF6pvb2WRfmyeK7vKzcayoAhStFTXiwUDqq">
							<div class="field account">
								<input type="password" maxlength="35" name="account_login" class="form-control" placeholder="Account Name" required />
							</div>
							<div class="field password">
								<input type="password" maxlength="35" name="password_login" class="form-control" placeholder="Password" required/>
							</div>
                            <div class="recovery">
                                <a href="<?php echo $layout_name; ?>/account/lost">Lost Account</a>
                            </div>
                            <div class="resend">
                                <a href="<?php echo $layout_name; ?>/resend_confirmation">Resend Verification Code</a>
                            </div>
							<button type="submit" class="button-login btn btn-primary"></button>
                        </form>
                        <a href="<?php echo $layout_name; ?>/register" class="register"></a>
                    </div>
                                <div align="center" style="width: 317px;position: relative;">
                    <a href="<?php echo $layout_name; ?>/gallery">
                        <img src="<?php echo $layout_name; ?>/images/screenshots.png" alt="">
                    </a>
                </div>
                <div align="center" style="width: 317px;position: relative;">
                    <a href="<?php echo $layout_name; ?>/character/buy">
                        <img src="<?php echo $layout_name; ?>/images/trading.png" alt="">
                    </a>
                </div>
                <div id="networks">
                    <div class="network-icons" align="center">
                        <a href="#" target="_blank">
                            <img src="<?php echo $layout_name; ?>/images/networks/networks_03.png" width="47" height="46" alt="">
                        </a>
                        
                            
                        
                        <a href="#" target="_blank">
                            <img src="<?php echo $layout_name; ?>/images/networks/networks_05.png" width="53" height="46" alt="">
                        </a>
                        <a href="#" target="_blank">
                            <img src="<?php echo $layout_name; ?>/images/networks/networks_06.png" width="50" height="46" alt="">
                        </a>
                    </div>
                </div>
            </div>
            </div>
</div>


</body>
</html>
