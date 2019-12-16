<?php
if(!defined('INITIALIZED'))
	exit;

$playersOnline = $config['status']['serverStatus_players'];

$cacheSec = 30;
$cacheFile = 'cache/topplayers.tmp';
if (file_exists($cacheFile) && filemtime($cacheFile) > (time() - $cacheSec)) {
	$topData = file_get_contents($cacheFile);
} else {
	$topData = '';
	$i = 0;
	foreach($SQL->query("SELECT `name`, `level` FROM `players` WHERE `group_id` <= 2 AND `account_id` != 1 ORDER BY `level` DESC LIMIT 5")->fetchAll() as $player) {
		$i++;
		$topData .= '<tr><td style="width: 80%"><strong>'.$i.'.</strong> <a href="?view=characters&name='.urlencode($player['name']).'">'.$player['name'].'</a></td><td><span style="padding: 6px;" class="label label-primary label-sm">Level '.$player['level'].'</span></td></tr>';
	}

	file_put_contents($cacheFile, $topData);
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app>
<head>
	<title><?PHP echo $title ?></title>
	<script src="http://static.tumblr.com/8l2gpxb/Apwlulgho/snowstorm2.js"></script>
	<meta charset="utf-8">
	<meta http-equiv="content-language" content="en">
	<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
	<meta name="description" content="Tibia is a free massively multiplayer online role-playing game (MMORPG)">
	<meta name="keywords" content="free online rpg, free mmorpg, mmorpg, mmog, online role playing game, online multiplayer game, internet game, online rpg, rpg">

	<!-- Icons -->
	<link rel="shortcut icon" href="<?php echo $layout_name; ?>/images/favicon.gif" />



<meta property="og:image" content="<?php echo $layout_name; ?>/images/logo.png" />
<link href="/template/lineage/favicon.png" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/style.css?3">
<link rel="stylesheet" href="<?php echo $layout_name; ?>/cssfonts.css">
<link rel="stylesheet" href="<?php echo $layout_name; ?>/cssanimate.css">
<link rel="stylesheet" href="<?php echo $layout_name; ?>/csslightslider.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow&amp;subset=cyrillic">
<link rel="canonical" href="https://thoria.online" />
<link rel="alternate" href="https://thoria.online" hreflang="en" />
<!-- Facebook Pixel Code -->
<script>
!function (f, b, e, v, n, t, s) {  if (f.fbq)return; n = f.fbq = function () {  n.callMethod ? n.callMethod.apply(n, arguments) : n.queue.push(arguments) }; if (!f._fbq)f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0; t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s) }(window, document, 'script', 'https://connect.facebook.net/en_US/fbevents.js'); fbq('init', '1449506471985849', {  em: 'insert_email_variable,' }); fbq('track', 'PageView');
</script><noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=1449506471985849&ev=PageView&noscript=1" /></noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->
<!-- Google Tag Manager -->
<script>
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0], j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src= 'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f); })(window,document,'script','dataLayer','GTM-5LT327');
</script>
<!-- End Google Tag Manager -->
</head>

<body>
<h1><span style="display:none;">Lineage 2 classic</span></h1>
<!-- Google Tag Manager (noscript) --><noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5LT327" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<div class="topbar wow slideInDown">
<div class="main-width clear">
<div class="user-panel"><a href="?view=account">  Log in  </a>
<div class="sep"></div> <a href="?view=register">Registration</a> </div>
<div class="nav">
<a class="nav-resize"></a>
<ul>
<li><a href="?view=news">News<span></span></a></li>
<li><a href="?view=forum" target="_blank">Forums<span></span></a>
</li>
<li><a href="?view=characters">Characters<span></span></a></li>
<li><a href="?view=highscores"><font color="yellow">Highscores</font><span></span></a></li>
<li><a href="?view=guilds">Guilds<span></span></a></li>
<li><a href="?view=houses">Houses<span></span></a></li>
<li><a href="?view=wars"><font color="red">Wars</font><span></span></a></li>
<li><a href="?view=support">Support<span></span></a></li>
<li><a href="?view=purchasecoins"><font color="green">Donate</font><span></span></a></li>
<li><a href="?view=info">Informations<div class="ico-stream"></div><span></span></a></li>
</ul>
</div>
</div>
</div>
<div class="header">
<div class="slider">
<div class="list">
<div class="item active" style="background: url(../<?php echo $layout_name; ?>/images/slide4.jpg) no-repeat center;">
<div class="main-width">
<div class="caption">
<div class="heading">why do envious men attack?</div>
<div class="sep"></div>
<div class="desc">-<br></div>
</div>
</div>
</div>
<div class="item" style="background: url(../<?php echo $layout_name; ?>/images/slide2b.jpg) no-repeat center;">
<div class="main-width">
<div class="caption">
<div class="heading">Ready for Saviors?</div>
<div class="sep"></div>
<div class="desc">-</div>
</div>
</div>
</div>
<!--div class="item" style="background: url(../<?php echo $layout_name; ?>/images/slide1.jpg) no-repeat center;"><div class="main-width"><div class="caption"><div class="heading">L2 Classic Insolence 4x</div><div class="sep"></div><div class="desc">January 26 21:00 (UTC +2)<br>Life start with Classic 1.5<br>with Updates for 2.0 and so on</div></div></div></div---></div>
<div class="main-width">
<div class="bullets">
<a class="bullet active"></a>
<a class="bullet"></a>
<a class="bullet"></a>
</div>
<a class="prev"></a>
<a class="next"></a>
</div>
</div>
<div class="register-form">
<a href="?view=register" class="btn-register"></a>
</div>
</div>
<div class="all-content">
<div class="main-width clear">
<div class="content wow fadeInLeft">
<div class="important-news">

<?php if ($subtopic == '' || $subtopic == 'news') { ?>

<?php } ?>

<?PHP echo $main_content; ?>
</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



</div>
<div class="sidebar wow fadeInRight">
<div class="block">
<div class="block-title">Marketing</div>
<div class="gifts">
<a class="prev"></a>
<div class="list">
<div class="js-listener">
<a href="/cabinet/shop" class="item" title="Envy Market">
<div class="image"><img src="../<?php echo $layout_name; ?>/images/market/Demon_Armor.gif" alt="Usual Treasure"></div>
<div class="caption">
<div class="num">10$</div>
<div class="name">Demon Armor</div>
<div class="sep"></div>
<div class="btn-buy">Buy now</div>
</div>
</a>
<a href="/cabinet/shop" class="item" title="Envy Market">
<div class="image"><img src="../<?php echo $layout_name; ?>/images/market/Golden_Legs.gif" alt="Rare Treasure"></div>
<div class="caption">
<div class="num">10$</div>
<div class="name">Golden Legs</div>
<div class="sep"></div>
<div class="btn-buy">Buy now</div>
</div>
</a>
<a href="/cabinet/shop" class="item" title="Envy Market">
<div class="image"><img src="../<?php echo $layout_name; ?>/images/market/Demon_Helmet.gif" alt="Unique Treasure"></div>
<div
class="caption">
<div class="num">10$</div>
<div class="name">Demon Helmet</div>
<div class="sep"></div>
<div class="btn-buy">Buy now</div>
</div>
</a>
</div>
</div>
<a class="next"></a>
</div>
</div>
<div class="block">


<div class="select-content">
<div class="select-item active" data-type="server0">
<div class="block-sub-title">Download files and start the game</div>
<div class="files">
<a href="#" onclick="anichange('#clientdivId0'); return false" class="link">
<div class="ico"></div>
<div class="info">
<div class="heading">Download</div>
<div class="desc">client</div>
</div>
</a><br>
<div id="clientdivId0" style="display: none"> <a href="#" class="btn">MediaFire</a><br> <a href="#"
class="btn">Direct Link</a><br> </div><br>
<a href="#" onclick="anichange('#patchdivId0'); return false" class="link">
<div class="ico"></div>
<div class="info">
<div class="heading">Download</div>
<div class="desc">Magebot</div>
</div>
</a><br>
<div id="patchdivId0" style="display: none"> <a href="#" class="btn">MediaFire</a><br> <a href="#"
class="btn">Direct Link</a><br> </div><br>
<br>
<br> 
	</div>
</div>


</div>
</div>
<div class="block">
<div class="block-title">Servers Info</div>
<div class="short-info clear">
<table class="table table-sm">
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

<div class="stat">
<center><div class="page-title">Servers Statistic
</div>

<div class="tabs">  <a data-server="194" class="tab active">Envy-Online</a>  
</div>

<div class="sub-tabs"><a data-type="top_guilds" class="sub-tab">Top Guilds</a><a data-type="top_players_kills" class="sub-tab">Top Kills</a><a data-type="top_players_lvl" class="sub-tab">Top LvL</a>
</div>

<div class="container">            
        

<div class="tab-content" data-server="194" data-type="top_players_lvl">
<div class="overview-table">

															<table>
																<tbody>
																	<?php echo $topData; ?>
																</tbody>
															</table>

</div>
</div>    

<div class="tab-content" data-server="194" data-type="top_players_kills">

<div class="overview-table">
<?php
		$zap = $SQL->query('SELECT `name`,`level` FROM `players` WHERE `group_id` < '.$config['site']['players_group_id_block'].' AND `name` != "Account Manager" ORDER BY `level` DESC, `experience` DESC LIMIT 5;');
		$frags_database = $SQL->query('SELECT `p`.`name` AS `name`, COUNT(`p`.`name`) as `frags` FROM `killers` k LEFT JOIN `player_killers` pk ON `k`.`id` = `pk`.`kill_id` LEFT JOIN `players` p ON `pk`.`player_id` = `p`.`id` WHERE `k`.`unjustified` = 1 AND `k`.`final_hit` = 1 GROUP BY `name` ORDER BY `frags` DESC, `name` ASC LIMIT 0,30;');
		$number_of_rows1 = 0; 
		foreach($frags_database as $frag) 
		{
			$number_of_rows1++;
			echo '<div align="left"> <a href="?view='.urlencode($frag['name']).'" class="topfont"> <b>
			<font color="black">&nbsp;&nbsp;&nbsp;&nbsp; '.$number_of_rows1.' - </font></b>'.htmlspecialchars($frag['name']).' <br/><small><b>
			<font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Frags: '.$frag['frags'].' </font></b></small><br/></a></div>'; 
		} 
		?>

</div>
</div>    

<div class="tab-content" data-server="194" data-type="top_guilds">

<div class="overview-table">

<table class="table table-condensed table-content table-striped">
										<tbody>
											<?php
											$guildsPower = $SQL->query('SELECT `g`.`id` AS `id`, `g`.`name` AS `name`, COUNT(`g`.`name`) as `frags` FROM `players` p LEFT JOIN `player_deaths` pd ON `pd`.`killed_by` = `p`.`name` LEFT JOIN `guild_membership` gm ON `p`.`id` = `gm`.`player_id` LEFT JOIN `guilds` g ON `gm`.`guild_id` = `g`.`id` WHERE `pd`.`unjustified` = 1 GROUP BY `name` ORDER BY `frags` DESC, `name` ASC LIMIT 0, 4')->fetchAll();
											$i = 0;
											foreach($guildsPower as $guild) {
												echo '
												<tr><td>' . ++$i . '.</td><td><a href="?view=guilds&action=show&guild=' . $guild['id'] . '"><img src="guild_image.php?id=' . $guild['id'] . '" width="16" height="16" border="0"/> ' . $guild['name'] . '</a>&nbsp;<td><span class="label label-danger pull-right">' . $guild['frags'] . ' kills</td></span></td></tr>';
											}
											?>
										</tbody>
									</table>


</div>
</div>                
</div>
</center>
</div>


</div>
</div>
</div>
</div>
<div class="footer">
<div class="main-width clear">
<div class="content">
<ul class="fnav">
<li><a href="/">News</a></li>
<li><a href="/support">Info</a></li>
<li><a href="#" target="_blank">Forums</a></li>
<li><a href="/rules">Rules</a></li>
</ul>
</div>
</div>
</div>
<div class="fixed-panel">
<div class="fixed-button" data-cookie="elem1"><a href="https://www.facebook.com/L2dex/" class="link" target="_blank">Follow us!</a>
<div class="toggle"><span><img src="../<?php echo $layout_name; ?>/images/ico-fb.png" alt="fb"></span></div>
</div>
<!--div class="fixed-button watch" data-cookie="elem2"><a href="http://www.twitch.tv/sharky2xyz" class="link" target="_blank">watch us!</a><div class="toggle purple"><span><img src="../<?php echo $layout_name; ?>/images/ico-twitch.png" alt="twitch"></span></div></div-->
<div class="fixed-button discord" data-cookie="elem3"><a href="https://discord.gg/KBUjJFx" class="link" target="_blank">Online!</a>
<div class="toggle purple"><span><img src="../<?php echo $layout_name; ?>/images/ico-discord.png?1" alt="discord"></span></div>
</div>
<!--div class="fixed-server" data-cookie="elem4"><div class="h-text">server status</div><div class="h-content"><div class="desc">open<br>7.11.2015</div><div class="line"><div class="load" style="height: 50%;"></div></div><div class="name">High<br>five x25</div><div class="online">11658</div></div><div class="toggle"></div></div-->
<div class="fixed-server active" data-cookie="elem194">
<div class="h-text">Players Online?</div>
<div class="h-content">
<div class="desc">online</div>
<div class="line">
<div class="load" style="height: 100%;"></div>
</div>
<div class="name">Envy</div>
<td><a href="?view=online"><?PHP echo $playersOnline; ?> player<?php echo ($playersOnline != 1 ? 's' : ''); ?> online</a></td><td></td>
</div>
<div class="toggle"></div>
</div>
</div>
<script src="<?php echo $layout_name; ?>/js/jquery-3.2.1.min.js"></script>
<script src="<?php echo $layout_name; ?>/js/lightslider.min.js"></script>
<script src="<?php echo $layout_name; ?>/js/jquery.cookie.js"></script>
<script src="<?php echo $layout_name; ?>/js/notiJ.js"></script>
<script src="<?php echo $layout_name; ?>/js/wow.min.js"></script>
<script src="<?php echo $layout_name; ?>/js/scripts.js?23"></script>
<script>
function anichange (objName) {  if ( $(objName).css('display') == 'none' ) {  $(objName).animate({ height: 'show'}, 400); } else {  $(objName).animate({ height: 'hide'}, 200); } }
</script>
</body>

</html>