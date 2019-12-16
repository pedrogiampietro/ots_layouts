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
<html>

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
    <meta content="http://localhost/layouts/pokemon/assets/images/aymY4WEReT7_DF_zfVWbHApWAOUuHYZn843kP1mAdJp.jpg" name="twitter:image:src" />
    <meta content="http://localhost" name="twitter:url" />
    <link href="http://localhost/layouts/pokemon/assets/images/favicon.ico" rel="icon" type="image/vnd.microsoft.icon" />
    <link href="http://localhost/layouts/pokemon/assets/images//6uzwNGnWQDlj-5bBZehnvKrR5v7Ox056KvD0VcN60sI.png" rel="apple-touch-icon" />
    <title>Pokémon Kalaboka</title>
    <link rel="stylesheet" href="<?php echo $layout_name; ?>/assets/css/fodac.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $layout_name; ?>/assets/css/mechupa.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $layout_name; ?>/assets/css/pegaaki.css" type="text/css" />
</head>

<body class="lang-global" data-asset-host="http://localhost" data-current-locale="en-US">
    <div id="app">
        <modal-external-link :external-link="externalLink" :is-open="isOpen"></modal-external-link>
        <script id="modal-external-link-template" type="text/x-template">
            <transition name="modal">
                <div class="c-modal" v-show="isOpen">
                    <div class="c-modal-overlay" v-on:click.prevent.stop="hideModal()"></div>
                    <div class="c-modal-external-link">
                        <div class="c-modal-external-link-top"></div>
                        <div class="c-modal-external-link-inner">
                            <p class="c-modal-external-link-text">You are about to leave a site operated by Yinzera., Ltd.
                                <br> Yinzera# is not responsible for the content of any linked website that is not operated by DeNA. Please note that these websites' privacy policies and security practices may differ from DeNA's standards.</p>
                            <ul class="c-modal-external-link-navigation">
                                <li>
                                    <div class="c-btn-negative-small" v-on:click.prevent.stop="hideModal()">
                                        <div class="c-modal-external-link-cancel en-US">Cancel</div>
                                    </div>
                                </li>
                                <li>
                                    <a :href="externalLink" class="c-btn-positive-small" target="_blank" v-on:click="hideModal()">
                                        <div class="c-modal-external-link-continue en-US">Continue</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="c-modal-external-link-bottom"></div>
                    </div>
                </div>
            </transition>
        </script>
    </div>
    <div class="c-btn-menu"></div>
    <div class="c-mobile-navigation">
        <ul>
            <li>
                <a href="?subtopic=latestnews">
                    <div class="top en-US"></div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="story en-US"></div>
                </a>
            </li>
            <li>
                <a href="#s">
                    <div class="buddies en-US"></div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="system en-US"></div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="battle en-US"></div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="movie en-US"></div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="announcements en-US"></div>
                </a>
            </li>
        </ul>
        <a class="sp-banner-icon-maker en-US" href="#"></a>
    </div>
    <div class="c-loading is-view">
        <div class="c-loading-bg">
            <div class="c-loading-icon">
                <div class="c-loading-icon-inner"></div>
            </div>
        </div>
    </div>
    <div class="page-top">
        <div class="c-pc-navigation">
            <div class="title">
                <a class="logo" href="?subtopic=latestnews"></a>
            </div>
            <ul>
                <li>
                    <a class="story en-US" href="#"></a>
                </li>
                <li>
                    <a class="buddies en-US" href="#"></a>
                </li>
                <li>
                    <a class="system en-US" href="#"></a>
                </li>
                <li>
                    <a class="battle en-US" href="#s"></a>
                </li>
                <li>
                    <a class="movie en-US" href="#"></a>
                </li>
                <li>
                    <a class="announcements en-US" href="#"></a>
                </li>
            </ul>
            <h4><a href="/en-US/privacy_policies"></a></h4></div>
        <div id="content-wrap">
            <div class="top-header">
                <div class="top-bg"></div>
                <div class="top-img">
                    <div class="logo logo-released"></div>
                    <div class="top-chara top-chara-takeshi"></div>
                    <div class="top-chara top-chara-wataru"></div>
                    <div class="top-chara top-chara-shirona"></div>
                    <div class="top-chara top-chara-mei"></div>
                    <div class="top-chara top-chara-carne"></div>
                    <div class="top-chara top-chara-daigo"></div>
                    <div class="top-chara top-chara-red"></div>
                    <div class="top-chara top-chara-hero"></div>
                    <div class="top-chara top-chara-rivals"></div>
                </div>
                <div class="band"></div>

                    <div class="sns">
                        <div class="sns-text en-US"></div>
                        <ul class="sns-list">
                            <li>
                                <div class="btn-sns-twitter-s" data-external-link="#"></div>
                            </li>
                            <li>
                                <div class="btn-sns-facebook-s" data-external-link="#"></div>
                            </li>
                            <li>
                                <div class="btn-sns-youtube-s" data-external-link="#"></div>
                            </li>
                            <li>
                                <div class="btn-sns-instagram-s" data-external-link="#"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
           
            <div class="introduction">
                <section class="story layout-intro">
                    <div class="layout-intro-inner">
                        <h2 class="story-title en-US"></h2>
                        <p class="layout-intro-text">MEU PAU SÓ CRESCE PQ EU TOMO DANONIN</p>
                        <a class="c-btn-base is-pc" data-btn="" href="/en-US/story">
                            <div class="text-btn-on-story en-US"></div>
                        </a>
                    </div>
                    <figure class="story-figure en-US"></figure>
                    <a class="c-btn-base is-sp" data-btn="" href="/en-US/story">
                        <div class="text-btn-on-story en-US"></div>
                    </a>
                </section>
                <section class="buddies layout-intro">
                    <div class="layout-intro-inner">
                        <h2 class="buddies-title en-US"></h2>
                        <p class="layout-intro-text">ESQUECE MENOR, É O BIXO!</p>
                        <a class="c-btn-base is-pc" data-btn="" href="/en-US/buddies">
                            <div class="text-btn-on-buddies en-US"></div>
                        </a>
                    </div>
                    <figure class="buddies-figure en-US"></figure>
                    <a class="c-btn-base is-sp" data-btn="" href="/en-US/buddies">
                        <div class="text-btn-on-buddies en-US"></div>
                    </a>
                </section>
            </div>
            <div class="announcement c-bg-add-on">
                <div class="c-top-announcement">
                    <div class="c-top-announcement__title">
                        <div class="text-title-on-announcement en-US"></div>
                    </div>
                    <div class="c-top-announcement__inner">
                        <div class="c-top-announcement__contents">

                        <?php if ($subtopic == '' || $subtopic == 'news') { ?>
                            <?php } ?>
                        <?php echo $main_content; ?>

                            <a class="c-btn-base en-US" data-btn="" href="/en-US/announcements">
                                <div class="text-btn-on-more en-US"></div>
                            </a>
                        </div>
                    </div>
                    <div class="c-top-announcement__bottom"></div>
                </div>
                <div class="bnr-wrap">
                    <div class="sns-wrap">
                        <h3 class="bg-section-title">Official Accounts</h3>
                        <ul class="sns-banner 4">
                            <li>
                                <div class="btn-sns-twitter" data-external-link="#"></div>
                            </li>
                            <li>
                                <div class="btn-sns-facebook" data-external-link="#"></div>
                            </li>
                            <li>
                                <div class="btn-sns-youtube" data-external-link="#"></div>
                            </li>
                            <li>
                                <div class="btn-sns-instagram" data-external-link="#"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="c-app-info">
                <div class="app-icons">
                    <div class="icon-app"></div>
                    <div class="logo en-US"></div>
                </div>
                <ul>
                    <li>Genre: Strategy and battling game</li>
                </ul>
            </div>
            <div class="c-registration en-US">
                <ul class="c-registration-navigation released">
                    <li class="layout-icon-app">
                        <div class="icon-app"></div>
                    </li>
                    <li class="app-store">
                        <a class="btn-app-store en-US" style="background-image:url(/layouts/pokemon/assets/images/down.png);" href="#"></a>
                    </li>
                </ul>
            </div>
            <div class="c-sns-share">
                <div class="c-sns-share-text en-US"></div>
                <ul class="c-sns-share-links ">
                    <li>
                        <a class="share-sns-twitter" data-external-link="#" target="_blank"></a>
                    </li>
                    <li>
                        <a class="share-sns-facebook" data-external-link="#" target="_blank"></a>
                    </li>
                </ul>
            </div>
            <div class="c-footer">

                <div class="section">
                    <ul class="links">
                        <li><a class="c-text-link" data-external-link="https://www.pokemon.com/us/">Official Pokémon website</a></li>
                    </ul>
                </div>
                <div class="section">
                    <p class="text">
                        <br>
                        <br>Todos os direitos reservados.</p>
                </div>

            </div>
        </div>
    </div>
    <div class="c-agree-cookie" data-agree-cookie="">
        <p class="c-agree-cookie-text">We use cookies to offer an improved online experience. By using this website, you agree to our use of cookies.</p>
        <div class="c-agree-cookie-btn" data-btn=""><span class="c-agree-cookie-btn-inner">OK</span></div><a class="c-confirm-cookie-btn" data-btn="" href="/en-US/privacy_policies#change_cookie_settings"><span class="c-confirm-cookie-btn-inner">Change cookie settings</span></a></div>
    <div id="videoModal"></div>
    <div class="btn-page-top"></div>
    <script src="<?php echo $layout_name; ?>/assets/js/eobixo.js"></script>
	<script src="<?php echo $layout_name; ?>/assets/js/simsenhor.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>