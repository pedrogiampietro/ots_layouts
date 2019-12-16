<?php
if(!defined('INITIALIZED'))
	exit;

$cache_sec = 1;
$order = 'level_desc';
if(isset($_REQUEST['order']) && in_array($_REQUEST['order'], array('name_asc', 'name_desc', 'guild_asc', 'guild_desc', 'level_asc', 'level_desc', 'vocation_asc', 'vocation_desc')))
	$order = $_REQUEST['order'];

$f = 'cache/online-'.$order.'.tmp';
if (file_exists($f) && filemtime($f) > (time() - $cache_sec)) {
	$players = file_get_contents($f);
} else {
	$players = '';
	$n = 0;
	//$q = 'SELECT * FROM players WHERE `id` IN (SELECT `player_id` FROM `players_online`)';
	$q = 'SELECT `o`.`player_id` AS `id`, `p`.`looktype` as `looktype`, `p`.`lookaddons` as `addons`, `p`.`lookhead` as `head`, `p`.`lookbody` as `body`, `p`.`looklegs` as `legs`, `p`.`lookfeet` as `feet`, `p`.`name` as `name`, `p`.`level` as `level`, `p`.`vocation` as `vocation`, `g`.`id` AS `guildId`, `g`.`name` as `guildName` FROM `players_online` as `o` INNER JOIN `players` as `p` ON `o`.`player_id` = `p`.`id` LEFT JOIN `guild_membership` gm ON `o`.`player_id` = `gm`.`player_id` LEFT JOIN `guilds` g ON `gm`.`guild_id` = `g`.`id` ';
	if (in_array($order, array('name_asc', 'name_desc', 'guild_asc', 'guild_desc', 'level_asc', 'level_desc', 'vocation_asc', 'vocation_desc'))) {
		if (in_array($order, array('guild_asc', 'guild_desc'))) {
			$q .= ' ORDER BY '.str_replace('guild_', '`g`.`name` ', $order);
		} else {
			$q .= ' ORDER BY '.str_replace('_', ' ', $order);
		}
		$l = array();

		foreach($SQL->query($q)->fetchAll() as $p) {
			$n++;
			$players .= '<tr>';
			$players .= '<td><div style="position: relative; width: 40px; height: 32px;"><div style="background-image: url(http://outfit-images.ots.me/animatedOutfits1080/animoutfit.php?id='.$p['looktype'].'&addons='.$p['addons'].'&head='.$p['head'].'&body='.$p['body'].'&legs='.$p['legs'].'&feet='.$p['feet'].'&mount=0&direction=3); position: absolute; width: 64px; height: 80px; background-position: bottom right; background-repeat: no-repeat; right: 0px; bottom: 0px;"></div></div></td><td>';
			if($order == 'name_asc') {
				$tmp = strtoupper($p['name'][0]);
				if(!in_array($tmp, $l)) {
					$l[] = $tmp;
					$players .= '<a name="'.$tmp.'"></a>';
				}
			}
			$players .= '<a href="?view=characters&name='.urlencode($p['name']).'">'.$p['name'].'</a></td><td>' . ($p['guildName'] ? '<a href="?view=guilds&action=show&guild='. $p['guildId'] .'">'. $p['guildName'] .'</a>' : '') . '</td><td>'.$p['level'].'</td><td>'.str_replace(' ','&#160;',$vocation_name[$p['vocation']]).'</td></tr>';
		}

	}
	file_put_contents($f, $players);
}

$playersOnline = $config['status']['serverStatus_players'];

?>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Online</h3>
		</div>
		<div class="panel-body">
			<?php if ($players) { ?>
				<div class="alert alert-info">There are currently <?PHP echo $playersOnline; ?> player<?php echo ($playersOnline != 1 ? 's' : ''); ?> online on Burmourne.</div>
				<table class="table table-striped table-condensed">
					<thead>
						<tr>
							<th style="width:5%"><a href="#">Outfit</a></th>
							<th><a href="?view=online&order=name_<?php echo ($order == 'name_asc' ? 'desc' : 'asc'); ?>">Name</a></th>
							<th style="width:25%"><a href="?view=online&order=guild_<?php echo ($order == 'guild_asc' ? 'desc' : 'asc'); ?>">Guild</a></th>
							<th style="width:10%"><a href="?view=online&order=level_<?php echo ($order == 'level_asc' ? 'desc' : 'asc'); ?>">Level</a></th>
							<th style="width:20%"><a href="?view=online&order=vocation_<?php echo ($order == 'vocation_asc' ? 'desc' : 'asc'); ?>">Vocation</a></th>
						</tr>
					</thead>
					<tbody>
						<?php echo $players; ?>
					</tbody>
				</table>
			<?php } else { ?>
				<div class="alert alert-info">There are no players online at the moment.</div>
			<?php } ?>
		</div>
	</div>
