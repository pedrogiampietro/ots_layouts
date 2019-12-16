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
		<title><?PHP echo $title ?></title>
		
		<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/default.css" type="text/css" />
		<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/cms.css" type="text/css" />
		<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/main.css" type="text/css" />
		<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/news.css" type="text/css" />		
		<link rel="shortcut icon" href="<?php echo $layout_name; ?>/css/images/favicon.gif" />
		
		<!-- Search engine related -->
		<meta name="description" content="Level 255 WoW Private Funserver" />
		<meta name="keywords" content="255, instant 255, funserver, wotlk 255, 3.3.5a, wow private server, wow private servers, custom wow, fun wotlk, fun server," />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
		
		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<!-- Load scripts -->
		<script src="<?php echo $layout_name; ?>/js/html5shiv.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jquery.min.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/router.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/require.js"></script>
		<script type="text/javascript">


			if(!window.console)
			{
				var console = {
				
					log: function()
					{
						// Prevent stupid browsers from doing stupid things
						// *cough* Internet Explorer *cough*
					}
				};
			}

			function getCookie(c_name)
			{
				var i, x, y, ARRcookies = document.cookie.split(";");

				for(i = 0; i < ARRcookies.length;i++)
				{
					x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
					y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
					x = x.replace(/^\s+|\s+$/g,"");
					
					if(x == c_name)
					{
						return unescape(y);
					}
				}
			}

			function setCookie(c_name,value,exdays)
			{
				var exdate = new Date();
				exdate.setDate(exdate.getDate() + exdays);
				var c_value = escape(value) + ((exdays == null) ? "" : "; expires="+exdate.toUTCString());
				document.cookie = c_name + "=" + c_value;
			}

			var Config = {
				URL: "http://thoria.online",			
				image_path: "<?php echo $layout_name; ?>/images/",
				CSRF: getCookie('csrf_cookie_name'),
				language: "english",

				UseFusionTooltip: 1,

				Slider: {
					interval: 50000000,
					effect: "",
					id: "slider_bg"
				},
				
				voteReminder: 0,

				Theme: {
					next: "",
					previous: ""
				}
			};

			var scripts = [
				"<?php echo $layout_name; ?>/js/ui.js",
				"<?php echo $layout_name; ?>/js/fusioneditor.js",
				"<?php echo $layout_name; ?>/js/flux.min.js",
				"<?php echo $layout_name; ?>/js/jquery.placeholder.min.js",
				"<?php echo $layout_name; ?>/js/jquery.sort.js",
				"<?php echo $layout_name; ?>/js/jquery.transit.min.js",
				"<?php echo $layout_name; ?>/js/language.js",
				,"<?php echo $layout_name; ?>/js/ajax.js"			];

			if(typeof JSON == "undefined")
			{
				scripts.push("<?php echo $layout_name; ?>/js/json2.js");
			}

			require(scripts, function()
			{
				$(document).ready(function()
				{
											Language.set("null");
					
					UI.initialize();

											Router.loadedCSS.push("<?php echo $layout_name; ?>/css/news.css");
					
											Router.loadedJS.push("<?php echo $layout_name; ?>/js/ajax.js");
									});
			});
		</script>

				<script type="text/javascript">
		// Google Analytics
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-109814174-1']);
		_gaq.push(['_trackPageview']);

		(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();

		</script>
		
	</head>
	<body>

		<section id="wrapper">
			<div id="popup_bg"></div>

<!-- confirm box -->
<div id="confirm" class="popup">
	<h1 class="popup_question" id="confirm_question"></h1>

	<div class="popup_links">
		<a href="javascript:void(0)" class="popup_button" id="confirm_button"></a>
		<a href="javascript:void(0)" class="popup_hide" id="confirm_hide" onClick="UI.hidePopup()">
			Cancel
		</a>
		<div style="clear:both;"></div>
	</div>
</div>

<!-- alert box -->
<div id="alert" class="popup">
	<h1 class="popup_message" id="alert_message"></h1>

	<div class="popup_links">
		<a href="javascript:void(0)" class="popup_button" id="alert_button">Okay</a>
		<div style="clear:both;"></div>
	</div>
</div>

			<ul id="top_menu">
			
			
			
			
			
									<li><a href="http://thoria.online/?view=news" direct="1">Home</a></li>
					
									<li><a href="?view=register" direct="0">Register</a></li>
					
									<li><a href="?view=highscores" direct="1">Highscores</a></li>
					
									<li><a href="?view=forum" direct="1">Forum</a></li>
					
									<li><a href="?view=purchasecoins" direct="0">Donate</a></li>
					
							</ul>
			<div id="main">
			
		
				<aside id="left">
						
					<article>
						<h1 class="top">Navigation</h1>
						
						
						
						<ul id="left_menu">
															<li><a href="?view=news" direct="0"><img src="<?php echo $layout_name; ?>/images/bullet.png">News</a></li>
													</ul>
					</article>
						
											<article>
							<h1 class="top">User Control Panel</h1>
							<section class="body">
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
											<center>
											<div class="form-group">
												<button type="submit" class="btn btn-primary">Sign in</button>
											</div>
											</center>
										</form>
									</div>
<?php
    }
?>
         
							</section>
						</article>
			
						
											<article>
							<h1 class="top">Informations</h1>
							<section class="body">
							<table class="table table-condensed table-content table-striped">
																<tbody>
																	<tr>
																		<td><b>IP:</b></td><td><?php echo 'thoria.online' . $config['server']['ipSite'] . ''; ?></td>
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
															<center><a style="margin-top: 10px;" href="https://www.mediafire.com/file/262rbr4jrt9jrg5/Thoria+Client.rar" target="_blank" class="btn btn-success form-control">Download Thoria Client 10.00</a></center>
							</section>
							</article>
							
														<article>
							<h1 class="top">Top 5 Level</h1>
							<section class="body">
							<table class="table table-condensed table-content table-striped">
																<tbody>
																	<?php echo $topData; ?>
																</tbody>
															</table>

		
							</article>
			
	
			
							
						
									</aside>

				<aside id="right">
					<section id="slider_bg" >
						<div id="slider">
							<div id="slider_frame">
							<img src="<?php echo $layout_name; ?>/images/1.jpg" title=""/></a>
		
							</div>
						</div>

					</section>

					<div id="content_ajax">
	<article>
		
						
				<?php if ($view == '' || $view == 'news') { ?>
						<?php } ?>

				<?PHP echo $main_content; ?>
				<section class="body">
			
				</section>
	</article>


<div class="text-center"><ul class="pagination">';
</ul></div>
</div>
				</aside>

				<div class="clear"></div>
			</div>
			<footer>
				 <center>
				 <br>
				 Copyrights 2019, Yinz. All rights reserved.
				 <br>
				 <a href="http://thoria.online/page/termsofservice" target="_blank">Terms of Service</a> &nbsp;&nbsp; | &nbsp;&nbsp; <a href="http://thoria.online/page/refundpolicy" target="_blank">Refund Policy</a>   </p></center>
			</footer>
		</section>
	</body>
</html>
