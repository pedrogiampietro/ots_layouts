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
        <meta charset="utf-8">
        <meta http-equiv="content-language" content="en">
        <meta name="description" content="Tibia is a free massively multiplayer online role-playing game (MMORPG)">
        <meta name="keywords" content="burmourne, free online rpg, free mmorpg, mmorpg, mmog, online role playing game, online multiplayer game, internet game, online rpg, rpg">
        <title>
            <?PHP echo $title ?>
        </title>

        <script>
            var start_time = new Date().getTime();
        </script>
        <link rel="shortcut icon" type="image/x-icon" href="<?php echo $layout_name; ?>/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/main.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/colorbox.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/nanoscroller.css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

        <script>
            (function(i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function() {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-40861854-1', 'smolderforge.com');
            ga('send', 'pageview');
        </script>
    </head>

    <body class="scroller">

        <div class="scroller-content">

            <div id="stripe"></div>
            <!-- DISABLED BECAUSE IT CAUSES A LOT OF LAG
    <div id="movingbg">
        <div id="fog"></div>
    </div>
    -->
            <div id="site-wrapper">
                <nav id="top">
                    <ul>
                        <a href="?view=news">
                            <li>HOME</li>
                        </a>
                        <li class="menu_sep"></li>
                        <a href="?view=highscores">
                            <li>HIGHSCORES</li>
                        </a>
                        <li class="menu_sep"></li>
                        <a href="?view=forum">
                            <li>FORUM</li>
                        </a>
                        <li class="menu_sep"></li>
                        <a href="?view=purchasecoins">
                            <li>DONATE</li>
                        </a>
                    </ul>
                </nav>

                <div id="content">
                    <div id="content_left_wrapper">

                        <section class="left">
                            <div class="content_title_LEFT">&nbsp;<i class="fa fa-user"></i>&nbsp;&nbsp;Login</div>
							
							<?php
                    if($logged) {
                ?>
				
													<p><h3>Welcome Back!</h3></p>
									<strong>Account Name: <?PHP echo $account_logged->getName(); ?></strong>
									<br>
									<a href="?view=account">Manage account</a>
									<br>
									<br>
                        <a href="?subtopic=accountmanagement&action=logout">
						 <button class="small_button60 block fleft" type="submit" name="login_submit_1" id="login_submit_1"><i class="fa fa-sign-out"></i> LOGOUT</button>
                        </a>
                <?php
                    }
                    else
                    {
                ?>
														
							
                            <form class="form" role="form" action="?view=account" method="post">
                                <ul>
                                    <li>
                                        <span class="capital">ACCOUNT USERNAME</span>
                                        <input type="text" name="account_login" id="login_userinput" style="width:170px" maxlength="16" required />
                                    </li>
                                    <li>
                                        <span class="capital">ACCOUNT PASSWORD</span>
                                        <input type="password" name="password_login" id="login_passinput" style="width:170px" maxlength="16" required />
                                    </li>
                                    <li style="overflow:hidden;padding-top:2px">
                                        <span class="capital">REMEMBER ME</span>
                                        <input type="checkbox" id="checkbox" name="rememberme" value="false" />
                                        <label for="checkbox" class="fright" style="padding-left:16px"></label>
                                    </li>
                                    <li style="overflow:hidden;padding-top:8px">
                                        <button class="small_button60 block fleft" type="submit" name="login_submit_1" id="login_submit_1"><i class="fa fa-sign-in"></i> LOG IN</button>
                                        <div class="fleft loginoptions">
                                            <a href="/site/account/register">Create Account</a>
                                            <br />
                                            <a href="/site/account/recover">Forgot Password</a>
                                        </div>
                                    </li>
                            </form>

<?php
    }
?>

                        </section>
                        <section class="left">
                            <div class="content_title_LEFT">&nbsp;<i class="fa fa-list-ul"></i>&nbsp;&nbsp;Main Menu</div>
                            <nav class="left">
                                <ul>
                                    <li><a href="?view=news">Home</a></li>

                                </ul>
                            </nav>
                        </section>
                    </div>
					
                    <div id="content_right_wrapper">

                        <section class="right">
                            <div class="content_title_RIGHT">&nbsp;<a href="/site/home/onlineplayermap"><i class="fa fa-globe"></i></a> &nbsp;&nbsp;Server Status</div>
                            <div class="statistics">
                                <div class="statistics_title">

                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <td>Status:</td>
                                                <td colspan=1>
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
                                                <td>
                                                    <a href="?view=online">
                                                        <?PHP echo $playersOnline; ?> player
                                                            <?php echo ($playersOnline != 1 ? 's' : ''); ?> online</a>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <div id="tbc_flag"><span class="statistics_online loading"></span></div>
                                </div>
                            </div>
                        </section>

                        <section class="right">
                            <div class="content_title_RIGHT">&nbsp;<i class="fa fa-cogs"></i>&nbsp;&nbsp;Top 5 Level</div>

                            <table id="searchArmoryResults">
                                <tbody>
                                    <?php echo $topData; ?>
                                </tbody>
                            </table>

                        </section>

                        <section class="right">
                            <div class="content_title_RIGHT">&nbsp;<i class="fa fa-cogs"></i>&nbsp;&nbsp;Informations</div>

                            <table>
                                <tbody>
                                    <tr>
                                        <td><b>IP:</b></td>
                                        <td>burmourne.net</td>
                                    </tr>
                                    <tr>
                                        <td><b>Client:</b></td>
                                        <td>10.80-10.82</td>
                                    </tr>
                                    <tr>
                                        <td><b>Type:</b></td>
                                        <td>PvP</td>
                                        </center>
                                    </tr>
                                </tbody>
                            </table>

                        </section>

                        <section id="recent_topics_wrapper" class="right">
                            <div class="content_title_RIGHT">&nbsp;<i class="fa fa-twitter"></i>&nbsp;&nbsp;Twitter Feed
                                <div id="social_networks">
                                    <i class="fa fa-facebook-square sn_facebook" onclick="window.location='#'"></i>
                                    <i class="fa fa-twitter-square sn_twitter" onclick="window.location='#'"></i>
                                </div>
                            </div>

                        </section>
                    </div>
                    <div id="content_center_wrapper">

                        <section class="center">
                            <article>

                                <?php if ($subtopic == '' || $subtopic == 'news') { ?>

                                    <?php } ?>

                                        <?PHP echo $main_content; ?>

                            </article>

                        </section>

                    </div>
                </div>

                <footer>
                    <div id="footer_pages">
                        <a href="?view=news">HOME</a> |
                        <a href="?view=highscores">HIGHSCORES</a> |
                        <a href="?view=purchasecoins">DONATE</a> |
                        <a href="?view=forum">FORUMS</a> |
                        <a href="?view=downloads">DOWNLOADS</a>
                    </div>
                    <p>Yinz&trade; Copyright &copy; 2019. All rights reserved.</p>
                    <p>- <a href="/site/home/tos">Terms of Service</a> -</p>
                </footer>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script src="<?php echo $layout_name; ?>/js/jquery.colorbox.min.js"></script>
        <script src="<?php echo $layout_name; ?>/js/jquery.nanoscroller.min.js"></script>
        <script src="<?php echo $layout_name; ?>/js/jquery.ba-resize.min.js"></script>
        <script src="<?php echo $layout_name; ?>/js/underscore.min.js"></script>
        <script type="text/javascript" src="https://cdn.cavernoftime.com/api/tooltip.js"></script>
        <script>
            var SF = {};
            $(function() {

                SF.bindAutoClose = function(time) {
                    $(document).bind('cbox_complete', function() {
                        setTimeout($.colorbox.close, time);
                        infoPopupClose = 0;
                    });
                }

                SF.popUp = function(id) {
                    $.colorbox({
                        speed: 350,
                        width: "500px",
                        top: "200px",
                        inline: true,
                        href: "#" + id
                    });
                }

                $("body > :not(#colorbox)").click(function() {
                    if ($("#colorbox").css("display") == "block") {
                        $.colorbox.close();
                    }
                });

            });
        </script>

        <script>
            $(document).ready(function() {
                var templates = new Array();
                templates["flag_-1"] = _.template($("#flag_-1").html());
                templates["flag_0"] = _.template($("#flag_0").html());
                templates["flag_1"] = _.template($("#flag_1").html());
                templates["flag_2"] = _.template($("#flag_2").html());
                var load_error = _.template($("#load_error").html());
                var tbc_flag = $("#tbc_flag");
                $.post("/site/Ajax/RealmFlag", {
                            "realm_id": "1"
                        },
                        function(data) {
                            data.flag != null ? tbc_flag.html(templates["flag_" + data.flag]()) : tbc_flag.html(load_error());
                        }, "json")
                    .error(function() {
                        tbc_flag.html(load_error());
                    });
            });
        </script>
        <script id="flag_-1" type="text/template">
            <span class="statistics_offline"><i class="fa fa-exclamation-circle"></i> Offline</span>
            <div class="statistics_maintenance" align="center">We are currently undergoing maintenance.</div>
        </script>
        <script id="flag_0" type="text/template"><span class='statistics_online'><i class="fa fa fa-arrow-circle-up"></i> Online</span></script>
        <script id="flag_1" type="text/template"><span class='statistics_restarting'><i class="fa fa-minus-circle"></i> Restarting</span></script>
        <script id="flag_2" type="text/template"><span class='statistics_offline'><i class="fa fa-arrow-circle-down"></i> Offline</span></script>
        <script id="load_error" type="text/template"><span class='statistics_offline load_error'><i class="fa fa-remove"></i> Error</span></script>

        <script>
            $(function() {
                var height = $(window).height();
                $('.scroller').css('height', height);
                $('.scroller').css('position', 'relative');
                $('.scroller').nanoScroller({
                    contentClass: 'scroller-content'
                });
                $(window).resize(function() {
                    height = $(window).height();
                    $('.scroller').css('height', height);
                    $('.scroller').nanoScroller({
                        contentClass: 'scroller-content'
                    });
                });
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

    </body>

    </html>