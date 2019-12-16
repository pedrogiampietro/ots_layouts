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
        <script type='text/javascript'>
function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}
 
function MouseOverBigButton(source)
{
  source.firstChild.style.visibility = "visible";
}
function MouseOutBigButton(source)
{
  source.firstChild.style.visibility = "hidden";
}
function BigButtonAction(path)
{
  window.location = path;
}
varloginStatus=0; loginStatus='false';var activeSubmenuItem='latestnews';  var IMAGES=0; IMAGES='http://otland.net/./layouts/thora/images'; var LINK_ACCOUNT=0; LINK_ACCOUNT='http://otland.net';</script>              
             <link rel="shortcut icon" href="<?PHP echo $layout_name; ?>/images/server.ico" type="image/x-icon"/>
          <link rel="icon" href="layouts\thora\img\icon.ico" type="image/x-icon" />
        <link href="/./layouts/thora/res/css/basic.css" rel="stylesheet"/>
        <link href="/./layouts/thora/res/css/slate1.css" rel="stylesheet"/>
        <link href="/./layouts/thora/res/css/style.css" rel="stylesheet"/>
        <link href="/./layouts/thora/res/css/bootstrap_c.min.css" rel="stylesheet"/>
              <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700|Roboto+Slab:400,700|Alegreya+SC:400,700|Cinzel+Decorative:400,900' rel='stylesheet' type='text/css'>
<script src="/./layouts/thora/res/js/moment.js"></script>
<script src="/./layouts/thora/res/js/livestamp.js"></script>
<script type="text/javascript" src="/./layouts/thora/res/js/global.js.php?up05"></script>
</head>
        <style>
        .jumbotron
        {
            background: url('/./layouts/thora/images/loggo.png') no-repeat;
            background-size: cover;
 
        }
        .quality
        {
            background: url('/./layouts/thora/images/quality.png') no-repeat;
            background-size: cover;
 
        }
        .navbar {
            margin-top: 130px;
            padding-left: 2px;
            padding-right: 2px;
        }
        .pull-doown {
            margin-top: 70px;
            padding-left: 2px;
            padding-right: 2px;
        }
        .pull-up {
            margin-top: 10px;
            padding-left: 2px;
            padding-right: 2px;
        }
        .dragon {
            position: absolute;
            z-index: 2;
            margin-top: -140px;
            margin-left: 783px;
        }
        .szukaj {
            background-color: #242424;
            color: #242424;
            border-color: rgba(0,0,0,0.6);
        }
        .col-3.pull-right {
            width: 19.4043%;
        }
        .col-3.pull-left {
            width: 19.4043%;
        }
        .col-8 {
            width: 100%;
            padding-right: 0px!important;
            color: #242424;
        }
        </style>
    </head>
    <body>
<div id="fb-root"></div>
                <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=655717851105382";
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
 
        <script src="<?PHP ECHO $layout_name; ?>/js/bootstrap.js"></script>
        <script>$("form").find("input").each(function(){if(!(this.placeholder&&"placeholder"in document.createElement(this.tagName))&&"password"!=this.type)
        {var a=this.getAttribute("placeholder");if(null!==a){var b=$(this);b.focus(function(){this.value==a&&(this.value="",b.css("color","#333"))});b.blur(function()
        {if(""===this.value||this.value==a)this.value=a,b.css("color","#aaa")});b.blur();var c=this;this.form&&$(c.form).submit(function(){c.value==a&&(c.value="")})}}});function l(i,t)
        {var d=document;var s='script';var j,f=d.getElementsByTagName(s)[0];if(!d.getElementById(i)){j=d.createElement(s);j.id=i;j.async=true;j.src=t;f.parentNode.insertBefore(j,f);}}l
        ('facebook-jssdk','//connect.facebook.net/en_US/all.js#xfbml=1');l('twitter-wjs','//platform.twitter.com/widgets.js')</script>
        <!-- ====================================================== -->
        <div class="container" style="width: 1194px;">
<div id="pasek"><span class="p">Valhalla has started on <span class="text">Saturday 24 October</span> at <span class="text">18:00 CEST</span>! - Make sure you check out our <a href="https://www.facebook.com/ValhallaAlternativeOTServer"><span class="text">Facebook</span></a>! for latest news!
            <div class="btn-group navbar-right">
 
 
                     <?php
                    if($logged) {
                ?>
                        <a href="?subtopic=accountmanagement&action=logout">
                            <button type="button" class="p2 btn-info">
                                <span class="glyphicon glyphicon-log-out"></span> Log out
                            </button>
                        </a>
                <?php
                    }
                    else
                    {
                ?>
                <button type="button" class="p2 btn-login btn-success dropdown-toggle" data-toggle="dropdown">
                <span class="glyphicon glyphicon-share-alt"></span>Login<span class="caret"></span>
             
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li style="width: 266px; margin: 5px 15px 0px 15px;">
                        <form action="?subtopic=accountmanagement" method="post">
                            <div class="form-group">
                                <input type="password" name="account_login" maxlength="30" class="form-control" placeholder="Account Name">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password_login" maxlength="30" class="form-control" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-success" style="width: 100px">Login</button>
                            <a class="btn btn-default" style="width: 131px" href="?subtopic=lostaccount">Lost Password?</a>
                        </form>
                    </li>
                </ul>
<?php
    }
?>
</div>
         
            </div>
        <div class="pull-doown">
        <span class="pull-left"><h1><font face="Cinzel Decorative" color="black">Alvoria-ATS.com</font></h1></span>
 
</div>
        <div class="pull-doown">
        <a href="?subtopic=whoisonline"><span class="label-online label-success pull-right"> <?PHP
              if($config['status']['serverStatus_online'] == 1)
                echo $config['status']['serverStatus_players'].'<br>Players Online';
              else
                echo '<font color="white"><b>Server<br />OFFLINE</b></font>';
              ?></span></a>
</div>
     
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
 
 
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
         <li class="dropdown">
          <a href="?subtopic=latestnews" class="dropdown-toggle"><i class="glyphicon glyphicon-home"></i> News</a>
     
</li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-lock"></i> Account <span class="caret"></span></a>
          <ul class="dropdown-menu">
                                                            <li><a href="?subtopic=createaccount">Create Account</a></li>
                                                            <li><a href="?subtopic=accountmanagement">Account</a></li>
                                                            <li><a href="/files/thorav1.zip">Download Client</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-user"></i> Community <span class="caret"></span></a>
          <ul class="dropdown-menu">
                                                            <li><a href="?subtopic=characters">Characters</a></li>
                                                            <li><a href="?subtopic=highscores">Highscores</a></li>
                                                            <li><a href="?subtopic=guilds">Guilds</a></li>
                                                            <li><a href="?subtopic=whoisonline">Who is online?</a></li>
                                                            <li><a href="?subtopic=casts">Cast System</a></li>
                                                            <li><a href="?subtopic=wars">Guild Wars</a></li>                                            
                                                            <li><a href="?subtopic=killstatistics">Latest Deaths</a></li>
          </ul>
        </li>
                <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-info-sign"></i> Library <span class="caret"></span></a>
          <ul class="dropdown-menu">
                                                            <li><a href="?subtopic=serverinfo">Server Info</a></li>
                                                                                                                        <li><a href="?subtopic=tasklist">Task List</a></li>
                                                                                                                        <li><a href="?subtopic=worldmap">World Map</a></li>
                                                                                                                        <li><a href="?subtopic=guide">Guide Spawns</a></li>
                                                                                                                        <li><a href="?subtopic=spells">Spells</a></li>
                                                            <li><a href="?subtopic=team">Support</a></li>
                                                                                                                        <li><a href="?subtopic=houses">Houses</a></li>
                                                                                                                        <li><a href="?subtopic=experiencetable">Experience Table</a></li>
<li><a href="?subtopic=premium"><font color="lime">Premium Info</font></a></li>
          </ul>
        </li>
     
                        <li class="dropdown">
          <a href="?subtopic=forum"><i class="glyphicon glyphicon-list-alt"></i> Forum</span></a>
        </li>
     
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><font color="lime"><i class="glyphicon glyphicon-shopping-cart"></i> Shopping</font><span class="caret"></span></a>
          <ul class="dropdown-menu">
                                                            <li><a href="?subtopic=shopsystem">Shop</a></li>
                                                            <li><a href="?subtopic=buypoints">Purchase Points</a></li>
<li><a href="?subtopic=premium"><font color="lime">Premium Info</font></a></li>
          </ul>
        </li>
 
 
     <ul class="nav navbar-nav navbar-right">
 
        <form action="?subtopic=characters" method="post" class="navbar-form navbar-left" role="search">
<div class="form-group">
                <div class="icon-addon addon-md">
                    <input type="text" name="name" placeholder="Search character..." class="form-control szukajka">
                    <label for="szukajka" class="glyphicon glyphicon-search" rel="tooltip" title="szukajka"></label>
                </div>
            </div>
      </form>
 
      </ul>
 
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
     
 
                <div class="row-fluid">
                                <div class="col-3 pull-left">
                                <div class="well">
                                                <h2><font color="black">Webshop</font></h2>
                                           
                                                <table class="table table-condensed table-content table-striped">
                                                        <tbody>
                                                                                 
                                                                <img width="197" src="/./layouts/thora/images/promocjaa.gif"/>                
                                                                                 
 
                                                <div>
                            <center><div style="width:180px;margin-top: -29px;position: relative;"><a class="btn btn-small btn-success btn-block" href="?subtopic=shopsystem"><span class="glyphicon glyphicon-shopping-cart"></span> Get Premium!</a></div></center>
                        </div>
                                                        </tbody>
                                                </table>
             
                    </div>
 
 
 
 
                <div class="well">
                        <h2><font color="black">Information</font></h2>
                        <table class="table table-striped table-condensed table-content">
                            <tbody>
                                <tr><td><strong>IP:</strong></td><td>Alvoria-ATS.com</td></tr>
                                <tr><td><strong>Client:</strong></td><td>10.98</td></tr>
                                <tr><td><strong>Type:</strong></td><td>PvP/RPG</td></tr>
                                 <tr><td><strong>Server Info:</strong></td><td><a href="?subtopic=serverinfo">Here</a></td></tr>
                            </tbody>
                        </table>
 
                        <div>
                            <center><a class="btn btn-small btn-default btn-block" href="?subtopic=createaccount"><span class="glyphicon glyphicon-share-alt"></span> Create Account</a></center>
                        </div>
                        <div style="margin: 3px;"></div>
 
                                                <div>
                            <center><a class="btn btn-small btn-warning btn-block" href="/files/thorav2_antibot.zip"><span class="glyphicon glyphicon-download-alt"></span> Download Client</a></center>
                        </div>
 
             
                    </div>
                    </div>
 
 
<?php
    $powergamers = $SQL->query("SELECT name, experience, exphist_lastexp FROM players WHERE group_id < 2 ORDER BY  experience - exphist_lastexp DESC LIMIT 5;");
?>
                        <div class="col-3 pull-right">
                         <div class="well">
                        <h2><font color="black">Powergamer of day</font></h2>
                                <table class="table table-condensed table-content table-striped">
                                    <tbody>
                                    <?php
                    foreach($powergamers->fetchAll() as $player) {
                        $change = $player['experience']-$player['exphist_lastexp'];
                        $nam = $player['name'];
                                if (strlen($nam) > 15)
                                {$nam = substr($nam, 0, 12) . '...';}
                echo '
               <tr>
               <td>
                   <a href="?subtopic=characters&name=' . $player['name'] . '">' . $nam . '</a>&nbsp;<td><span class="label label-' . ($change >= 0 ? 'success' : 'error') . ' pull-right">' . ($change >= 0 ? '+' : '-') . $change . ' exp</td></span>
               </td>
           </tr>';
                    }
                ?>
                                     </tbody>
                                </table>
                                <table class="table table-condensed table-content table-striped">
                                    <tbody>
                                     </tbody>
                                </table>
 
             
                    </div>
 
                 
<div class="well">
                                                <h2><font color="black">Top 5 Level</font></h2>
                                           
                                                <table class="table table-condensed table-content table-striped">
                                                        <tbody><?php echo $topData; ?></tbody>
                                                </table>
                                        </div>
 
                                   
<div class="well">
    <h2><font color="black">Top 5 Guilds</font></h2>
    <table class="table table-condensed table-content table-striped">
        <tbody>
<?php
    $guildsPower = $SQL->query('SELECT `g`.`id` AS `id`, `g`.`name` AS `name`, COUNT(`g`.`name`) as `frags` FROM `players` p LEFT JOIN `player_deaths` pd ON `pd`.`killed_by` = `p`.`name` LEFT JOIN `guild_membership` gm ON `p`.`id` = `gm`.`player_id` LEFT JOIN `guilds` g ON `gm`.`guild_id` = `g`.`id` WHERE `pd`.`unjustified` = 1 GROUP BY `name` ORDER BY `frags` DESC, `name` ASC LIMIT 0, 4')->fetchAll();
    $i = 0;
    foreach($guildsPower as $guild) {
        echo '
           <tr><td>' . ++$i . '.</td><td><a href="?subtopic=guilds&action=show&guild=' . $guild['id'] . '"><img src="guild_image.php?id=' . $guild['id'] . '" width="16" height="16" border="0"/> ' . $guild['name'] . '</a>&nbsp;<td><span class="label label-danger pull-right">' . $guild['frags'] . ' kills</td></span></td></tr>';
    }
?>
        </tbody>
    </table>
</div>
</div>
 
        <div class="news">
        <div class="content-title">
<center>
<h1>Welcome to Alvoria-ATS</h1>
<p>
Alvoria-ATS.com is an custom map Tibia 7.6 server with war system, cast system, party experience sharing, oldschool quests and task system. This server is trying to replicate the old days with extra features which make the game way more enjoyable.
<center><a class="btn btn-success" href="?subtopic=createaccount"><span class="glyphicon glyphicon-registration-mark"></span> Create Account</a> <a class="btn btn-warning" href="/files/thorav2_antibot.zip"><span class="glyphicon glyphicon-download-alt"></span> Download Client</a></center>
<center><div class="slider">
                        <div class="sbox">
                            <div id="slides">
         
                            </div>
                        </div>
                    </div><div style="margin: 0 auto; padding: 0px; width: 170px; text-align: center;">
 
</p></center></div>
    <div id="news">
        <div class="col-8">    
        <div class="well well-lg">      
                         <?php if ($subtopic == '' || $subtopic == 'news') { ?>
 
                <!-- green box-->
                <!--<div class="alert alert-success">-->
                    <!--Burmourne will start in <span id="countdown"><span class="days">00</span> <span class="timeRefDays">days</span> <span class="hours">00</span><span class="timeRefHours">:</span><span class="minutes">00</span><span class="timeRefMinutes">:</span><span class="seconds">00</span><span class="timeRefSeconds"></span>.</span> <a class="alert-link" href="?view=register">Click here</a> to register!-->
                    <!--Burmourne has already started. <a class="alert-link" href="?view=register">Click here</a> to register.
                </div>-->
 
                <!-- red box-->
                <!--<div class="alert alert-danger">
                    Donec ullamcorper nulla non metus auctor fringilla.
                </div>-->
                <?php } ?>
 
                <?PHP echo $main_content; ?>
            </div>
        </div>
        <script src="./layouts/thora/res/js/bootstrap.js"></script>
        <script>
        $(function () {
            var targetA = $('a[href$="latestnews"]');
            var el = (targetA.find("button").length) ? targetA.find("button") : targetA.parent();
            el.addClass('active');
         
            $('input[name$=login], input[name=name]').click(function(e) {
                e.stopPropagation();
            });
 
            var count = 92890;
            var counter = setInterval(timer, 1000);
 
            function timer() {
                count = count - 1;
                if (count == -1) {
                    count = 24 * 60 * 60;
                }
 
                var seconds = count % 60;
                var minutes = Math.floor(count / 60);
                var hours = Math.floor(minutes / 60);
                minutes %= 60;
                hours %= 60;
 
                document.getElementById("timer").innerHTML = hours + " hours " + minutes + " minutes and " + seconds + " seconds";
            }
        });
        </script>
     
<footer class="footer">
      <div class="container">
        <p class="text-muted" style="color:#ffffff;">This website and its contents are copyright &copy; 2015 Alvoria-ATS.com</p>
      </div>
  </footer>
    </body>
</html>