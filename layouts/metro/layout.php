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
    <html lang="gb" class="gb webkit chrome   win  js landscape pc">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><?php echo $title ?></title>
        <link rel="shortcut icon" href="<?php echo $layout_name; ?>/images/fav.ico">

        <!-- Responsive meta tag -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Search engine related -->
        <meta name="keywords" content="">
        <meta name="description" content="">

        <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<!-- Load styles -->
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/cms.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/custom.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/default.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/icheck.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/loginbox.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/main.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/news.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/selectbox.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/shadowbox.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/theme.css">

        <!-- Load scripts -->
        <script type="text/javascript">
            var isIE = false;
        </script>
        <!--[if IE]><script type="text/javascript">isIE = true;</script><![endif]-->
        <script type="text/javascript" src="<?php echo $layout_name; ?>/js/ajax.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/flux.min.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/fusioneditor.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/html5shiv.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jquery.min.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jquery.placeholder.min.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jquery.sort.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/jquery.transit.min.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/json2.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/language.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/require.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/router.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/ui.js"></script>
		<script type="text/javascript" src="<?php echo $layout_name; ?>/js/bootstrap.min.js"></script>

	
        
		<script type="text/javascript">
		
		if(!window.console)
				var console = { log: function() {} };
			
			function getCookie(c_name)
			{
				var i, x, y, ARRcookies = document.cookie.split(";");
				for(i = 0; i < ARRcookies.length;i++)
				{
					x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
					y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
					x = x.replace(/^\s+|\s+$/g,"");
					if(x == c_name)
						return unescape(y);
				}
			}


            var Config = {
                URL: "http://localhost",
                image_path: "http://localhost/layouts/metro/images/",
                CSRF: getCookie('csrf_cookie_name'),
                language: "english",

                UseFusionTooltip: 1,

                Slider: {
                    interval: 5000,
                    effect: "",
                    id: "slider_container"
                },

                voteReminder: 0,

                Theme: {
                    next: "",
                    previous: ""
                }
            };

            var scripts = [
                "https://aldora.net/layouts/metro/js/slide.js"
            ];

            require(scripts, function() {
                $(document).ready(function() {
                    Language.set("null");
                    UI.initialize();

                    Router.loadedCSS.push("modules/news/css/news.css");
                    Router.loadedJS.push("modules/news/js/ajax.js");
                });
            });
        </script>
		
		<script>
				$(document).ready(function(){
					$(".dropdown-toggle").dropdown();
				});
			</script>
	

    </head>

    <body oncontextmenu="return true" onmousedown="event.which == 3" style="" cz-shortcut-listen="true">
        <div id="tooltip"></div>
        <div id="popup_bg"></div>

        <!-- confirm box -->
        <div id="confirm" class="popup vertical_center">
            <h1 id="confirm_question" class="popup_question"></h1>

            <div class="popup_links self_clear">
                <a href="javascript:void(0)" id="confirm_button" class="nice_button green_btn"></a>
                <a href="javascript:void(0)" id="confirm_hide" class="nice_button" onclick="UI.hidePopup()">Cancel</a>
            </div>
        </div>

        <!-- alert box -->
        <div id="alert" class="popup vertical_center">
            <h1 id="alert_message" class="popup_message"></h1>

            <div class="popup_links self_clear">
                <a href="javascript:void(0)" id="alert_button" class="nice_button">Okay</a>
            </div>
        </div>

        <!-- Header -->
        <header id="header" class="header self_clear">
            <div class="holder">
                <!-- Navigation -->
                <ul class="navigation border_box">
                    <li id="w-home">
                        <a href="?view=news" data-hasevent="1"></a>
                    </li>
                    <li id="w-guide">
                        <div class="dropdown-holder" style="left: -62.5px;">
                            <ul class="navi-dropdown">
                                <li><a href="?view=" data-hasevent="1">Lost Account?</a></li>
                                <li><a href="?view=rules" data-hasevent="1">Server Rules</a></li>
                            </ul>
                        </div>
                    </li>
                    <li id="w-server">
                        <a href="?view=highscores" data-hasevent="1"></a>
                    </li>
                    <li id="w-features">
                        <div class="dropdown-holder" style="left: -56.5px;">
                            <ul class="navi-dropdown">
                                <li><a href="?view=characters" data-hasevent="1">Characters</a></li>
                                <li><a href="?view=online" data-hasevent="1">Who is Online?</a></li>
                                <li><a href="?view=deaths" data-hasevent="1">Latest Deaths</a></li>
                                <li><a href="?view=guilds" data-hasevent="1">Guilds</a></li>
                                <li><a href="?view=war" data-hasevent="1">Wars</a></li>
								<li><a href="?view=houses" data-hasevent="1">Houses</a></li>
                            </ul>
                        </div>
                    </li>
                    <li id="w-forums">
                        <a href="?view=info" data-hasevent="1"></a>
						     <div class="dropdown-holder" style="left: -56.5px;">
                            <ul class="navi-dropdown">
                                <li><a href="?view=library" data-hasevent="1">Library</a></li>
								<li><a href="?view=info" data-hasevent="1">Serverinfo</a></li>
								<li><a href="?view=spells" data-hasevent="1">Spells</a></li>
								<li><a href="?view=tasks" data-hasevent="1">Tasks</a></li>
                            </ul>
                        </div>
                    </li>
					
                    <li id="w-armory">
                        <a href="?view=forum" data-hasevent="1"></a>
                    </li>

                </ul>
                <!-- Navigation.End -->

				<!-- Membership bar -->
				
				 <?php
                    if($logged) {
                ?>							
				
				
				<div class="membership-bar anti_blur">
				<div class="membership-holder logged_in border_box">
                
													<!-- Logged in -->
							<span>Welcome back, <i><?PHP echo $account_logged->getName(); ?></i>!</span>
							<ul>
								<li><a href="?view=account" data-hasevent="1">Account panel</a></li>
								<li><a href="?view=purchasecoins" class="vote-effect" data-hasevent="1">Coins</a></li>
								<li><a href="?view=account&action=logout" class="logout" data-hasevent="1">Logout</a></li>
							</ul>
											</div>
                                            </div>
                                            
               							
								
                <?php
                    }
                    else
                    {
                ?>
				
                
				<div class="membership-bar anti_blur">
					<div class="membership-holder not_logged border_box">
													<!-- not logged -->
							<a href="#" id="home_login" onclick="toggleLogin(event, this)">Sign in</a>
							<a href="?view=register" id="home_register">Register</a>
											</div>
											
				</div>
				
				<?php
    }
?>

				<!-- Membership bar.End -->
				
						<script type="text/javascript">
							function toggleLogin(event, element) {
					if(typeof CustomJS !== 'undefined')
						CustomJS.toggleLogin(event, element);
					else
						document.location.replace('login');
				};
						
			if(typeof CustomJS !== 'undefined')
				CustomJS.initialize();
			
			if(typeof Shadowbox !== 'undefined')
				Shadowbox.init();
		</script>

                <!-- Logo -->
                <h1 class="logo_holder"><a href="http://aldora.net" class="logo" title="Welcome to Aldora" data-hasevent="1"><img src="<?php echo $layout_name; ?>/images/logo.png" width="667" height="183" alt="Aldora Logo"><span>Welcome to Aldora</span></a></h1>
                <!-- Logo.End -->
            </div>
        </header>
        <!-- Header.End -->

        <!-- Body -->
        <div class="main_b_holder">
            <div class="sec_b_holder">
                <div class="body_content self_clear">
                    <!-- Body Content start here -->

                    <!-- Main side -->
                    <aside id="right">
   
                        <div id="content_ajax">

							<?php if ($subtopic == '' || $subtopic == 'news') { ?>

					<?php } ?>

					<?PHP echo $main_content; ?>
							
                            
                        </div>
                    </aside>
                    <!-- Main side.End -->

                    <!-- Sidebar -->
                    <aside id="left">
                        <!-- Banner -->
                        <div class="sidebar_banner seperator">
                            <a href="#" class="banner" data-hasevent="1"><span class="text">Download</span></a>
                        </div>
                        <!-- Banner.End -->

                        <!-- Discord -->
                        <div class="sidebar_banner seperator">
                            <a href="#" id="discord_banner"></a>
                        </div>
                        <!-- Discord.End -->

                        <!-- Social media -->
                        <div class="social_media seperator">
                            <ul>
							<a href="?view=purchasecoins">
							<center><div id="wikiButton" class="Themebox" style="width:180px;height:60px; background-image:url(images/donate.png);"></div></center>
							</a>
                            </ul>
                        </div>
                        <!-- Social media.End -->

                        <section id="sidebox_status" class="sidebox  seperator">
								<h4 class="sidebox_title">Server status</h4>
								<div class="sidebox_body">
								
								<table class="nice_table">
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
							</section>


    		<section id="sidebox_visitors" class="sidebox  seperator">
								<h4 class="sidebox_title">Top 5 Level</h4>
								<div class="sidebox_body">
								
						<table class="nice_table">
							<tbody>
								<?php echo $topData; ?>
							</tbody>
						</table>
								
							</div>
							</section>
                    </aside>
                    <!-- Sidebar.End -->

                    <!-- Body Content ends here -->
                </div>
            </div>
        </div>
        <!-- Body.End -->

        <!-- Footer -->
        <footer id="footer" class="footer self_clear">
            <div class="holder border_box">
                <div class="left_side">
                    All rights reserved ® <strong>Aldora</strong> Old School Tibia Server.
                    <br> The website and its content was created for <i>Aldora</i>
                    <br>
                </div>

                <div class="right_side">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Changelog</a></li>
                        <li><a href="#">Forums</a></li>
                        <li><a href="#">Armory</a></li>
                    </ul>

                    <ul>
                        <li><a href="#">References</a></li>
                        <li><a href="#">Rules</a></li>
                        <li><a href="#">Terms of Use</a></li>
                        <li><a href="#">How To</a></li>
                    </ul>

                    <ul>
                        <li><a href="#">Wallpapers</a></li>
                        <li><a href="#">Videos</a></li>
                        <li><a href="#">Screenshots</a></li>
                    </ul>
                </div>
            </div>
        </footer>
        <!-- Footer.End -->

		
				<!-- Login Form -->
			<div id="login-box-container">
				<div class="login-box-inner">
					<div class="login-box vertical_center">
				<form class="form-horizontal" role="form" action="?view=account" method="post">
					

						<div class="form-group">
							<label for="account_login" class="col-lg-2 control-label">Account Name</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="account_login" name="account_login" placeholder="" maxlength="30" required>
							</div>
						</div>

						<div class="form-group">
							<label for="password_login" class="col-lg-2 control-label">Password</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="password_login" name="password_login" placeholder="" maxlength="50" required>
							</div>
						</div>
						<br>

						
													<div class="row self_clear login-btn">
								<button type="submit" class="nice_button">Submit</button>
								
								<div class="login-box-options">
									<a href="?view=accountlost">Forgot your password?</a>
									<span>Don't have an account yet? <a href="?view=register">Register Now!</a></span>
								</div>
							</div>

				
				</form>
					</div>
					
					<a href="#" class="close_btn" onclick="CustomJS.toggleLogin(event, this)"></a>
				</div>
			</div>
			<!-- Login Form.End -->
				
		<a href="#header" class="back-to-top border_box anti_blur"></a>
		
		<script type="text/javascript" src="https://aldora.net/layouts/metro/js/seicshfocu.js"></script>

		


	</body>
</html>