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
		$topData .= '<tr><td style="width: 80%"><strong>'.$i.'.</strong> <a href="?subtopic=characters&name='.urlencode($player['name']).'">'.$player['name'].'</a></td><td><span class="label label-primary">Lvl. '.$player['level'].'</span></td></tr>';
	}

	file_put_contents($cacheFile, $topData);
}

$today = strtotime('today 10:00');
$tomorrow = strtotime('tomorrow 10:00');
$now = time();
$remaining = ($now > $today ? $tomorrow : $today) - $now;
?>

    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="utf-8" />
        <title>
            <?PHP echo $title ?>
        </title>
        <meta name="keywords" content="pokemon, pokestorm, storm, poke, pokes, tibia, otserv, poketibia, pokemon online, mmorpg, multiplayer, tibia pokemon" />
        <meta name="description" content="PokeStorm - Fan game de Pokémon online. Jogue grátis e se divirta com o melhor jogo de Pokémon online do Brasil." />

        <meta property="og:type" content="article" />
        <meta property="og:title" content="Pokemon Online" />
        <meta property="og:description" content="Pokemon - Fan game de Pokémon online. Jogue grátis e se divirta com o melhor jogo de Pokémon online do Brasil." />

        <link rel="stylesheet" href="<?php echo $layout_name; ?>/assets/css/layout.css" />
        <link rel="shortcut icon" href="<?php echo $layout_name; ?>/assets/images/favicon.ico" type="image/x-icon" />

        <link type="text/css" href="<?php echo $layout_name; ?>/assets/css/system.css" rel="stylesheet" />
        <link type="text/css" href="<?php echo $layout_name; ?>/assets/css/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/assets/css/tooltip.css" />
        <link rel="stylesheet" href="<?php echo $layout_name; ?>/assets/css/tipsy.css" type="text/css" />

        <script type="text/javascript" src="<?php echo $layout_name; ?>/assets/js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="<?php echo $layout_name; ?>/assets/js/jquery.ui.datetimepicker.js"></script>
        <script type="text/javascript" src="<?php echo $layout_name; ?>/assets/js/system.js"></script>
        <script type="text/javascript" src="<?php echo $layout_name; ?>/assets/js/jquery-ui-1.8.custom.min.js"></script>
        <script type="text/javascript" src="<?php echo $layout_name; ?>/assets/js/jquery.tipsy.js"></script>
        <script type="text/javascript" src="<?php echo $layout_name; ?>/assets/js/tooltip.js"></script>

        <!-- Google Analytics -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-27821785-1']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();
        </script>
        <!-- Google Analytics -->
    </head>

    <body>
        <!-- Facebook -->
        <div id="fb-root"></div>
        <script>
            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s);
                js.id = id;
                js.src = "http://connect.facebook.net/pt_BR/all.js#xfbml=1&appId=645665732125769";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <!-- Facebook -->

        <div id="nav">
            <div id="nav-wrap">
                <div id="nav-links">
                    <li><a href="?subtopic=latestnews">Início</a></li>
                    <li><a href="?subtopic=download">Download</a></li>
                    <li><a href="#">Comunidade</a>
                        <ul>
                            <li><a href="?subtopic=characters">Buscar Jogadores</a></li>
                            <li><a href="?subtopic=highscores">Top Jogadores</a></li>
                            <li><a href="?subtopic=whoisonline">Jogadores Online</a></li>
                            <li><a href="?subtopic=guilds">Guildas</a></li>
                            <li><a href="?subtopic=houses">Lista de Casas</a></li>
                        </ul>
                    </li>

                    <li><a href="#">Suporte</a>
                        <ul>
                            <li><a href="?subtopic=support">Entrar em Contato</a></li>
                            <li><a href="?subtopic=rules">Regras</a></li>
                        </ul>
                    </li>
                    <li><a href="?subtopic=forum">Fórum</a></li>
                </div>
                <div id="nav-info">
                    <td>
                        <a href="?subtopic=whoisonline">
                            <?PHP echo $playersOnline; ?> player
                                <?php echo ($playersOnline != 1 ? 's' : ''); ?> online</a>
                    </td>

                </div>
            </div>
        </div>
        <div id="wrap">
            <div id="header">
                <a href="?subtopic=latestnews" id="logo">Pokémon Online</a>
            </div>

            <div id="rightmenu">

                <?php
                    if($logged) {
                ?>

                    <div class="rightmenu-box">
                        <p>
                            <h3>Welcome Back!</h3></p>
                        <strong>Account Name: <?PHP echo $account_logged->getName(); ?></strong>
                        <br>
                        <a href="?subtopic=accountmanagement">Manage account</a>
                        <br>
						<a href="?subtopic=accountmanagement&action=createcharacter">Create Characters</a>
                        <br>
						<a href="?subtopic=accountmanagement&action=changepassword">Change Password</a>
						<br>
                        <a class="btn btn-xs btn-danger" href="?subtopic=account&action=logout">Logout</a>
                    </div>

                    <?php
                    }
                    else
                    {
                ?>
                        <div class="rightmenu-box">
                            <div class="arcanine-bg"></div>
                            <h1>Login</h1>
                            <form class="form" role="form" action="?subtopic=accountmanagement" method="post">
                                <div class="form-group">
                                    <input type="password" maxlength="35" name="account_login" class="form-control" id="alloptions" placeholder="Account Name" required />
                                </div>
                                <div class="form-group">
                                    <input type="password" maxlength="35" name="password_login" class="form-control" id="alloptions" placeholder="Password" required/>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                                </div>
                            </form>
                            <a href="?view=lostaccount" class="btn btn-danger btn-block">Account Lost?</a>
                        </div>

                        <?php
    }
?>

                            <div class="rightmenu-box">
                                <div class="scyther-bg"></div>
                                <h1>Top level</h1>

                                <table>
                                    <tbody>
                                        <?php echo $topData; ?>
                                    </tbody>
                                </table>

                            </div>
                            <div class="rightmenu-box">
                                <div class="electrode-bg"></div>
                                <h1>Status</h1>
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

                            <div class="rightmenu-box">
                                <div class="dragonair-bg"></div>
                                <h1>Facebook</h1>
                                <div class="fb-like-box" data-href="facebook.com" data-width="196" data-height="60" data-show-faces="false" data-stream="false" data-header="false"></div>
                            </div>

                            <div class="rightmenu-box" style="background-color: transparent; border: 0; padding-top: 0;">
                                <a href="#" target="_blank"><img width="180" src="<?php echo $layout_name; ?>/assets/images/discord.png" /></a>
                            </div>

            </div>
            <div id="content">

                <div class="news">

                    <?php if ($subtopic == '' || $subtopic == 'news') { ?>

                        <?php } ?>

                            <?PHP echo $main_content; ?>

                                <br />

                </div>
                <div class="news-footer">
                    <a href="#top" class="news-top">Topo <img src="<?php echo $layout_name; ?>/assets/images/topo.png" /></a>
                </div>
            </div>

            <br />
            <center>
                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- Site -->
                <ins class="adsbygoogle" style="display:inline-block;width:468px;height:60px" data-ad-client="ca-pub-0226652574332387" data-ad-slot="7282439681"></ins>
                <script>
                    (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
            </center>
        </div>

        </div>
    </body>

    </html>