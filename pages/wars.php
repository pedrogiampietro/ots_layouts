<?php
if(!defined('INITIALIZED'))
	exit;

if (!empty($_GET['id'])) {

	$warId = (int) $_GET['id'];
	$war = new GuildWar($warId);
	if (!$war->isLoaded()) {
		header("Location: ?view=wars");
		return;
	}

	// Aggressor Info
	$aggressorName = getValidGuildName($war->getGuild1ID(), $war->getGuild1Name());
	$aggressorMostKills = $war->getMostKills($war->getGuild1ID());
	$aggressorMostDeaths = $war->getMostDeaths($war->getGuild1ID());
	$aggressorMostKillsName = getValidPlayerName($aggressorMostKills['name']);
	$aggressorMostDeathsName = getValidPlayerName($aggressorMostDeaths['name']);

	// Enemy Info
	$enemyName = getValidGuildName($war->getGuild2ID(), $war->getGuild2Name());
	$enemyMostKills = $war->getMostKills($war->getGuild2ID());
	$enemyMostDeaths = $war->getMostDeaths($war->getGuild2ID());
	$enemyMostKillsName = getValidPlayerName($enemyMostKills['name']);
	$enemyMostDeathsName = getValidPlayerName($enemyMostDeaths['name']);

	?>

	<div class="panel panel-default">
		<div class="panel-heading"><a class="btn btn-sm btn-default pull-right" style="top:-7px;position:relative;" href="?view=wars">See all guild wars</a><h3 class="panel-title">Guild War: <?php echo htmlspecialchars($war->getGuild1Name()) .' vs ' . htmlspecialchars($war->getGuild2Name()); ?></h3></div>
		<div class="panel-body">
			<div class="panel panel-primary">
				<div class="panel-heading"><h3 class="panel-title">Information</h3></div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-6">
							<table class="table table-condensed table-content">
								<thead>
									<tr>
										<th colspan="2"><span style="font-size:20px;"><?php echo $aggressorName . ' <span class="pull-right" style="color:green;">' . $war->getGuild1Kills() . '</span></span>'; ?></th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><strong>Most Kills</strong></td>
										<td><strong>Most Deaths</strong></td>
									</tr>
										<tr>
											<?php
												if (!empty($aggressorMostKillsName)) {
													echo '<td>'.$aggressorMostKillsName.' ('.$aggressorMostKills['frags'].')</td>';
												} else echo '<td></td>';

												if (!empty($aggressorMostDeathsName)) {
													echo '<td>'.$aggressorMostDeathsName.' ('.$aggressorMostDeaths['deaths'].')</td>';
												} else echo '<td></td>';
											?>
										</tr>
								</tbody>
							</table>
						</div>
						<div class="col-xs-6">
							<table class="table table-condensed table-content">
								<thead>
									<tr>
										<th colspan="2"><span style="font-size:20px;"><?php echo $enemyName . ' <span class="pull-right" style="color:red;">' . $war->getGuild2Kills() . '</span></span>'; ?></th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><strong>Most Kills</strong></td>
										<td><strong>Most Deaths</strong></td>
									</tr>
									<tr>
										<?php
											if (!empty($enemyMostKillsName)) {
												echo '<td>'.$enemyMostKillsName.' ('.$enemyMostKills['frags'].')</td>';
											} else echo '<td></td>';

											if (!empty($enemyMostDeathsName)) {
												echo '<td>'.$enemyMostDeathsName.' ('.$enemyMostDeaths['deaths'].')</td>';
											} else echo '<td></td>';
										?>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-primary">
				<div class="panel-heading"><h3 class="panel-title">Deathlist</h3></div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-6">
							<table class="table table-condensed table-content">
								<thead>
									<tr>
										<th colspan="3"><div class="text-center"><span style="font-size:20px;"><?php echo $aggressorName; ?></span></div></th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td width="25%"><strong>Killer</strong></td>
										<td width="25%"><strong>Victim</strong></td>
										<td><strong>Time</strong></td>
									</tr>
									<?php
										if (count($war->getGuild1KillsInfo()) > 0) {
											foreach($war->getGuild1KillsInfo() as $tmp) {
												$killerName = getValidPlayerName($tmp['killer']);
												$targetName = getValidPlayerName($tmp['target']);
												echo '<tr><td>'.$killerName.'</td><td>'.$targetName.'</td><td>'.date("j F Y, g:i a", $tmp['time']).'</td></tr>';
											}
										} else echo '<tr><td></td><td></td><td></td></tr>';
									?>
								</tbody>
							</table>
						</div>
						<div class="col-xs-6">
							<table class="table table-condensed table-content">
								<thead>
									<tr>
										<th colspan="3"><div class="text-center"><span style="font-size:20px;"><?php echo $enemyName; ?></span></div></th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td width="25%"><strong>Killer</strong></td>
										<td width="25%"><strong>Victim</strong></td>
										<td><strong>Time</strong></td>
									</tr>
									<?php
										if (count($war->getGuild2KillsInfo()) > 0) {
											foreach($war->getGuild2KillsInfo() as $tmp) {
												$killerName = getValidPlayerName($tmp['killer']);
												$targetName = getValidPlayerName($tmp['target']);
												echo '<tr><td>'.$killerName.'</td><td>'.$targetName.'</td><td>'.date("j F Y, g:i a", $tmp['time']).'</td></tr>';;
											}
										} else echo '<tr><td></td><td></td><td></td></tr>';
									?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<?php
} else {

	$activeData = '';
	$declaredData = '';
	$historyData = '';
	foreach ($SQL->query('SELECT `guild_wars`.*, (SELECT COUNT(1) FROM `guildwar_kills` WHERE `guildwar_kills`.`warid` = `guild_wars`.`id` AND `guildwar_kills`.`killerguild` = `guild_wars`.`guild1`) guild1_kills, (SELECT COUNT(1) FROM `guildwar_kills` WHERE `guildwar_kills`.`warid` = `guild_wars`.`id` AND `guildwar_kills`.`killerguild` = `guild_wars`.`guild2`) guild2_kills FROM `guild_wars` ORDER BY `started` DESC') as $war) {

		$guildName = htmlspecialchars($war['name1']);
		$guild = getGuild($war['guild1']);
		if ($guild) {
			$guildName = '<a href="?view=guilds&action=show&guild='.urlencode($war['guild1']).'">'.htmlspecialchars($war['name1']).'</a>';
		}

		$enemyName = htmlspecialchars($war['name2']);
		$enemy = getGuild($war['guild2']);
		if ($enemy) {
			$enemyName = '<a href="?view=guilds&action=show&guild='.urlencode($war['guild2']).'">'.htmlspecialchars($war['name2']).'</a>';
		}

		switch ($war['status']) {
			case 0: {
				$declaredData .= '<tr><td>'.$guildName.' has declared war against '.$enemyName.'</td><td><a class="btn btn-mini btn-info" href="?view=wars&id='.$war['id'].'">View</a></td></tr>';
				break;
			}

			case 1: {
				$activeData .= '<tr><td>'.$guildName.' are at war against '.$enemyName.'.</td><td>'.date("j M Y, H:i:s", $war['started']).'</td><td><strong>'.$war['guild1_kills'].'</strong> - <strong>'.$war['guild2_kills'].'</strong></td><td><a class="btn btn-mini btn-info" href="?view=wars&id='.$war['id'].'">View</a></td></tr>';
				break;
			}

			case 4: {
				$historyData .= '<tr><td>'.$guildName.' were at war against '.$enemyName.'.</td><td>'.date("j M Y, H:i:s", $war['ended']).'</td><td><strong>'.$war['guild1_kills'].'</strong> - <strong>'.$war['guild2_kills'].'</strong></td><td><a class="btn btn-mini btn-info" href="?view=wars&id='.$war['id'].'">View</a></td></tr>';
				break;
			}

			default: {
				break;
			}
		}
	}

?>
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title">Guild Wars</h3></div>
		<div class="panel-body">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#active" data-toggle="tab" aria-expanded="true">Active</a></li>
				<li><a href="#declarations" data-toggle="tab" aria-expanded="true">Declarations</a></li>
				<li><a href="#history" data-toggle="tab" aria-expanded="true">History</a></li>
			</ul>

			<div id="warsTabContent" class="tab-content">
				<!-- Active Wars -->
				<div class="tab-pane fade active in" id="active">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Description</th>
								<th style="width:25%">Started</th>
								<th style="width:12%">Stats</th>
								<th style="width:10%">Details</th>
							</tr>
						</thead>
						<tbody>
							<?php
								if (!$activeData) {
									echo '<tr><td colspan="4">There are no active wars at the moment.</td></tr>';
								} else {
									echo $activeData;
								}
							?>
						</tbody>
					</table>
				</div>

				<!-- War Declarations -->
				<div class="tab-pane fade" id="declarations">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Description</th>
								<th style="width:10%">Details</th>
							</tr>
						</thead>
						<tbody>
							<?php
								if (!$declaredData) {
									echo '<tr><td colspan="2">There are no pending war declarations at the moment.</td></tr>';
								} else {
									echo $declaredData;
								}
							?>
						</tbody>
					</table>
				</div>

				<!-- War History -->
				<div class="tab-pane fade" id="history">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Description</th>
								<th style="width:25%">Ended</th>
								<th style="width:12%">Stats</th>
								<th style="width:10%">Details</th>
							</tr>
						</thead>
						<tbody>
							<?php
								if (!$historyData) {
									echo '<tr><td colspan="4">There are currently no war history available.</td></tr>';
								} else {
									echo $historyData;
								}
							?>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
<?php } ?>
