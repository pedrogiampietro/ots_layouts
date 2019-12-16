<?php
if(!defined('INITIALIZED'))
	exit;

$cachedata = '';
$cachetime = 30;
$cachefile = "cache/casts.tmp";
if (file_exists($cachefile) && filemtime($cachefile) > (time() - $cachetime)) {
	$cachedata = file_get_contents($cachefile);
} else {
	$cast = $SQL->query("SELECT `p`.`name` AS `name`, `p`.`level` AS `level`, `p`.`vocation` AS `vocation`, `lc`.`password` AS `password`, `lc`.`description` AS `description`, `lc`.`spectators` AS `spectators` FROM `live_casts` AS `lc` LEFT JOIN `players` AS `p` ON `p`.`id` = `lc`.`player_id`;")->fetchAll();
	foreach($cast as $player) {
		$cachedata .= '<tr><td><a href="?view=characters&name='.urlencode($player['name']).'" data-toggle="tooltip" data-placement="top" data-original-title="Level '.$player['level'].', '.$vocation_name[$player['vocation']].'">'.$player['name'].'</a></td><td>'.$player['spectators'].'</td><td>' . ($player['description'] ? $player['description'] : '') . '</td><td>' . ($player['password'] == 1 ? '<i class="fa fa-lock" data-toggle="tooltip" data-placement="top" data-original-title="Password Protected"></i>' : '') . '</td></tr>';
	}
}
?>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Live Casts</h3>
		</div>
		<div class="panel-body">
			<p>You can start casting by typing the command <b>!cast</b> ingame. Login to the server without account name to watch a live cast. If the cast has a password, enter the password in the password login field (still empty account name).</p>

			<?php if ($cachedata) { ?>
				<table class="table table-striped table-condensed">
					<thead>
						<tr>
							<th>Name</th>
							<th style="width:10%">Spectators</th>
							<th style="width:35%">Description</th>
							<th style="width:5%">#</th>
						</tr>
					</thead>
					<tbody>
						<?php echo $cachedata; ?>
					</tbody>
				</table>
			<?php } else { ?>
				<div class="alert alert-info">There are no live casts at the moment.</div>
			<?php } ?>
		</div>
	</div>
