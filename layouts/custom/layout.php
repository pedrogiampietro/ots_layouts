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
	<title><?PHP echo $title ?></title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="<title><?PHP echo $title ?></title> is a server with lots of customizations, content and well balanced PvP. There are many new quests to explore, events to play and mighty enemies to take down.">
    <meta name="keywords" content="open server, ot, otserv, otserver, ot server, ot, ot server, real map ot, real map server, rl map server, otservlist, ot server list, ot list, ots list, ot server list, elfbot, download elfbot, otland">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicons -->
    <link rel="icon" type="image/png" sizes="32x32" href="<?php echo $layout_name; ?>/favicon-32x32.png">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="msapplication-TileColor" content="#b91d47">
    <meta name="theme-color" content="#dca426">
    <!-- End Favicons -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <script src="<?php echo $layout_name; ?>/assets/js/timeago/timeago.min.js"></script>
    <script src="<?php echo $layout_name; ?>/assets/js/general.js"></script>
	<script src="https://kit.fontawesome.com/38f230bee4.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Ubuntu:400,700' rel='stylesheet' type='text/css' />
    <script type="text/javascript" src="<?php echo $layout_name; ?>/assets/js/TimeCircles.js"></script>
    <link rel="stylesheet" href="<?php echo $layout_name; ?>/assets/css/TimeCircles.css" />
    <link type="text/css" href="<?php echo $layout_name; ?>/assets/css/style.css" rel="stylesheet" media="screen" />

</head>

<body>

    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">News</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="main-navbar">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-server"></i> Server <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="?view=character">Search character</a></li>
                            <li><a href="?view=online">Online players</a></li>
                            <li><a href="?view=support">Staff</a></li>
                            <li><a href="?view=guilds">Guilds</a></li>
                            <li><a href="?view=faq">FAQ</a></li>
                            <li><a href="?view=rules">Rules</a></li>
                            <li><a href="?view=houses">Houses</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-chart-line"></i> Statistics <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="?view=info">Server info</a></li>
                            <li><a href="?view=highscores">Highscores</a></li>
                            <li><a href="?view=statistics">Latest deaths</a></li>
                            <li><a href="?view=casts">Casts</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-books"></i> Library <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="?view=downloads">Downloads</a></li>
                            <li><a href="?view=forum" target="_blank">Forum</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-tools"></i> Custom <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Addon Bonus</a></li>
                            <li><a href="#">Anti AFK Victims</a></li>
                            <li><a href="#">Monsters</a></li>
                            <li><a href="#">Daily Tasks</a></li>
                            <li><a href="#">Twitch Streamers</a></li>
                            <li><a href="/#">Bounty Hunters</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-gift"></i> Gifts <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="?view=shop">Gifts</a></li>
                            <li><a href="?view=purchasecoins">Get Points</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-info-circle"></i> Guides <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Beginner Guide</a></li>
                            <li><a href="#">Veteran Guide</a></li>
                            <li><a href="#" target="_blank">Wiki</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-right" method="POST" action="?view=characters">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search character..." class="searchCharacterInput" autocomplete="off" name="name" id="charSearch">
                        <span class="input-group-btn">
						<button class="btn btn-default" type="submit"><i class="fa fa-angle-double-right fa-lg"></i>&nbsp;</button>
					</span>
                    </div>
                </form>
            </div>
        </div>
    </nav>

    <script>
        $('.dropdown-toggle').on('click', function() {
            $(this).blur();
        });
    </script>
    <div class="container" id="mainCont">
        <div class="maincont">
            <ol class="breadcrumb">
                <li>
                    <a href="/">Server Name</a>
                </li>
                <li class="active">News </li>
            </ol>



            <script>
                $(document).ready(function() {
                    $("#onlinecount-news").text($("#main-onlinecount").text());
                });
            </script>

            <div class="contbox" style="margin-bottom: 22px;">

				<?php if ($subtopic == '' || $subtopic == 'news') { ?>

					<?php } ?>

				<?PHP echo $main_content; ?>

            </div>
            
            <div class="footer" style="clear:both;">
            <font color="white">Layout coded por Yinz &copy 2019.<br>
			Load time: <?PHP echo round($time, 4); ?> seconds.
			</font>
            </div>
        </div>

        <div class="sidebar">
            <center>
                <h3 style="margin-top: 0;">Server Info</h3></center>
            <table class="table table-hover table-striped table-condensed" style="margin-bottom: 0px;">
                <tr>
                    <td width="width: 42%;">IP</td>
                    <td>localhost</td>
                </tr>
                <tr>
                    <td>Client</td>
                    <td>10x</td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>                    
						 <?php
							if($config['status']['serverStatus_online'] == 1)
								echo '<span class="label label-success pull label-sm">Online</span>';
							else
								echo '<span class="label label-danger pull label-sm">Offline</span>';
						?>
					</td>
                </tr>
                <tr>
                    <td>Players online</td>
                    <td>
                        <div id="main-onlinecount">

						<?PHP echo $playersOnline; ?> player
                        <?php echo ($playersOnline != 1 ? 's' : ''); ?> online</a>

                        </div>
                    </td>
                </tr>

            </table>

            <hr/>

			<?php
                    if($logged) {
                ?>							
				
				<ul class="nav nav-pills nav-stacked acc_menu">
				<li><a href="?view=account"><span class="fas fa-user" style="margin-right: 3px;"></span> My account</a></li>
				<li><a href="?view=guilds"><span class="fas fa-users" style="margin-right: 3px;"></span> My guilds</a></li>
				<li><a href="#"><span class="fas fa-poll" style="margin-right: 3px;"></span> Polls</a></li>
				<li><a href="#"><span class="fas fa-barcode" style="margin-right: 3px;"></span> Redeem code</a></li>
			</ul>
               					
									
								
                <?php
                    }
                    	else
                    {
                ?>

            <h3 class="text-center" style="margin-top: 0;">Login Panel</h3>
            <form id="sidebar-login-form" name="login" action="?view=account" method="post">
                <div class="input-group">
                    <span class="input-group-addon login-icons" id="username" style="width: 10%;"><i class="fas fa-user"></i></span>
                    <input type="text" class="form-control" placeholder="Account name..." aria-describedby="username" name="account_login">
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon login-icons" id="password" style="width: 10%;"><i class="fas fa-key"></i></span>
                    <input type="password" class="form-control" placeholder="Password..." aria-describedby="password" name="password_login">
                </div>
                <br/>
                <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-sign-in fa-sm"></i> Login</button>
            </form>

			<?php
			}
		?>

            <hr/>
            <center>
                <h3 style="margin-top: 0;">Guild Event in</h3>
                <div id="CountDownTimer" data-timer="501717" style="width: 243px; height: 120px;"></div>
            </center>
            <script>
                $("#CountDownTimer").TimeCircles({
                    time: {
                        Days: {
                            show: true
                        },
                        Hours: {
                            show: true
                        },
                        Minutes: {
                            show: false
                        },
                        Seconds: {
                            show: false
                        }
                    }
                });
            </script>

            <hr/>

            <div class="row" style="margin-bottom: 5px;">
                <div>
                    <center>
                        <h3 style="margin-top: 0;">Social</h3>
                        <a href="#" target="_blank"><i id="social-fb" class="fab fa-facebook-square fa-3x social" ></i></a>
                        <a href="#" target="_blank"><i id="social-discord" class="fab fa-discord social" style="font-size: 2.8em;"></i></a>
                        <a href="/cdn-cgi/l/email-protection#0f7c7a7f7f607d7b4f6e7c6c6e7d217a7c"><i id="social-email" class="fas fa-envelope-square fa-3x social" ></i></a>
                    </center>
                </div>
            </div>

            <hr/>

            <center>
                <h3 style="margin-top: 0;">Online <a href="/twitch" target="_blank">Streamers</a></h3></center>

            <table width="100%" class="table table-hover table-striped table-condensed">
                <tr style="font-weight: bold;">
                    <td width="40%">Name</td>
                    <td width="60%">Twitch link</td>
                </tr>

            </table>
        </div>
    </div>

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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js" integrity="sha256-4iQZ6BVL4qNKlQ27TExEhBN1HFPvAvAMbFavKKosSWQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.26/moment-timezone-with-data-10-year-range.min.js" integrity="sha256-v9NySnMpCFzOLCU4I1JxhJQ3YiyCu/UG5XJ9BkZSM0c=" crossorigin="anonymous"></script>
</body>

</html>