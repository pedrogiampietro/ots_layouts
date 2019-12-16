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

		<meta charset="utf-8">
		<meta http-equiv="content-language" content="en">
		<meta name="description" content="Tibia is a free massively multiplayer online role-playing game (MMORPG)">
		<meta name="keywords" content="burmourne, free online rpg, free mmorpg, mmorpg, mmog, online role playing game, online multiplayer game, internet game, online rpg, rpg">

		<!-- Icons -->
		<link rel="shortcut icon" href="<?php echo $layout_name; ?>/images/favicon.gif" />

		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/basic.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/datatable.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/style.css">
		<link rel="stylesheet" type="text/css" href="<?php echo $layout_name; ?>/css/materialkit.css">
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,700|Roboto+Slab:400,700|Alegreya+SC:400,700' rel='stylesheet' type='text/css'>

		<!-- JS -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	</head>

	<body>
		<div id="page">
	<div id="header"></div>
	<div id="cnt-container">
    	<div class="cnt-left">
    		<div id="menu">
				<div class="card" style="width: 15rem;">
				<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
					<center><h4 class="card-title">News</h4>
						<table class="table">
							<tbody>
                    <ul>
						<li><a href="/news">Latest News</a></li>
						<li><a href="/download"><font color="lime">Download Client</font></a></li>
						<li class="last"><a href="https://forum.masteria.net">Forum</a></li>
					</ul>
							</tbody>
						</table>
					</center>
				</div>
			</div>
			
							<div class="card" style="width: 15rem;">
				<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
					<center><h4 class="card-title">Accounts</h4>
						<table class="table">
							<tbody>
					<ul>
					<li><a href="/account/login">Login</a></li>
					<li><a href="/account/register">Create Account</a></li>
					<li><a href="/account/lost">Lost Account?</a></li>
					<li class="last"><a href="/">Rules</a></li>
					</ul>
							</tbody>
						</table>
					</center>
				</div>
			</div>

				<div class="card" style="width: 15rem;">
				<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
					<center><h4 class="card-title">Community</h4>
						<table class="table">
							<tbody>
						<ul>
						<li><a href="/community/casts" style="color:yellow;">Live Casts</a></li>
						<li><a href="/community/cams" style="color:yellow;">Cam System</a></li>
						<li><a href="/player/search">Characters</a></li>
						<li><a href="/community/online">Who is Online?</a></li>
						<li><a href="/community/rank">Highscores</a></li>
						<li><a href="/community/deaths">Latest Deaths</a></li>
						<li><a href="/community/guilds">Guilds</a></li>
						<li><a href="/community/wars">Wars</a></li>
						<li class="last"><a href="/community/houses">Houses</a></li>
					</ul>
							</tbody>
						</table>
					</center>
				</div>
			</div>
			
							<div class="card" style="width: 15rem;">
				<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
					<center><h4 class="card-title">Library</h4>
						<table class="table">
							<tbody>
					<ul>
						<li><a href="/library/faq"><span class="font_lightgreen">FAQ</a></span></li>
						<li><a href="/library/tasks" style="color:yellow;">Tasks List</a></li>
						<li><a href="/faq/support">Support</a></li>
					</ul>
							</tbody>
						</table>
					</center>
				</div>
			</div>
			</div>
		</div>
		
		
			<div class="cnt-center">	
					
					<div class="card card-nav-tabs">
					  <div class="card-body">
						<blockquote class="blockquote mb-0">
					<center><span style="font-size:16px;font-weight:bold;"><a href="#"><i class="fa fa-download fa-fw" aria-hidden="true"></i> Download Client</a></span><br /><font color="lime">Uploaded: 29/12/2018</font></center>						  <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
						</blockquote>
					  </div>
					</div>
					<br>
				<div class="card card-nav-tabs text-center">
			  <div class="card-header card-header-primary">
				Featured
			  </div>
			  <div class="card-body">
				<h4 class="card-title">Special title treatment</h4>
				<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
				<a href="#0" class="btn btn-primary">Go somewhere</a>
			  </div>
			  <div class="card-footer text-muted">
				2 days ago
			  </div>
			</div>
		</div>
		
				

				
				
		<?php
									$powergamers = $SQL->query("SELECT name, experience, exphist_lastexp FROM players WHERE group_id < 2 ORDER BY  experience - exphist_lastexp DESC LIMIT 5;");
												?>
		<div class="cnt-right">	
			<div class="card" style="width: 15rem;">
				<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
					<center><h4 class="card-title">Top 5 Level</h4>
						<table class="table">
							<tbody>
								<?php echo $topData; ?>
							</tbody>
						</table>
					</center>
				</div>
			</div> 
			
			<div class="card" style="width: 15rem;">
				<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
					<center><h4 class="card-title">Server Status</h4>
						<table class="table">
							<tbody>
								<tr>
									<td><b>IP:</b></td> <td>burmourne.net</td>
								</tr>
								<tr>
									<td><b>Client:</b></td> <td>10.80-10.82</td>
								</tr>
								<tr>
									<td><b>Type:</b></td> <td>PvP</td></center>
								</tr>
							</tbody>
						</table>
					</center>
				</div>
			</div> 		
			
				<div class="card" style="width: 15rem;">
				<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
					<center><h4 class="card-title">PowerGamers</h4>
										<table class="table-striped">
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
					</center>
				</div>
			</div> 
   
		<div id="cnt-box2">Copyrights 2018, <b><a href="#"><span style="color: white">Jobs</span></a></b>. All rights reserved.</div><br />
	</div>
</div>
</div>

		<script>var secondsToServerSave = <?php echo json_encode($remaining); ?>;</script>
		<script src="<?php echo $layout_name; ?>/js/bootstrap.min.js"></script>
		<script src="<?php echo $layout_name; ?>/js/jquery.countdown.min.js"></script>
		<script src="<?php echo $layout_name; ?>/js/misc.js"></script>
	</body>
</html>