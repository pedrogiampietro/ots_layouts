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
<html lang="pt-br">
	<head>
		<meta charset="utf-8"/>
		<meta name="author" content="Felipe Monteiro - Monteiro Soft">
		<meta name="description" content="warmen, o melhor otserv com mapas, sistemas e quests exclusivas." />
		<meta name="keywords" content="warmen, tibia, tibia ot, otserv, otserver, bots, mmorpg, open tibia server, open tibia, global full, baiak, real server, tibiaking, tibiabots, games">
		<meta name="robots" content="index, follow">
		
		<meta property="og:locale" content="pt_BR">
		<meta property="og:url" content="https://www.warmen.online/">
		<meta property="og:title" content="warmen - News | Open Tibia Server">
		<meta property="og:site_name" content="warmen - Open Tibia Server">
		<meta property="og:description" content="Um servidor de Open Tibia totalmente voltado à diversão. Com mapas e sistemas exclusivos o warmen mantém a essência do tibia, porém com um toque a mais na diversão e nas aventuras pela frente.">
		<meta property="og:image" content="https://www.warmen.online/images/mapas/mapas-warmen.png">
		<meta property="og:image:type" content="image/png">
		<meta property="og:image:width" content="300">
		<meta property="og:image:height" content="300">
		<meta property="og:type" content="website">
		
		<title>Warmen - News | Open Tibia Server.</title>
		
		<!-- fonts -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
		<link rel="stylesheet" href="layout/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Cinzel+Decorative:400,700" rel="stylesheet">
		
		<!-- css -->
		<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/reset.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
		<link rel="stylesheet" href="<?php echo $layout_name; ?>/css/style.css" media="screen">
		<link rel="stylesheet" href="<?php echo $layout_name; ?>/fancybox/jquery.fancybox-1.3.4.css" media="screen">
		
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<!-- icon -->
		<link rel="shortcut icon" href="layout/img/favicon.png">
	</head>
	
	<body>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-118331776-1"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());

		  gtag('config', 'UA-118331776-1');
		</script>

		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.12&appId=329021967165778&autoLogAppEvents=1';
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<header>
			<div class="top-menu">
				<div class="container">
					<div class="pull-left">
					</div>
					<div class="pull-right">
						<div class="social-icons-container">
							<ul class="social-icons">
								<li class="social-facebook"><a target="_blank" href="https://www.facebook.com/warmenOpenTibia/"></a></li>
								<!--<li class="social-twitter"><a target="_blank" href="https://twitter.com/warmenOTS"></a></li>-->
								<li class="social-youtube"><a target="_blank" href="https://www.youtube.com/channel/UCHD_NHia2vOjqwFAfNxK-3A?view_as=subscriber"></a></li>
							</ul>
						</div>
					</div>
					<div class="clr"></div>
				</div>
			</div>
			
			<div class="container">
				<div class="logo"></div> <!-- adicionar logo aqui -->
			</div>
		</header>
				<nav>
			<div class="container">
				<div class="menuBox">
					<div class="mainMenu">
						<ul>
							<li class="active"><a href="?view=news">News</a></li>
							<li class="dropdown ">
								<a href="#">Comunidade <i class="fa fa-angle-down"></i></a>
								<ul>
									<li ><a href="?view=characters">Personagens</a></li>
									<li ><a href="?view=online">Quem está online?</a></li>
									<li ><a href="?view=highscores">Ranking</a></li>
									<li ><a href="?view=houses">Casas</a></li>
									<li ><a href="?view=guilds">Guilds</a></li>
                                    <li ><a href="?view=lastdeaths">Últimas Mortes</a></li>
								</ul>
							</li>
							<li class="dropdown ">
								<a href="#">Biblioteca <i class="fa fa-angle-down"></i></a>
								<ul>
                                    <li ><a href="?view=support">Nossa Equipe</a></li>
                                    <li ><a href="?view=info">Informações do Servidor</a></li>
									<li ><a href="?view=rules">Regras do warmen</a></li>
									<li ><a href="?view=crowntoken">Crown Tokens</a></li>
								</ul>
							</li>
							<li ><a href="?view=forum">Fórum</a></li>
							<li class="dropdown ">
								<a href="?view=account">Conta <i class="fa fa-angle-down"></i></a>
								<ul>
									<li><a href="?view=createaccount">Criar uma conta</a></li>
									<li><a href="?view=lostaccount">Perdi minha conta</a></li>                                    <li >
                                    </li>
                                    <li >
                                        <a href="?view=downloads">Downloads</a>
                                    </li>
								</ul>
							</li>
							<li ><a href="?view=#">Loja</a></li>
						</ul>
					</div>
				</div>
					<div class="loginBox">
					<div class="container-login">
						<div class="infos">
							
									<h2 class="creation-title"><a href="?subtopic=createaccount">Criar sua conta</a></h2>
									<small class="creation-small"><a href="?subtopic=lostaccount">Esqueceu sua conta ou senha?</a></small>						</div>
						
								<div class="box">
									<h2><a onclick="myFunction()" class="dropdown-toggle">Login<br><i class="fa fa-angle-down"></i></a></h2>
								</div>
								<div class="login-dropdown" id="myDIV" style="display: none;">
									<h1>Login</h1>
									<form method="post" action="">
										<div class="field-set">
											<span class="input-item">
												<i class="fa fa-user-circle"></i>
											</span>
											<input type="password" maxlength="35" name="account_login" class="form-control" id="alloptions" placeholder="Account Name" required />
										</div>

										<div class="field-set">
											<span class="input-item">
												<i class="fa fa-key"></i>
											</span>
											<input type="password" maxlength="35" name="password_login" class="form-control" id="alloptions" placeholder="Password" required/>
											<span>
												<i class="fa fa-eye" aria-hidden="true" type="button" id="eye"></i>
											</span>
										</div>

										<button type="submit" class="btn btn-primary btn-block">Sign in</button>
									</form>
								</div>						
					</div>
				</div>
			</div>
		</nav>		
		<script>
function myFunction() {
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>
		
	<section id="ticker-slide">
		<div class="container">
			<div class="tsBox">
				<div class="slider">
					<ul id="slides">
						<li id="slide-1" class="slide">
							<a href="?view=donate">
								<img src="images/double-slide.png" alt="">
								<div class="slide-infos">
								</div>
							</a>
						</li>
					</ul>
	 

				</div>
				<div class="tickers">
					<h2>Tickers</h2>
					<ul class="ticker"><p style="margin-top: 10px;" class="info-warning">Sem tickers.</p>
					
			</div>
		</div>
	</section>		
		
			<div class="warningBox container">
			<center>Welcome to Warmen-ATS</center>
			</div>		
		<section id="server-infos" class="container">
			<div class="info-box info-status">
				<h2>Status do Servidor</h2>
				<center><table class="table table-striped table-condensed">
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
			</div></center>
			<div class="info-box info-infos">
				<h2>Informações</h2>
				<ul>
					<li>IP: thoria.online</li>
					<li>Porta: 7171</li>
					<li>Versão: 10.99/11</li>
					<li>Tipo: PVP</li>
				</ul>
			</div>
			<div class="info-box info-rates">
				<h2>Rates</h2>
				<ul>
					<li>Exp: <a href="?view=serverinfo#stages">stages de 20x</a></li>
					<li>Magic: 3x</li>
					<li>Skill: 10x</li>
					<li>Loot: 1x</li>
				</ul>
			</div>
			<div class="info-box info-download">
				<h2>Download Clientes</h2>
				<a href="?view=downloads" class="infos-button">
					<span class="infos-button-bg-left"></span>
					<span class="infos-button-bg-mid">
						<span>Clientes <i class="fa fa-download"></i></span>
					</span>
					<span class="infos-button-bg-right"></span>
				</a>
			</div>
			<div class="info-box info-donate">
				<h2>Doação</h2>
				<a href="?view=donate" class="infos-button">
					<span class="infos-button-bg-left"></span>
					<span class="infos-button-bg-mid">
						<span>Doar <i class="fa fa-gift"></i></span>
					</span>
					<span class="infos-button-bg-right"></span>
				</a>
			</div>
			<div class="clr"></div>
		</section>
		
		<section id="content" class="container">
			<!-- content -->
			
					</ul>
				</div>
				
				<div class="main-content">
				<div class="news-content">
				<?php if ($subtopic == '' || $subtopic == 'news') { ?>

				<?php } ?>

				<?PHP echo $main_content; ?>

				</div>
			</div>			
			
			<div class="side-content">
				<div class="side-box">
					<div class="side-tab">
						<ul class="side-tab-links">
							<li class="active"><a href="#toplevel">Top 5 Level</a></li>
							<li><a class="active" href="#topguild">Top 5 Guilds</a></li>
						</ul>
						<div class="clr"></div>
					</div>
					<div class="side-tab-content">
						<div id="toplevel" class="side-tab-pane active">
						<table class="table">
							<tbody>
								<?php echo $topData; ?>
							</tbody>
						</table>
							</div>
							<div id="topguild" class="side-tab-pane">
							<p class="info-warning">Não há Guilds no momento.</p>						
							</div>
					</div>
				</div>
				<div class="side-box">
					<div class="side-box-title">Discord</div>
					<div class="side-box-content">
						<iframe src="https://discordapp.com/widget?id=517452686216396800&theme=dark" width="295" height="300" allowtransparency="true" frameborder="0"></iframe>
					</div>
				</div>
				<?php
					$powergamers = $SQL->query("SELECT name, experience, exphist_lastexp FROM players WHERE group_id < 2 ORDER BY  experience - exphist_lastexp DESC LIMIT 5;");
				?>
				<div class="side-box">
					<div class="side-box-title">PowerGamers</div>
					<div class="side-box-content">
					<table class="table">
							<tbody>
								<?php
								$i=0;
								foreach($powergamers->fetchAll() as $player) {
									$i++;
									$change = $player['experience']-$player['exphist_lastexp'];
									$nam = $player['name'];
									if (strlen($nam) > 15)
										{$nam = substr($nam, 0, 12) . '...';}
									echo '
									<tr>
									<td style="width: 80%"><strong>'.$i.'.</strong> 
									<a href="?view=characters&name=' . $player['name'] . '">' . $nam . '</a><td><span class="label label-' . ($change >= 0 ? 'success' : 'error') . ' pull-right">' . ($change >= 0 ? '+' : '-') . $change . ' exp</td></span>
									</td>
									</tr>';
								}
								?>
							</tbody>
						</table>
						<table class="table-striped">
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<div class="side-box">
					<div class="side-box-title">Tradutor</div>
					<div class="side-box-content">
						<center>
							<div id="google_translate_element"></div>
							<script type="text/javascript">
								function googleTranslateElementInit() {
									 new google.translate.TranslateElement({pageLanguage: 'pt', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, gaTrack: true, gaId: 'UA-118331776-1'}, 'google_translate_element');
								}
							</script>
							<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
						</center>
					</div>
				</div>
			</div>
			<div class="clr"></div>
		</section>
		
		<footer id="footer" class="container">
			<div class="footer-one">
				<span>www.warmen.online</span>
			</div>
			<div class="footer-two">
				<div class="copyright">
					<h2>Copyright &copy; 2016-2018</h2>
					<p>Este website não tem relação com o site Tibia.com. Algumas imagens usadas aqui são de propriedade exclusivas da Cipsoft GmbH.</p>
					<p>O warmen usa uma engine Open Source | <a href="#" target="_blank">Forgotten Server</a> - GNU License.</p>
				</div>
				<div class="footer-links">
					<ul>
						<li><a href="?view=serverinfo">Informações do Servidor</a></li>
						<li><a href="?view=rules">Regras do Servidor</a></li>
						<li><a href="?view=team">Nossa Equipe</a></li>
						<li><a href="?view=wiki">warmen Wiki</a></li>
					</ul>
				</div>
				<div class="facebook-like">
					<div class="fb-like" data-href="#" data-layout="box_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
				</div>
				<div class="clr"></div>
			</div>
			<div class="footer-developer">
				<p>Desenvolvido com muito <i class="fa fa-heart"></i> e <i class="fa fa-coffee"></i> por <a href="#" target="_blank">Felipe Monteiro & modificado by Jobs.</a></p>
			</div>
		</footer>
		
		<!-- js -->
		<script src="<?php echo $layout_name; ?>/js/jquery.js"></script>
		<script src="<?php echo $layout_name; ?>/js/jquery.fancybox-1.3.4.pack.js"></script>
		<script src="<?php echo $layout_name; ?>/js/jquery.ui.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script src="<?php echo $layout_name; ?>/js/main.js"></script>
		<script src="<?php echo $layout_name; ?>/js/countdown.js" charset="utf-8"></script>
		<script src="<?php echo $layout_name; ?>/js/news.main.js"></script>
       
		</body>
</html>

		<script>var secondsToServerSave = <?php echo json_encode($remaining); ?>;</script>
		<script src="<?php echo $layout_name; ?>/js/bootstrap.min.js"></script>
		<script src="<?php echo $layout_name; ?>/js/jquery.countdown.min.js"></script>
		<script src="<?php echo $layout_name; ?>/js/misc.js"></script>
	</body>
</html>