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
	foreach($SQL->query("SELECT `name`, `level` FROM `players` WHERE `group_id` <= 2 AND `account_id` != 1 ORDER BY `level` DESC LIMIT 5")->fetchAll() as $player) {
		$i++;
		$topData .= '<tr><td style="width: 80%"><strong>'.$i.'.</strong> <a href="?view=characters&name='.urlencode($player['name']).'">'.$player['name'].'</a></td><td><span style="padding: 6px;" class="label label-primary label-sm">Level '.$player['level'].'</span></td></tr>';
	}

	file_put_contents($cacheFile, $topData);
}
?>

<html lang="en">

<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<?php echo $layout_name; ?>/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="<?php echo $layout_name; ?>/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>
		@Thoria Material Kit 
	</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<!-- CSS Files -->
	<link href="<?php echo $layout_name; ?>/assets/css/material-kit.css" rel="stylesheet" />
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="<?php echo $layout_name; ?>/css/style.css" rel="stylesheet" />
</head>

<body class="index-page sidebar-collapse">
	<nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
		<div class="container">
			<div class="navbar-translate">
				<a class="navbar-brand" href="?view=news">
				Thoria Online </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span>
					<span class="navbar-toggler-icon"></span>
					<span class="navbar-toggler-icon"></span>
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="dropdown nav-item">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="material-icons">home</i> Accounts
						</a>

						<div class="dropdown-menu dropdown-with-icons">
							<a href="?view=register" class="dropdown-item">
								Create Account
							</a>
							<a href="?view=" class="dropdown-item">
								Lost Account
							</a>
						</div>
					</li>
					<li class="dropdown nav-item">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="material-icons">people</i> Community
						</a>

						<div class="dropdown-menu dropdown-with-icons">
							<a href="?view=casts" class="dropdown-item">
								Live Casts
							</a>
							<a href="?view=characters" class="dropdown-item">
								Characters
							</a>
							<a href="?view=online" class="dropdown-item">
								Who is Online?
							</a>
							<a href="?view=highscores" class="dropdown-item">
								Highscores
							</a>
							<a href="?view=houses" class="dropdown-item">
								Houses
							</a>
							<a href="#" class="dropdown-item">
								Last Deaths
							</a>
							<a href="?view=guilds" class="dropdown-item">
								Guilds
							</a>
						</div>
					</li>
					<li class="dropdown nav-item">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="material-icons">forum</i> Forum
						</a>

						<div class="dropdown-menu dropdown-with-icons">
							<a href="?view=forum" class="dropdown-item">
								Dashboard
							</a>
						</div>
					</li>
					<li class="dropdown nav-item">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="material-icons">library_books</i> Library
						</a>

						<div class="dropdown-menu dropdown-with-icons">
							<a href="?view=info" class="dropdown-item">
								Informations
							</a>
							<a href="?view=rates" class="dropdown-item">
								Rates
							</a>
							<a href="#" class="dropdown-item">
								Raids
							</a>
						</div>
					</li>
					<li class="dropdown nav-item">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="material-icons">help</i> Help
						</a>

						<div class="dropdown-menu dropdown-with-icons">
							<a href="?view=support" class="dropdown-item">
								Support Team
							</a>
							<a href="?view=rules" class="dropdown-item">
								Server Rules
							</a>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="javascript:void(0)" onclick="scrollToDownload()">
							<i class="material-icons">cloud_download</i> Download
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="#" target="_blank" data-original-title="Follow us on Twitter">
							<i class="fa fa-twitter"></i>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="#" target="_blank" data-original-title="Like us on Facebook">
							<i class="fa fa-facebook-square"></i>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="#" target="_blank" data-original-title="Follow us on Instagram">
							<i class="fa fa-instagram"></i>
						</a>
					</li>

					<button class="btn btn-primary" data-toggle="modal" data-target="#loginModal">
						Login <i class="material-icons">account_circle</i>
					</button>
				</ul>
			</div>
		</div>
	</nav>

	<div class="modal fade" id="loginModal" tabindex="-1" role="">
		<div class="modal-dialog modal-login" role="document">
			<div class="modal-content">
				<div class="card card-signup card-plain">
					<div class="modal-header">
						<div class="card-header card-header-primary text-center">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>

							<h4 class="card-title">Log in</h4>
							<div class="social-line">
								<a href="#pablo" class="btn btn-just-icon btn-link btn-white">
									<i class="fa fa-facebook-square"></i>
								</a>
								<a href="#pablo" class="btn btn-just-icon btn-link btn-white">
									<i class="fa fa-twitter"></i>
									<div class="ripple-container"></div></a>
									<a href="#pablo" class="btn btn-just-icon btn-link btn-white">
										<i class="fa fa-google-plus"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="modal-body">
							<form class="form" method="post" action="?view=account">
								<p class="description text-center">Or Be Classical</p>
								<div class="card-body">

									<div class="form-group bmd-form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text"><i class="material-icons">visibility</i></div>
											</div>
											<input type="password" maxlength="35" name="account_login" class="form-control" id="alloptions" placeholder="Account Name" required />
										</div>
									</div>

									<div class="form-group bmd-form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text"><i class="material-icons">lock_outline</i></div>
											</div>
											<input type="password" maxlength="35" name="password_login" class="form-control" id="alloptions" placeholder="Password" required/>
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-link btn-wd btn-lg">Sign in</button>
							</form>
						</div>
						<div class="modal-footer justify-content-center">

						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="page-header header-filter clear-filter purple-filter" data-parallax="true" style="background-image: url('<?php echo $layout_name; ?>/assets/img/bg2.jpg');">
			<div class="container">
				<div class="row">
					<div class="col-md-8 ml-auto mr-auto">
						<div class="brand">
							<h1>Thoria Online.</h1>
							<h3>from new to the world</h3>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Side navigation -->
		<div class="sidebar">
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

			<ul class="nav nav-tabs nav-pills-icons" role="tablist" style="margin-top: -10px;">
				<li class="nav-item">
					<a class="nav-link active" href="#information-1" role="tab" data-toggle="tab">
						Information
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#serverstatus-1" role="tab" data-toggle="tab">
						Status
					</a>
				</li>
			</ul>
			<div class="tab-content card" style="width: 15rem;margin-top: 10px;">
				<div class="tab-pane active" id="information-1">
					<center><h4 class="card-title">Information</h4>
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
					</div>
					<div class="tab-pane" id="serverstatus-1">
						<center><h4 class="card-title">Server Status</h4>
							<table class="table">
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
										<td>
											<span class="label label-primary label-sm pull-right">06:00</span>
										</td>
									</tr>
									<tr>
										<td style="padding-top: 15px;"><a href="?view=online"><?PHP echo $playersOnline; ?> player<?php echo ($playersOnline != 1 ? 's' : ''); ?> online</a></td><td></td></center>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="card card-nav-tabs">
					<div class="card-body">
						<?php if ($view == '' || $view == 'news') { ?>
						<?php } ?>

						<?PHP echo $main_content; ?>

						<?PHP $time_end = microtime_float(); $time = $time_end - $time_start; ?>
						<center>
							<font color="white">Layout modificado por Thoria &copy 2018.<br>
								Load time: <?PHP echo round($time, 4); ?> seconds.
							</font>
						</center>
					</div>
				</div>

				<footer class="footer" data-background-color="black">
					<div class="container">
						<nav class="float-left">
							<ul>
								<li>
									<a href="https://tibiaking.com/profile/25264-jobs/">
										Jobs
									</a>
								</li>
								<li>
									<a href="#">
										for
									</a>
								</li>
								<li>
									<a href="https://tibiaking.com/forums">
										Tibiaking
									</a>
								</li>
								<li>
								</li>
							</ul>
						</nav>
						<div class="copyright float-right">
							&copy;
							<script>
								document.write(new Date().getFullYear())
							</script>, made with <i class="material-icons">favorite</i> by
							<a href="https://tibiaking.com/profile/25264-jobs/" target="_blank">Jobs</a> for a better web.
						</div>
					</div>
				</footer>

				<!--   Core JS Files   -->
				<script src="<?php echo $layout_name; ?>/assets/js/core/jquery.min.js" type="text/javascript"></script>
				<script src="<?php echo $layout_name; ?>/assets/js/core/popper.min.js" type="text/javascript"></script>
				<script src="<?php echo $layout_name; ?>/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
				<script src="<?php echo $layout_name; ?>/assets/js/plugins/moment.min.js"></script>
				<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
				<script src="<?php echo $layout_name; ?>/assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
				<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
				<script src="<?php echo $layout_name; ?>/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
				<!--  Google Maps Plugin    -->
				<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
				<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
				<script src="<?php echo $layout_name; ?>/assets/js/material-kit.js?v=2.0.5" type="text/javascript"></script>
				<script>
					$(document).ready(function() {
      //init DateTimePickers
      materialKit.initFormExtendedDatetimepickers();

      // Sliders Init
      materialKit.initSliders();
  });
					function scrollToDownload() {
						if ($('.section-download').length != 0) {
							$("html, body").animate({
								scrollTop: $('.section-download').offset().top
							}, 1000);
						}
					}

					$(document).ready(function() {

						$('#facebook').sharrre({
							share: {
								facebook: true
							},
							enableHover: false,
							enableTracking: false,
							enableCounter: false,
							click: function(api, options) {
								api.simulateClick();
								api.openPopup('facebook');
							},
							template: '<i class="fab fa-facebook-f"></i> Facebook',
							url: '#'
						});

						$('#googlePlus').sharrre({
							share: {
								googlePlus: true
							},
							enableCounter: false,
							enableHover: false,
							enableTracking: true,
							click: function(api, options) {
								api.simulateClick();
								api.openPopup('googlePlus');
							},
							template: '<i class="fab fa-google-plus"></i> Google',
							url: '#'
						});

						$('#twitter').sharrre({
							share: {
								twitter: true
							},
							enableHover: false,
							enableTracking: false,
							enableCounter: false,
							buttons: {
								twitter: {
									via: 'CreativeTim'
								}
							},
							click: function(api, options) {
								api.simulateClick();
								api.openPopup('twitter');
							},
							template: '<i class="fab fa-twitter"></i> Twitter',
							url: '#'
						});

					});
				</script>

			</body>

			</html>