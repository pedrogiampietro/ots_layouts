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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href='https://fonts.googleapis.com/css?family=Overlock' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link href="<?php echo $layout_name; ?>/css/fontawesome.css" rel="stylesheet" type="text/css" />
<link href="<?php echo $layout_name; ?>/css/style.css" rel="stylesheet" type="text/css"/>
<link href="<?php echo $layout_name; ?>/css/teste.css" rel="stylesheet" type="text/css"/>
		<script src="https://code.jquery.com/jquery-2.1.0.min.js"></script>
		<script src="<?php echo $layout_name; ?>/js/jquery.slides.min.js"></script>
		<style>
			#slides
			{
				display: none
			}
		</style>
		<script>
			$(function() {
			$('#slides').slidesjs({
				width: 469,
				height: 115,
				navigation: true,
				play: {
				active: false,
				auto: true,
				interval: 4000,
				swap: true,
				pauseOnHover: false,
				restartDelay: 2500
			   }
			});
			});
		</script>
		</script>
</head>
<body>
	<div class="page">
		<div class="navbar">
			<a href="?view=news"><div class="news link"></div></a>
			<a href="?view=account"><div class="account link"></div></a>
			<a href="?view=info"><div class="info link"></div></a>
			<a href="?view=shop"><div class="shop link"></div></a>
			<a href="?view=register"><div class="register link"></div></a>

			<div class="search_area">
				<form method="get" action="characterprofile.php">
					<input type="text" name="name" class="nav_search" value="Find player..."  onfocus="this.value=''" onblur="if(this.value=='') { this.value='Find player...'};"/>
					<input type="submit" class="nav_search_btn" value="&#xf002;"/>
				</form>
			</div>
		</div>

		<div class="logo"></div>
		<div class="main_cnt">
			<div class="left_cnt">
				<div class="widget-news"></div>
					<ul>
						<li><a href="?view=news">Home</a></li>
						<li><a href="?view=info">Server Information</a></li>
					</ul>
				<div class="widget-account"></div>
					<ul>
						<li><a href="?view=account">Manage Account</a></li>
						<li><a style="color: yellow;" href="?view=register">Create Account</a></li>
						<li><a href="?view=accountlost">Lost Account?</a></li>
					</ul>
				<div class="widget-community"></div>
					<ul>
						<li><a href="?view=highscores">Highscores</a></li>
						<li><a href="?view=task">Tasks</a></li>
						<li><a href="?view=support">Support</a></li>
						<li><a href="?view=lastdeaths">Deaths</a></li>
						<li><a href="?view=forum">Forum</a></li>
							<li><a href="?view=guild">Guilds</a>
													<ul>
								<li><a href="?view=">Guild List</a></li>
								<li><a href="?view=">Guild Wars</a></li>
							</ul>
						</li>
						<li><a href="?view=">Changelog</a></li>
					</ul>
				<div class="widget-shop"></div>
					<ul>
						<li><a href="?view=donate">Buy Points</a></li>
						<li><a href="?view=">Shop Offers</a></li>
					</ul>
			</div>
			<div class="center_cnt">
				<div class="cnt_mid">
					<div class="cnt_top"></div>
						<div class="content">
							<div class="slider_bg">
								<div id="slides">
									<img src="<?php echo $layout_name; ?>/images/slides/1.jpg">
									<img src="<?php echo $layout_name; ?>/images/slides/4.jpg">
									<a href="#" class="slidesjs-previous slidesjs-navigation"><span class="icon icon-chevron-left"></span></a>
									<a href="#" class="slidesjs-next slidesjs-navigation"><span class="icon icon-chevron-right"></span></a>
								</div>
							</div>						
							
						
							<div class="news_mid">
								<?php if ($subtopic == '' || $subtopic == 'news') { ?>

								<?php } ?>

								<?PHP echo $main_content; ?>
				
							</div>
							
						<div class="news_bot"></div>
						<br>
						</div>
					<div class="cnt_bot"></div>
				</div>
				
				<div class="footer">
					<p>Copyright &copy; 2019, <span style="color:#9C502F;">Fibula74.com</span>. All rights reserved.</p>
					<div class="links"><a href="?view=news">HOME</a> | <a href="?view=forum">FORUMS</a> | <a href="?view=register">REGISTER</a> | <a href="?view=account">LOGIN</a> | <a href="?view=info">SERVER INFO</a></div>
				</div>
			</div>
			
			             <?php
                    if($logged) {
                ?>							
				
				
				<div class="box informations">
						<div class="box-content">
							<div class="item">
								<div class="wrap">
									<div class="left"></div>
									<div class="centered">
									<p><h3>Welcome Back!</h3></p>
									<strong>Account Name: <?PHP echo $account_logged->getName(); ?></strong>
									<br>
									<a href="?view=account">Manage account</a>
									<br>
									<br>
									<a class="btn btn-xs btn-danger" href="?view=account&action=logout">Logout</a>
									</div>
									<br>
								</div>
							</div>
						</div>
					</div>
               					
									
								
                <?php
                    }
                    else
                    {
                ?>
			
			<div class="right_cnt">
				<div class="widget-quicklogin"></div>
					<form class="form" role="form" action="?view=account" method="post">
					<div class="loginbox">
						<input type="password" maxlength="35" name="account_login" type="text" class="hemrenus" placeholder="Account Name" required />
						<input type="password" maxlength="35" name="password_login" class="hemrenus" placeholder="Password" required/>
						<button type="submit" class="hemrenus_subm">Sign in</button>
						<a href="?view=register" class="hemrenus_subm">Register</a>
						Lost your account? <a href="?view=#"><small>RECOVER</small></a>
					</div>
					</form>
					
								<div class="widget-serverinfo"></div>
								<tbody>
								<tr>
									<td><b>IP:</b></td> <td>telara-ats.com</td>
								</tr>
								<tr>
								<br>
									<td><b>Client:</b></td> <td>10.80-10.82</td>
								</tr>
								<tr>
								<br>
									<td><b>Type:</b></td> <td>PvP</td>
								</tr>
								<br>
								<tr>
									<td colspan=2>Status: <?php
										if($config['status']['serverStatus_online'] == 1)
											echo '<span style="color:green">Online</span>';
										else
											echo '<span style="color:red">Offline</span>';
										?></td>
								</tr>
								<br>
								<tr>
									<td><a href="?view=online"><?PHP echo $playersOnline; ?> player<?php echo ($playersOnline != 1 ? 's' : ''); ?> online</a></td>
								</tr>
								<br>
								<tr>
									<td><a href="?view=casts"><?php echo $casts[0]; ?> cast<?php echo ($casts[0] != 1 ? 's' : ''); ?> with <?php echo $casts[1]; ?> spectator<?php echo ($casts[1] != 1 ? 's' : ''); ?></a></td>
								</tr>
								<br>
								<br>
							</tbody>
							
							
				<div class="widget-top10"></div>
					<ul class="top10">
							<table>
							<tbody>
					
								<?php echo $topData; ?>
							</tbody>
							</table>
							
			</div>
			<?php
    }
?>
		</div>
	</div>
</body>
</html>