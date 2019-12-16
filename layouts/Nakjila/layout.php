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
<html dir="ltr" lang="en-gb">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Nakjila</title>


<link href="<?php echo $layout_name; ?>/css/imageupload.css" rel="stylesheet" type="text/css" media="screen" />
<link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900' rel='stylesheet' type='text/css'>
<link href="<?php echo $layout_name; ?>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<?php echo $layout_name; ?>/css/forumus-style.css" rel="stylesheet">
<link href="<?php echo $layout_name; ?>/css/colors/style-color.css" rel="stylesheet" id="mainColorScheme">
<link href="<?php echo $layout_name; ?>/css/custom.css" rel="stylesheet">
<link href="<?php echo $layout_name; ?>/css/style.css?v11" rel="stylesheet">
</head>
<body>

<div id="preloader">
<div class="preloader--bounce">
<div class="preloader-bouncer--1"></div>
<div class="preloader-bouncer--2"></div>
</div>
</div>

<div class="topnav">
<div class="wrapper">
<div class="container-nav-left">
<ul>
<li><a href="?view=news" class="nav-active"><i class="fa fa-home"></i> Home</a></li>
<li><a href="?view=account"><i class="fa fa-user"></i> Login</a></li>
<li><a href="?view=register"><i class="fa fa-user-plus"></i> Register</a></li>
<li><a href="?view=highscores" target="_blank"><i class="fa fa-bar-chart"></i> Highscores</a></li>
</ul>
</div>
<div class="container-nav-centre">
<ul>
<li><img src="layouts/Nakjila/images/logo2.png"></li>
</ul>
</div>
<div class="container-nav-right">
<ul>
<li><a href="?view=info"><i class="fa fa-info-circle"></i> Informations</a></li>
<li><a href="?view=support"><i class="fa fa-users"></i> Support </a></li>
<li><a href="?view=forum"><i class="fa fa-comments-o"></i> Forum</a></li>
<li><a href="?view=shop"><i class="fa fa-shopping-cart"></i> Shop</a></li>
</ul>
</div>
</div>
</div>

<div class="wrapper">
<div class="wrapper">
<div class="banner-text">
<h1>Nakjila</h1>
<p>Fight the invasion.</p>
</div>

<div class="header--nav bg-bluewood">
<div class="container">
<div class="navbar-header center">

<button type="button" class="navbar-toggle collapsed pull-left" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">

<i class="fa fa-2x fa-list" style="color:#fff"></i>
</button>
</div>
<div id="navbar" class="navbar-collapse collapse">
<a href="/play/">
<div class="play-button"></div>
</a>
<ul class="nav navbar-nav header-nav--primary  logged-out">
<li><a href="?view=characters" title="Community Boards"><i class="fa fa-male"></i> Characters</a></li>
<li><a href="?view=online"><i class="fa fa-check"></i> Who is Online?</a></li>
<li><a href="?view=guilds"><i class="fa fa-user-circle-o"></i> Guilds</a></li>
<li><a href="?view=houses"><i class="fa fa-home"></i> Houses</a></li>

</ul>

</div>

</div>
<div class="header-nav--tab">
<div class="container">
<div class="tab-content">


</div>
</div>
</div>
</div>
 </div>
<div id="topic">
<div class="container">
<div class="row">
<div class="col-md-9 topic--body">
<div class="topic--list">



												<?php if ($view == '' || $view == 'news') { ?>
												<?php } ?>

												<?PHP echo $main_content; ?>

</div>

</div>


<div class="col-md-3 topic--sidebar">

<div class="topic-sidebar--widget">
<div class="topic-list--header clearfix">
</div>
<div class="topic-list--content">

<div class="topic-sidebar-widget--ad">

<?php
                    if($logged) {
                ?>	
				
				<div class="topic-sidebar--widget">
<div class="topic-list--header clearfix">
<span class="topic-list-header--title"><i class="fa fa-info"></i>Account</span>
</div>



						<table>
				<p><h3>Welcome Back!</h3></p>
									<strong>Account Name: <?PHP echo $account_logged->getName(); ?></strong>
									<br>
									<a href="?view=account">Manage account</a>
									<br>
									<br>
									<a class="btn btn-xs btn-danger" href="?view=account&action=logout"><font color="white">Logout</font></a>
						</table>



</div>
				
				
				  <?php
                    }
                    else
                    {
                ?>

	<form class="form" role="form" action="?view=account" method="post">
											<div class="form-group">
												<input type="password" maxlength="35" name="account_login" class="form-control" placeholder="Account Name" required />
											</div>
											<div class="form-group">
												<input type="password" maxlength="35" name="password_login" class="form-control" placeholder="Password" required/>
											</div>
											<div class="form-group">
												<button type="submit" class="btn btn-primary btn-block">Sign in</button>
											</div>
										</form>
										<a href="?view=register" class="btn btn-success btn-block"><font color="white">Register new Account</font></a>
</div>

<?php
    }
?>

</div>
</div>



<div class="topic-sidebar--widget">
<div class="topic-list--header clearfix">
<span class="topic-list-header--title"><i class="fa fa-bar-chart"></i>Status</span>
</div>
<div class="topic-list--content">

<div class="topic-sidebar-widget--ad">
						<table>
							<tbody>
								<tr>
									<td>Status:</td><td colspan=1>
										<?php
										if($config['status']['serverStatus_online'] == 1)
											echo '<span class="label label-success pull-right label-sm">Online</span>';
										else
											echo '<span class="label label-danger pull-right label-sm">Offline</span>';
										?>
									</td>
								</tr>
								<tr>
									<td>Server Save:</td>
									<td>06:00</td>
								</tr>
								<tr>
									<td><a href="?view=online"><?PHP echo $playersOnline; ?> player<?php echo ($playersOnline != 1 ? 's' : ''); ?> online</a></td><td></td>
								</tr>
							</tbody>
						</table>
</div>

</div>
</div>


<div class="topic-sidebar--widget">
<div class="topic-list--header clearfix">
<span class="topic-list-header--title"><i class="fa fa-info"></i>Informations</span>
</div>
<div class="topic-list--content">

<div class="topic-sidebar-widget--ad">
						<table>
							<tbody>
								<tr>
									<td><b>IP:</b></td> <td>burmourne.net</td>
								</tr>
								<tr>
									<td><b>Client:</b></td> <td>10.80-10.82</td>
								</tr>
								<tr>
									<td><b>Type:</b></td> <td>PvP</td></center>
								</tr>
							</tbody>
						</table>
</div>

</div>
</div>


<div class="topic-sidebar--widget">
<div class="topic-list--header clearfix">
<span class="topic-list-header--title"><i class="fa fa-bar-chart"></i>Top Players</span>
</div>
<div class="topic-list--content">

<div class="topic-sidebar-widget--ad">
<table class="hs_users">
																<tbody>
																	<?php echo $topData; ?>
																</tbody>
															</table>

</div>

</div>
</div>

</div>

</div>
</div>
</div>
<br /><br />

<div id="footer">
<div class="container">
<div class="row">

<div class="col-md-3 footer-widget">

<div class="footer-about">
<h4>Support</h4>
<div class="footer-useful-links">
<ul>
<li><a href="#">Contact</a></li>
<li><a href="#">Discord</a></li>
</ul>
</div>
<div class="social">
<ul>
<li><a class="wbtn" href="#"><i class="fa fa-facebook-f"></i></a></li>
<li><a class="wbtn" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="wbtn" href="#"><i class="fa fa-google-plus"></i></a></li>
</ul>
</div>
</div>
</div>


<div class="col-md-3 col-sm-6 footer-widget">
<div class="footer-useful-links">
<h4>Features</h4>
<ul>
<li><a href="#">Updates</a></li>
<li><a href="#">Search</a></li>
</ul>
</div>
</div>


<div class="col-md-3 col-sm-6 footer-widget">
<div class="footer-useful-links">
<h4>Terms</h4>
<ul>
<li><a href="#">Terms</a></li>
<li><a href="#">Rules</a></li>
<li><a href="#" title="Frequently Asked Questions">FAQ</a></li>
</ul>
</div>
</div>


<div class="col-md-3 col-sm-6 footer-widget">
<div class="footer-useful-links">
<h4>Links</h4>
<ul>
<li><a href="#">The team</a></li>
<li><a href="#" data-ajax="true" data-refresh="true">Delete all board cookies</a></li>
</ul>
</div>
</div>

</div>
</div>
</div>


<div id="copyright">
<div class="container">
<p>Copyright by Yinz, 2019 &copy; <a class="wbtn" href="/">Nakjila.com</a>. All Rights Reserved. </p>
</div>
</div>


<div class="back-to-top">
<button><i class="fa fa-angle-up"></i></button>
</div>

</div>

<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo $layout_name; ?>/js/core.js"></script>
<script type="text/javascript" src="<?php echo $layout_name; ?>/js/forum_fn.js"></script>
<script type="text/javascript" src="<?php echo $layout_name; ?>/js/ajax.js"></script>
<script type="text/javascript" src="<?php echo $layout_name; ?>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jparticle.jquery.min.js"></script>
<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jquery.sticky.min.js"></script>
<script type="text/javascript" src="<?php echo $layout_name; ?>/js/main.js"></script>
</body>
</html>
