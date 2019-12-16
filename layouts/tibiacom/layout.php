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
    <meta name="viewport" content="width=device-width,initial-scale=1">
      <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
      <title>World of Piece | One Piece Online</title>
      <meta name="description" content="World of Piece é um MMORPG baseado em One Piece, um divertido jogo online com incriveis aventuras.">
      <meta name="subtopicport" content="width=680">
      <meta name="keywords" content="World of Piece, One Piece Online, otpiece, tibia, tibia otserv, tibia one piece, one piece mmorpg">
      <meta name="autor" content="World of Piece | One Piece Online">
      <meta name="company" content="World of Piece | One Piece Online">



      <style>
         @import url('https://fonts.googleapis.com/css?family=Quicksand');
      </style>
	  
	  <link rel="stylesheet" href="<?php echo $layout_name; ?>/css/css.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
      <!-- Facebook Pixel Code -->
      <script>
        !function(f,b,e,v,n,t,s)
        {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
        n.callMethod.apply(n,arguments):n.queue.push(arguments)};
        if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
        n.queue=[];t=b.createElement(e);t.async=!0;
        t.src=v;s=b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t,s)}(window, document,'script',
        'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '1789887374593695');
        fbq('track', 'Pagesubtopic');
      </script>
      <noscript><img height="1" width="1" style="display:none"
        src="https://www.facebook.com/tr?id=1789887374593695&ev=Pagesubtopic&noscript=1"
      /></noscript>
      <!-- End Facebook Pixel Code -->

      <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async></script>
      <script>
         var OneSignal = OneSignal || [];
         OneSignal.push(["getUserId", function(userId) {
            //console.log("OneSignal User ID:", userId);
         }]);
         OneSignal.push( function() {

         OneSignal.SERVICE_WORKER_UPDATER_PATH = "OneSignalSDKUpdaterWorker.js";
         OneSignal.SERVICE_WORKER_PATH = "OneSignalSDKWorker.js";
         OneSignal.SERVICE_WORKER_PARAM = { scope: '/' };

         OneSignal.setDefaultNotificationUrl("#");
         var oneSignal_options = {};

         oneSignal_options['appId'] = 'a5f7f955-d256-4763-8f3d-362d654dc17b';
         oneSignal_options['autoRegister'] = true;
         oneSignal_options['welcomeNotification'] = { };
         oneSignal_options['welcomeNotification']['title'] = "Obrigado por se inscrever! Thanks for signing up!";
         oneSignal_options['welcomeNotification']['message'] = "Se algo importante acontecer, a gente te avisa por aqui :-) If something important happens, we\'ll let you know :-)";
         oneSignal_options['path'] = "#";
         oneSignal_options['safari_web_id'] = "web.onesignal.auto.0534d2b4-18a9-4e11-8788-4e680cd265b6";

         OneSignal.init(oneSignal_options);
         });

         function documentInitOneSignal() {
         var oneSignal_elements = document.getElementsByClassName("OneSignal-prompt");

         var oneSignalLinkClickHandler = function(event) { OneSignal.push(['registerForPushNotifications']); event.preventDefault(); };        for(var i = 0; i < oneSignal_elements.length; i++)
           oneSignal_elements[i].addEventListener('click', oneSignalLinkClickHandler, false);
         }

         if (document.readyState === 'complete') {
            documentInitOneSignal();
         }
         else {
            window.addEventListener("load", function(event){
                documentInitOneSignal();
           });
         }
      </script>

   </head>
   <body>
      <div class="mainbody">

         <div class="menu_nav" style="">
            <div id="navigation_flag"></div>
			
			
			 <?php
                    if($logged) {
                ?>							
				
				
				<div class="nav_links_logged">
						<div class="box-content">
							<div class="item">
								<div class="wrap">
									<div class="left"></div>
									<div class="centered">
									<p><h3>Welcome Back!</h3></p>
									<strong>Account Name: <?PHP echo $account_logged->getName(); ?></strong>
									<br>
									<a href="?subtopic=accountmanagement">Manage account</a>
									<br>
									<a href="?subtopic=accountmanagement&action=createcharacter">Criar Personagem</a>
									<br>
									<a href="?subtopic=accountmanagement&action=changepassword">Mudar Senha</a>
									<br>
									<a href="?subtopic=accountmanagement&action=changeemail">Mudar Email</a>
									<br>
									<br>
									<a class="btn btn-xs btn-danger" href="?subtopic=accountmanagement&action=logout">Logout</a>
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
			
			
            <div id="navigation_button">
                <span class='navigation_title'>Sua Conta</span>
            </div>
            <div class="nav_links_logged">
               
                <!--  <form action="?subtopic=accountmanagement" method="post" class="unlogged submitLoggin"> -->
<form class="form" role="form" action="?subtopic=accountmanagement" method="post">
											<div class="form-group">
												<input type="password" maxlength="35" name="account_login" class="input loggin_account" placeholder="Account Name" required />
											</div>
											<div class="form-group">
												<input type="password" maxlength="35" name="password_login" class="input loggin_password" placeholder="Password" required/>
											</div>
											<div class="form-group">
												<input type="Submit" class="loginbutton" name="Submit" value="Login">
											</div>
										</form>
										<a href="?subtopic=createaccount" class="btn btn-success btn-block">Register new Account</a>
									</div>
<?php
    }
?>
							  
            <div id="navigation_button">
                <span class='navigation_title'>Comunidade</span>
            </div>
            <div class="nav_links_logged">
               <div class="nav_links_green unlogged">
                  
                     <a href="?subtopic=createaccount">Criar Conta</a><br>
                     <a href="?subtopic=lostaccount">Recuperar Conta</a><br>
                     <a href="?subtopic=download">Baixar Jogo</a>
					<br><a href="?subtopic=highscores">Ranking</a>
					<br><a href="?subtopic=guilds">Guilds</a>
					<br><a href="?subtopic=characters">Procurar Personagem</a>
               </div>
            </div>
            <div id="navigation_button">
                <span class='navigation_title'>Wikia</span>
            </div>
            <div class="nav_links_logged">
               <div class="nav_links_green unlogged">
			      <a href="?subtopic=wikia">Wikia</a>
                  <br><a href="/map">Mapa Mundo</a>
                  <br><a href="?subtopic=ability">Habilidades</a>
                  <br><a href="/rules">Regras</a>
               </div>
            </div>
            <div class="boat"></div>
			
         </div>
		 
	 <div class="menu_nav_direita" style=""> <!-- WRAPPER -->
                <div id="navigation_button_direita">
                    <span class='navigation_title_direita'>Informations</span>
                </div>

                <div class="nav_links_logged_direita">
			      <table class="pTable">
											<tbody>
												<tr>
													<b>IP:</b></td><?php echo '  WorldofPiece.online' . $config['server']['ipSite'] . ''; ?>
												</tr>
												<tr>
													<td><b>Experience:</b></td> <td><a href="?subtopic=info">Stages</a></td>
												</tr>
												<tr>
													<td><b>Client:</b></td><td>8.54</td>
												</tr>
												<tr style="border-bottom:1px solid #eeeeee;">
													<td><b>Type:</b></td> <td>Retro Open PvP</td>
												</tr>
											</tbody>
										</table>
										<a style="margin-top: 10px;" href="#" target="_blank" class="btn btn-info form-control">Download Custom Client</a>
                </div>
				
				
				<div id="navigation_button_direita">
                    <span class='navigation_title_direita'>Server Status</span>
                </div>
                <div class="nav_links_logged_direita">
				<table class="pTable">
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
                                                    <a href="?subtopic=online">
                                                        <?PHP echo $playersOnline; ?> player
                                                            <?php echo ($playersOnline != 1 ? 's' : ''); ?> online</a>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </tbody>
										</table>
										<a style="margin-top: 10px;" href="#" target="_blank" class="btn btn-info form-control"><center>Who is online?</center></a>
                </div>
				
				
				<div id="navigation_button_direita">
                    <span class='navigation_title_direita'>Top 5 Level</span>
                </div>
                <div class="nav_links_logged_direita">
				<table class="pTable">
							<tbody>
								<?php echo $topData; ?>
							</tbody>
										</table>
										<a style="margin-top: 10px;" href="#" target="_blank" class="btn btn-info form-control">Click here for subtopic all.</a>
                </div>
				
				
				
				
				
				
				
            </div>    <!-- WRAPPER END -->	
			
			
		 
         <div class="navbar" id="navbar">
            <div class="menuNavbar">
               <a href="/">
                  <div class="menu1">Principal</div>
               </a>
               <i class="fas fa-anchor" style="color: #db7420;"></i>
               <a href="?subtopic=createaccount" id="menu2-link">
                  <div class="menu2">Criar Conta</div>
               </a>
               <i class="fas fa-anchor" style="color: #db7420;"></i>
               <a href="?subtopic=download">
                  <div class="menu3">Baixar Jogo</div>
               </a>
               <hr size="1" class="navbarDivisor">
            </div>
            <div class="navbuttons">
               <a href="#" target="_blank" alt="Page Facebook">
                  <div class="buttons buttonFacebook">facebook</div>
               </a>
               <a href="#" target="_blank" alt="Page Discord">
                  <div class="buttons buttonDiscord">discord</div>
               </a>
            </div>
            <div class="navNextEvent">
                <span id="accbox_online"><i class="fas fa-quote-right"></i> Mar calmo nunca fez um bom <b>Marinheiro</b>.</span>
            </div>
         </div>
         <div class="newscont">
            <div id="contentMain">
                <style type="text/css">
	#clockdiv{
		font-family: sans-serif;
		color: #fff;
		display: inline-block;
		font-weight: 100;
		text-align: center;
		font-size: 30px;
	}

	#clockdiv > div{
		padding: 10px;
		border-radius: 3px;
		background: #a75316;
		display: inline-block;
	}

	#clockdiv div > span{
		padding: 15px;
		border-radius: 3px;
		background: #7f3812;
		display: inline-block;
	}

	.smalltext{
		padding-top: 5px;
		font-size: 16px;
	}
</style>

<center><h1>Bem vindo ao World of Piece</h1></center>


					<?php if ($subtopic == '' || $subtopic == 'news') { ?>
					<?php } ?>

					<?PHP echo $main_content; ?>



            <div class="copyrights">World of Piece - One Piece MMORPG</div>
         </div>
      </div>
   </body>
   <script type="text/javascript">
      $(".menu_nav").css("height", $(document).height()+"px");
      $(window).on('resize', function(){
         $(".menu_nav").css("height", $(document).height()+"px");
      });
   </script>

   <!-- Global site tag (gtag.js) - Google Analytics -->
   <script async src="https://www.googletagmanager.com/gtag/js?id=UA-131733480-1"></script>
   <script>
     window.dataLayer = window.dataLayer || [];
     function gtag(){dataLayer.push(arguments);}
     gtag('js', new Date());

     gtag('config', 'UA-131733480-1');
   </script>

</html>
