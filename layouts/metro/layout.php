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


<html class="no-js" lang="">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Telara - News</title>
	<meta name="description" content="">

	<link rel="shortcut icon" href="<?php echo $layout_name; ?>/images/favicon.gif" />

	<!-- CSS -->

	<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/slick.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/slick-theme.css" />
	<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/main.css">

	<!-- End CSS -->

	<!-- JS Scripts -->

	<script src="<?php echo $layout_name; ?>/js/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	<script src="<?php echo $layout_name; ?>/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src='https://www.google.com/recaptcha/api.js'></script>
	
	<!-- End JS -->
	
</head>
<body>
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-67686388-1', 'auto');
		ga('require', 'linkid');
		ga('send', 'pageview');

	</script>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->


<div class="status-bar notranslate">
	<div class="container">
		<div class="item">
		

																	<tr>
																	</tr>
																	<td><a href="?view=online"><?PHP echo $playersOnline; ?>  <?php echo ($playersOnline != 1 ? '' : ''); ?> <?php
																			if($config['status']['serverStatus_online'] == 1)
																				echo '<span class="label label-success label-sm">Online</span>';
																			else
																				echo '<span class="label label-danger label-sm">Offline</span>';
																			?></a></td><td></td>
																	

				

			</div>
			<div class="item">
				ip:<span class="value">telara-ats.com</span>
			</div>
			<div class="item">
				version:<span class="value">10.00-11.48</span>
			</div>
			<div class="item">
				port:<span class="value">7171</span>
			</div>
			<div class="item">
				<a href="http://www.mediafire.com/file/9evtitcsvw36v9s/TelariaClient.rar" class="value">Download Client</a>
			</div>
			<div class="item pull-right" style="border-right:1px solid #4a8cb2;">
				<div id="google_translate_element"></div><script type="text/javascript">
					function googleTranslateElementInit() {
						new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'es,pl,pt', layout: google.translate.TranslateElement.FloatPosition.TOP_LEFT, gaTrack: true, gaId: 'UA-67686388-1'}, 'google_translate_element');
					}
				</script>
				<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
			</div>
		</div>
	</div>
	<div class="container">
		<a href="/" class="logo"></a>
	</div>
	<div class="menu container">
	<nav class="navbar navbar-default" style="margin-bottom: 0px;">
	
		
			<div class="notranslate" id="">
				<ul class="nav navbar-nav">

					<li><a href="?view=news">Home</a></li>
					<li><a href="?view=forum">Forum</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="?view=account">Manage account</a></li>
							<li><a href="?view=register">Create account</a></li>
							<li><a href="?view=lostaccount">Account lost?</a></li>
							<li><a href="?view=downloads">Download Client</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Community <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="?view=characters">Search character</a></li>
							<li><a href="?view=highscores">Highscores</a></li>
							<li><a href="?view=casts"><font color="green">Live Casts</font></a></li>
							<li><a href="?view=online">Who is online?</a></li>
							<li><a href="?view=lastdeaths">Latest Deaths</a></li>
							<li><a href="?view=guilds">Guilds</a></li>
							<li><a href="?view=wars"><font color="red">Guild Wars</font></a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Library <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="?view=crowntoken">Crown Token</a></li>
							<li><a href="?view=tasksystem"><font color="green">Tasks</font></a></li>
							<li><a href="?view=houses">Houses</a></li>
							<li><a href="?view=commands"><font color="orange">Commands</font></a></li>
							<li><a href="?view=info"><font color="orange">Server info</font></a></li>
							<li><a href="?view=autoloot">Auto Loot</a></li>
							<li><a href="?view=support">Support List</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Shop <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="?view=donate">Donate</a></li>
							<li><a href="?view=shop">Shop List</a></li>
						</ul>
					</li>
				</ul>
                        <form method="post" class="navbar-form navbar-right" style="margin-right:0;" action="?view=characters">
                <input type="hidden" name="_token" value="4t0VL0Zh7MkvcOHZQ9gaXXma40r7FchIV9fhbjWP">
                <div class="form-group">
                    <input type="text" name="name" placeholder="Search Character" class="form-control" onfocus="this.value=''" onblur="if(this.value=='') { this.value='Find player...'};">
                </div>
                <input type="submit" name="Submit" class="btn btn-primary btn-sm" value="Search">
            </form>
			</div>
		</nav>
		
	</div>
	<div class="content">
		<div class="container">
			<div class="content-wrapper">
				<div class="corner-top-left"></div>
				<div class="corner-top-right"></div>
				<div class="col-xs-8 main-content">


				<div class="news">
					<div class="clearfix"></div>
					<?php if ($view == '' || $view == 'news') { ?>
					<?php } ?>

					<?PHP echo $main_content; ?>

					<?PHP $time_end = microtime_float(); $time = $time_end - $time_start; ?>
					

					<div class="clearfix"></div>
				</div>

			</div>
			
			
			<div class="col-xs-4 right-panel notranslate">
				<div class="box teamspeak">
					<div class="head">Account</div>
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
             
                </button>
						<div class="tab-pane active" id="login">
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
										<a href="?view=register" class="btn btn-success btn-block">Register new Account</a>
									</div>
<?php
    }
?>
         
					</div>



					<div class="box informations">
						<div class="head">Informations</div>
						<div class="box-content">
							<div class="item">
								<div class="wrap">
									<div class="left"></div>
									<div class="centered">
										<table class="table table-condensed table-content table-striped">
											<tbody>
												<tr>
													<td><b>IP:</b></td><td><?php echo 'Telara.net' . $config['server']['ipSite'] . ''; ?></td>
												</tr>
												<tr>
													<td><b>Experience:</b></td> <td><a href="?view=info">Stages</a></td>
												</tr>
												<tr>
													<td><b>Client:</b></td><td>10.00</td>
												</tr>
												<tr style="border-bottom:1px solid #eeeeee;">
													<td><b>Type:</b></td> <td>Retro Open PvP</td>
												</tr>
											</tbody>
										</table>
										<a style="margin-top: 10px;" href="#" target="_blank" class="btn btn-info form-control">Download Telara Client 10.00</a>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>


					<div class="box">
						<div class="head">Stats</div>
						<div class="box-content">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#toplevel">Top Level</a></li>
								<li><a data-toggle="tab" href="#topguilds">Top Guilds</a></li>
								<li><a data-toggle="tab" href="#topfrag">Top Frag</a></li>
							</ul>

							<div class="tab-content">
								<div id="toplevel" class="tab-pane fade in active">
									<table class="table table-condensed table-content table-striped">
										<tbody>
											<?php echo $topData; ?>
										</tbody>
									</table>
								</div>
								<div id="topguilds" class="tab-pane fade">
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
								<div id="topfrag" class="tab-pane fade">
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

						</div>
					</div>


					<div class="box latest-posts">
						<div class="head">Latest posts</div>
						<div class="box-content">

<div align="left" style="padding-left:20px;">
<?PHP 
$order = 0; 
$post = $SQL->query('SELECT id,post_topic,post_date,author_guid FROM z_forum ORDER BY last_post DESC LIMIT 10'); 
foreach($post as $posts) { 
$info = new Player();
$info->load($posts['author_guid']);    
$last_posts .= '
    <tr>
        <td align="center">
            '.$order.'.
        </td>
        <td align="left">
            <B><a href="?view=forum&action=show_thread&id='.urlencode($posts['id']).'">'.$posts['post_topic'].'</a>
        </td>
        <td align="center">
            <font color="##333"><em>'.$info->getName().'</em></font>
        </td>
        <td align="center">
            <font color="##333"></font><br>
        </td>
    </tr>'; 
    $order++; 
} 
echo "$last_posts"; 
?>
</div>

			<script>
				$(document).ready(function(){
					$(".dropdown-toggle").dropdown();
				});
			</script>
			
			<script>
			// toggle masked texts with readable texts
function ToggleMaskedText(a_TextFieldID)
{
  m_DisplayedText = document.getElementById('Display' + a_TextFieldID).innerHTML;
  m_MaskedText = document.getElementById('Masked' + a_TextFieldID).innerHTML;
  m_ReadableText = document.getElementById('Readable' + a_TextFieldID).innerHTML;
  if (m_DisplayedText == m_MaskedText) {
    document.getElementById('Display' + a_TextFieldID).innerHTML = document.getElementById('Readable' + a_TextFieldID).innerHTML;
    document.getElementById('Button' + a_TextFieldID).src =  JS_DIR_IMAGES + '/global/general/hide.gif';
  } else {
    document.getElementById('Display' + a_TextFieldID).innerHTML = document.getElementById('Masked' + a_TextFieldID).innerHTML;
    document.getElementById('Button' + a_TextFieldID).src =  JS_DIR_IMAGES + '/global/general/show.gif';
  }
}
</script>
												</div>
											</div>

										</div>
										<div class="clearfix"></div>
										<div class="centered small">Loaded in 0.0154 seconds.<br>
											- Yinz
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
						</body>
						</html>
