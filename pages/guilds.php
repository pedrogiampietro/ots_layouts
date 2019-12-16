<?php
if (!defined('INITIALIZED'))
	exit;

//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//show list of guilds
if ($action == '')
{

	$main_content .= '<div class="panel panel-default"><div class="panel-heading">';
	if ($logged)
		$main_content .= '<a class="btn btn-sm btn-success pull-right" style="top:-7px;position:relative;" href="?view=guilds&action=createguild"><i class="fa fa-plus"></i> Create a new guild</a>';
	$main_content .= '<h3 class="panel-title">Guilds</h3></div><div class="panel-body">';

	$guilds_list = new DatabaseList('Guild');
	$guilds_list->addOrder(new SQL_Order(new SQL_Field('name'), SQL_Order::ASC));

	if (count($guilds_list) > 0) {
		$main_content .= '<table class="table table-striped table-condensed"><thead><tr><th>Name</th><th width="20%">Members</th><th width="20%">Average Level</th></tr></thead><tbody>';
		foreach($guilds_list as $guild) {
			$description = $guild->getDescription();
			$newlines   = array("\r\n", "\n", "\r");
			$description_with_lines = str_replace($newlines, '<br />', $description, $count);
			if ($count < $config['site']['guild_description_lines_limit'])
				$description = $description_with_lines;

			$info = $guild->getInfo();
			$main_content .= '<tr><td><a href="?view=guilds&action=show&guild='.$guild->getId().'" data-toggle="tooltip" data-placement="top" data-original-title="'.$description.'">'.htmlspecialchars($guild->getName()).'</a></td><td>'.$info['members'].'</td><td>'.$info['avg'].'</td></tr>';
		}
		$main_content .= '</tbody></table>';
	} else {
		$main_content .= '<div class="alert alert-info">No guilds found.</div>';
	}

	$main_content .= '</div></div>';
}
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//show guild page
if ($action == 'show') {
	$guild_id = (int) $_REQUEST['guild'];
	$guild = new Guild();
	$guild->load($guild_id);
	if (!$guild->isLoaded())
		$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';

	if (!empty($guild_errors)) {
		//show errors
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';

	} else {
		//check is it vice or/and leader account (leader has vice + leader rights)
		$guild_leader_char = $guild->getOwner();
		$rank_list = $guild->getGuildRanksList();
		$guild_leader = FALSE;
		$guild_vice = FALSE;
		if ($logged) {
			$account_players = $account_logged->getPlayers();
			foreach ($account_players as $player) {
				$players_from_account_ids[] = $player->getId();
				$player_rank = $player->getRank();
				if (!empty($player_rank)) {
					foreach ($rank_list as $rank_in_guild) {
						if ($rank_in_guild->getId() == $player_rank->getId()) {
							$players_from_account_in_guild[] = $player->getName();
							if ($player_rank->getLevel() > 1) {
								$guild_vice = TRUE;
								$level_in_guild = $player_rank->getLevel();
							}

							if ($guild->getOwner()->getId() == $player->getId()) {
								$guild_vice = TRUE;
								$guild_leader = TRUE;
							}
						}
					}
				}
			}
		}
?>

		<div class="panel panel-default">
			<div class="panel-heading">
				<?php if ($players_from_account_in_guild > 0 && ($guild_vice || $guild_leader)) { ?>
					<div class="btn-group pull-right" style="top:-9px;position:relative;">
						<a href="#" class="btn btn-primary">Actions</a>
						<a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<?php if ($guild_vice) { ?>
								<li><a href="?view=guilds&action=invite&guild=<?php echo $guild_id; ?>">Invite Player</a></li>
							<?php } ?>

							<?php if ($guild_leader) { ?>
								<li><a href="?view=guilds&action=guildwarstart&guild=<?php echo $guild_id; ?>">Start Guild War</a></li>
								<li><a href="?view=guilds&action=changedescription&guild=<?php echo $guild_id; ?>">Edit Description</a></li>
								<li><a href="?view=guilds&action=deleteguild&guild=<?php echo $guild_id; ?>">Disband Guild</a></li>
								<li><a href="?view=guilds&action=passleadership&guild=<?php echo $guild_id; ?>">Pass Leadership</a></li>
							<?php } ?>
						</ul>
					</div>
				<?php } ?>
				<h3 class="panel-title">Guild: <?php echo $guild->getName(); ?></h3>
			</div>
			<div class="panel-body">
				<p>The guild was founded on <?php echo date("j M Y, H:i:s", $guild->getCreationData()); ?>.</p>
				<p><?php echo htmlspecialchars($guild->getDescription()); ?></p>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#general" data-toggle="tab" aria-expanded="true">General</a></li>
					<li><a href="#statistics" data-toggle="tab" aria-expanded="true">Statistics</a></li>
		  			<li><a href="#activewars" data-toggle="tab" aria-expanded="true">Active Wars</a></li>
		  			<li><a href="#wardeclarations" data-toggle="tab" aria-expanded="true">War Declarations</a></li>
		  			<li><a href="#warhistory" data-toggle="tab" aria-expanded="true">War History</a></li>
				</ul>

				<div id="guildContent" class="tab-content">
					<div class="tab-pane fade active in" id="general">
						<table class="table table-striped">
							<thead>
								<tr>
									<th width="25%">Rank</th>
									<th>Name</th>
									<th width="45%"></th>
								</tr>
							</thead>
							<tbody>
								<?php
								$showed_players = 1;
								foreach ($rank_list as $rank) {
									$players_with_rank = $rank->getPlayersList();
									$players_with_rank_number = count($players_with_rank);
									if ($players_with_rank_number > 0) {
										$first = true;
										foreach($players_with_rank as $player) {
											if ($first) {
								?>				<?php $first = false; ?>
												<tr>
													<td><?php echo htmlspecialchars($rank->getName()); ?></td>
										<?php } else { ?>
												<tr>
													<td></td>
										<?php } ?>

													<td>
														<a href="?view=characters&name=<?php echo urlencode($player->getName()); ?>"><?php echo htmlspecialchars($player->getName()); ?></a>
														<?php
														$guild_nick = $player->getGuildNick();
														if (!empty($guild_nick)) {
															echo ' ('.htmlspecialchars($guild_nick).')';
														}
														?>
													</td>
													<td>
														<div class="pull-right">
															<span class="label label-info"><?php echo $player->getLevel(); ?> <?php echo $vocation_name[$player->getVocation()]; ?></span>

															<?php
															if ($logged) {
																if (in_array($player->getId(), $players_from_account_ids)) {
																	$rank = $player->getRank();
																	if (!empty($rank)) {
																		if ($rank->getLevel() < 3) {
															?>
																			<a class="btn btn-xs btn-warning" style="margin-left:5px;" href="?view=guilds&action=leave&guild=<?php echo $guild->getId(); ?>&name=<?php echo urlencode($player->getName()); ?>"><i class="fa fa-sign-out"></i> Leave</a>
															<?php
																		}
																	}
															?>
																	<a class="btn btn-xs btn-info" style="margin-left:5px;" href="?view=guilds&action=changenick&guild=<?php echo $guild->getId(); ?>&name=<?php echo urlencode($player->getName()); ?>"><i class="fa fa-pencil"></i> Edit Nick</a>
															<?php
																}
															}
															?>


															<?php

															if ($level_in_guild > $rank->getLevel() || $guild_leader) {
																if ($guild_leader_char->getName() != $player->getName()) {
																	?>
																	<?php
																	$rank = $player->getRank();
																	if (!empty($rank) && $rank->getLevel() == 1) {
																	?>

																	<a class="btn btn-xs btn-success" style="margin-left:5px;" href="?view=guilds&action=promote&guild=<?php echo $guild->getId(); ?>&name=<?php echo urlencode($player->getName()); ?>"><i class="fa fa-plus"></i> Promote</a>
																	<?php } else if (!empty($rank) && $rank->getLevel() == 2) { ?>
																	<a class="btn btn-xs btn-danger" style="margin-left:5px;" href="?view=guilds&action=demote&guild=<?php echo $guild->getId(); ?>&name=<?php echo urlencode($player->getName()); ?>"><i class="fa fa-close"></i> Demote</a>
																	<?php } ?>
																<?php
																	if ($logged && $account_logged->getID() != $player->getAccountId()) {
															?>
																		<a class="btn btn-xs btn-danger" style="margin-left:5px;" href="?view=guilds&action=kick&guild=<?php echo $guild->getId(); ?>&name=<?php echo urlencode($player->getName()); ?>"><i class="fa fa-close"></i> Kick</a>
															<?php
																	}
																}
															}
															?>
														</div>
													</td>
												</tr>
								<?php
											}
										}
									}
								?>
								</tbody>
							</table>

						<?php
						$invited_list = $guild->listInvites();
						if (count($invited_list) > 0) {
						?>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Invited characters</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$show_accept_invite = 0;
									$showed_invited = 1;
									foreach($invited_list as $invited_player) {
										if (count($account_players) > 0) {
											foreach($account_players as $player_from_acc) {
												if ($player_from_acc->getName() == $invited_player->getName()) {
													$show_accept_invite++;
												}
											}
										}
									?>
									<tr>
										<td>
											<a href="?view=characters&name=<?php echo urlencode($invited_player->getName()); ?>"><?php echo htmlspecialchars($invited_player->getName()); ?></a>
											<div class="pull-right">
												<?php if ($invited_player->getAccountId() == $account_logged->getID() && $show_accept_invite > 0) { ?>
													<a class="btn btn-xs btn-success" style="margin-right: 5px;" href="?view=guilds&action=join&guild=<?php echo $guild_id; ?>&name=<?php echo urlencode($invited_player->getName()); ?>"><i class="fa fa-plus"></i> Join</a>
												<?php } ?>

												<?php if ($guild_vice) { ?>
													<a class="btn btn-xs btn-danger" href="?view=guilds&action=revokeinvitation&guild=<?php echo $guild_id; ?>&name=<?php echo urlencode($invited_player->getName()); ?>"><i class="fa fa-cross"></i> Remove Invitation</a>
												<?php } ?>
											</div>
										</td>
									</tr>
									<?php } ?>
								</tbody>
							</table>

						<?php } ?>
					</div>

					<?php
						$info = $guild->getInfo();
					?>
					<div class="tab-pane fade" id="statistics">
						<table class="table table-striped">
							<tr>
								<td width="20%">Members Online</td>
								<td><?php echo $info['online']; ?> out of <?php echo $info['members']; ?></td>
							</tr>
							<tr>
								<td width="40%">Highest Level</td>
								<td><a href="?view=characters&name=<?php echo urlencode($info['highest']['name']); ?>"><?php echo $info['highest']['name']; ?></a> (<?php echo $info['highest']['level']; ?>)</td>
							</tr>
							<tr>
								<td width="40%">Average Level</td>
								<td><?php echo $info['avg']; ?></td>
							</tr>
							<tr>
								<td width="40%">Lowest Level</td>
								<td><a href="?view=characters&name=<?php echo urlencode($info['lowest']['name']); ?>"><?php echo $info['lowest']['name']; ?></a> (<?php echo $info['lowest']['level']; ?>)</td>
							</tr>
							<tr>
								<td width="40%">Total Level</td>
								<td><?php echo $info['total']; ?></td>
							</tr>
						</table>
					</div>

					<?php
						$activeData = '';
						$declaredData = '';
						$historyData = '';
						foreach ($guild->getWarIds() as $warId) {
							$war = new GuildWar($warId);
							if ($war->isLoaded()) {

								$guildName = getValidGuildName($war->getGuild1ID(), $war->getGuild1Name());
								$enemyName = getValidGuildName($war->getGuild2ID(), $war->getGuild2Name());
								switch($war->getStatus()) {
									case 0: {
										$declaredData .= '<tr><td>'.$guildName.' has declared war against '.$enemyName;
										if ($guild_leader) {
											$declaredData .= '<div class="pull-right">';

											if ($guild_id == $war->getGuild1ID()) {
												$declaredData .= '<a class="btn btn-mini btn-warning" href="?view=guilds&action=guildwarcancel&guild='.$guild_id.'&warId='.$war->getID().'"><i class="fa fa-close"></i> Cancel</a>';
											}

											if ($guild_id == $war->getGuild2ID()) {
												$declaredData .= '<a class="btn btn-mini btn-success" style="margin-right: 5px;" href="?view=guilds&action=guildwaraccept&guild='.$guild_id.'&warId='.$war->getID().'"><i class="fa fa-plus"></i> Accept</a><a class="btn btn-mini btn-danger" href="?view=guilds&action=guildwarreject&guild='.$guild_id.'&warId='.$war->getID().'"><i class="fa fa-close"></i> Reject</a>';
											}

											$declaredData .= '</div>';
										}
										$declaredData .= '</td><td><a class="btn btn-mini btn-info" href="?view=wars&id='.$war->getId().'">View</a></td></tr>';
										break;
									}

									case 1: {
										$activeData .= '<tr><td>'.$guildName.' are at war against '.$enemyName.'.</td><td>'.date("j M Y, H:i:s", $war->getStarted()).'</td><td><strong>'.$war->getGuild1Kills().'</strong> - <strong>'.$war->getGuild2Kills().'</strong></td><td><a class="btn btn-mini btn-info" href="?view=wars&id='.$war->getId().'">View</a></td></tr>';
										break;
									}

									case 4: {
										$historyData .= '<tr><td>'.$guildName.' were at war against '.$enemyName.'.</td><td>'.date("j M Y, H:i:s", $war->getEnded()).'</td><td><strong>'.$war->getGuild1Kills().'</strong> - <strong>'.$war->getGuild2Kills().'</strong></td><td><a class="btn btn-mini btn-info" href="?view=wars&id='.$war->getId().'">View</a></td></tr>';
										break;
									}

									default: {
										break;
									}
								}
							}
						}
					?>

					<?php $wars = $guild->getWars(); ?>
					<div class="tab-pane fade" id="activewars">
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
										echo '<tr><td colspan="4">' . $guild->getName() . ' are not participating in any war at the moment.</td></tr>';
									} else {
										echo $activeData;
									}
								?>
							</tbody>
						</table>
					</div>

					<div class="tab-pane fade" id="wardeclarations">
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
										echo '<tr><td colspan="2">There are no pending war declarations related to ' . $guild->getName() . '.</td></tr>';
									} else {
										echo $declaredData;
									}
								?>
							</tbody>
						</table>
					</div>

					<div class="tab-pane fade" id="warhistory">
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
										echo '<tr><td colspan="4">' . $guild->getName() . ' does not have any war history.</td></tr>';
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
		<?php
	}
}

//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//show guild page
if ($action == 'invite')
{
	//set rights in guild
	$guild_id = (int) $_REQUEST['guild'];
	$name = $_REQUEST['name'];
	if (!$logged)
		$guild_errors[] = 'You are not logged in. You can\'t invite players.';
	if (empty($guild_errors))
	{
		$guild = new Guild();
		$guild->load($guild_id);
		if (!$guild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';
	}
	if (empty($guild_errors))
	{
		$rank_list = $guild->getGuildRanksList();
		$guild_leader = FALSE;
		$guild_vice = FALSE;
		$account_players = $account_logged->getPlayers();
		foreach($account_players as $player)
		{
			$player_rank = $player->getRank();
			if (!empty($player_rank))
				foreach($rank_list as $rank_in_guild)
					if ($rank_in_guild->getId() == $player_rank->getId())
					{
						$players_from_account_in_guild[] = $player->getName();
						if ($player_rank->getLevel() > 1)
						{
							$guild_vice = TRUE;
							$level_in_guild = $player_rank->getLevel();
						}
						if ($guild->getOwner()->getId() == $player->getId())
						{
							$guild_vice = TRUE;
							$guild_leader = TRUE;
						}
					}
		}
	}
	if (!$guild_vice)
		$guild_errors[] = 'You are not a leader or vice leader of guild ID <b>'.$guild_id.'</b>.';
	if ($_REQUEST['todo'] == 'save')
	{
		if (!check_name($name))
			$guild_errors[] = 'Invalid name format.';
		if (empty($guild_errors))
		{
			$player = new Player();
			$player->find($name);
			if (!$player->isLoaded())
				$guild_errors[] = 'Player with name <b>'.htmlspecialchars($name).'</b> doesn\'t exist.';
			else
			{
				$rank_of_player = $player->getRank();
				if (!empty($rank_of_player))
					$guild_errors[] = 'Player with name <b>'.htmlspecialchars($name).'</b> is already in guild. He must leave guild before you can invite him.';
			}
		}
		if (empty($guild_errors))
		{
			$invited_list = $guild->listInvites();
			if (count($invited_list) > 0)
				foreach($invited_list as $invited)
					if ($invited->getName() == $player->getName())
						$guild_errors[] = '<b>'.htmlspecialchars($player->getName()).'</b> is already invited to your guild.';
		}
	}

	if (!empty($guild_errors)) {
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
	}

	if (empty($guild_errors) && $_REQUEST['todo'] == 'save') {
		$guild->invite($player);
		$main_content .= '
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Invite Player</h3>
			</div>
			<div class="panel-body">
				<p>Player with name <b>'.htmlspecialchars($player->getName()).'</b> has been invited to your guild.</p>
				<div class="text-center">
					<a href="?view=guilds&action=show&guild='.$guild_id.'" class="btn btn-primary">Back</a>
				</div>
			</div>
		</div>';
	} else {
		$main_content .= '
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Invite Player</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="?view=guilds&action=invite&guild='.$guild_id.'&todo=save" method="post">
					<fieldset>

						<div class="form-group">
							<label for="name" class="col-lg-2 control-label">Name</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="name" name="name" placeholder="" maxlength="30" required>
							</div>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							<a href="?view=guilds&action=show&guild='.$guild_id.'" class="btn btn-default">Back</a>
						</div>
					</fieldset>
				</form>
			</div>
		</div>';
	}
}
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//create guild
if ($action == 'createguild')
{
	$new_guild_name = trim($_REQUEST['guild']);
	$name = $_REQUEST['name'];
	$todo = $_REQUEST['todo'];
	if (!$logged)
		$guild_errors[] = 'You are not logged in. You can\'t create guild.';
	if (empty($guild_errors))
	{
		$account_players = $account_logged->getPlayers();
		foreach($account_players as $player)
		{
			$player_rank = $player->getRank();
			if (empty($player_rank))
				if ($player->getLevel() >= $config['site']['guild_need_level'])
					if (!$config['site']['guild_need_pacc'] || $account_logged->isPremium())
						$array_of_player_nig[] = $player->getName();
		}
	}

	if (count($array_of_player_nig) == 0)
		$guild_errors[] = 'On your account all characters are in guilds or have too low level to create new guild.';
	if ($todo == 'save')
	{
		if (!check_guild_name($new_guild_name))
		{
			$guild_errors[] = 'Invalid guild name format.';
		}
		if (!check_name($name))
		{
			$guild_errors[] = 'Invalid character name format.';
		}
		if (empty($guild_errors))
		{
			$player = new Player();
			$player->find($name);
			if (!$player->isLoaded())
				$guild_errors[] = 'Character <b>'.htmlspecialchars($name).'</b> doesn\'t exist.';
		}
		if (empty($guild_errors))
		{
			$guild = new Guild();
			$guild->find($new_guild_name);
			if ($guild->isLoaded())
				$guild_errors[] = 'Guild <b>'.htmlspecialchars($new_guild_name).'</b> already exist. Select another name.';
		}
		if (empty($guild_errors))
		{
			$bad_char = TRUE;
			foreach($array_of_player_nig as $nick_from_list)
				if ($nick_from_list == $player->getName())
					$bad_char = FALSE;
			if ($bad_char)
				$guild_errors[] = 'Character <b>'.htmlspecialchars($name).'</b> isn\'t on your account or is already in guild.';
		}
		if (empty($guild_errors))
		{
			if ($player->getLevel() < $config['site']['guild_need_level'])
				$guild_errors[] = 'Character <b>'.htmlspecialchars($name).'</b> has too low level. To create guild you need character with level <b>'.$config['site']['guild_need_level'].'</b>.';
			if ($config['site']['guild_need_pacc'] && !$account_logged->isPremium())
				$guild_errors[] = 'Character <b>'.htmlspecialchars($name).'</b> is on FREE account. To create guild you need PREMIUM account.';
		}
	}
	if (!empty($guild_errors))
	{
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
		unset($todo);
	}

	if ($todo == 'save')
	{
		$new_guild = new Guild();
		$new_guild->setCreationData(time());
		$new_guild->setName($new_guild_name);
		$new_guild->setOwner($player);
		$new_guild->setDescription('New guild. Leader must edit this text :)');
		$new_guild->setGuildLogo('image/gif', Website::getFileContents('./images/default_guild_logo.gif'));

		$new_guild->save();
		$ranks = $new_guild->getGuildRanksList(true);
		foreach($ranks as $rank)
			if ($rank->getLevel() == 3)
			{
				$player->setRank($rank);
				$player->save();
			}

		$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Create Guild</h3></div><div class="panel-body"><p>Congratulations!</p><p>You have created guild <b>'.htmlspecialchars($new_guild_name).'</b>. <b>'.htmlspecialchars($player->getName()).'</b> is leader of this guild. Now you can invite players, change picture, description and motd of guild. Press submit to open guild manager.</p><div class="text-center"><a class="btn btn-sm btn-primary" href="?view=guilds&action=show&guild='.$new_guild->getId().'">View</a></div></div></div>';
	}
	else
	{

		$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Create Guild</h3></div><div class="panel-body">
			<form class="form-horizontal" role="form" action="?view=guilds&action=createguild&todo=save" method="post">
				<fieldset>

					<div class="form-group">
						<label for="select" class="col-lg-2 control-label">Leader</label>
						<div class="col-lg-10">
							<select class="form-control" name="name">';
							if (count($array_of_player_nig) > 0) {
								sort($array_of_player_nig);
								foreach($array_of_player_nig as $nick)
									$main_content .= '<option value="'.htmlspecialchars($nick).'">'.htmlspecialchars($nick).'</option>';
							}

							$main_content .= '</select>
						</div>
					</div>

					<div class="form-group">
						<label for="guild" class="col-lg-2 control-label">Guild Name</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="guild" name="guild" placeholder="" maxlength="50" required>
						</div>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Submit</button>
						<a class="btn btn-default" href="?view=guilds">Back</a>
					</div>

				</fieldset>
			</form>';

		$main_content .= '</div></div>';
	}
}
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
if ($action == 'changedescription')
{
	$guild_id = (int) $_REQUEST['guild'];
	if (empty($guild_errors)) {
		$guild = new Guild();
		$guild->load($guild_id);
		if (!$guild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';
	}

	if (empty($guild_errors)) {
		if (!$logged) {
			$guild_errors[] = 'You are not logged in. You cannot change the guild description for this guild.';
		}

		$guild_leader_char = $guild->getOwner();
		$rank_list = $guild->getGuildRanksList();
		$guild_leader = FALSE;
		$account_players = $account_logged->getPlayers();
		foreach($account_players as $player) {
			if ($guild->getOwner()->getId() == $player->getId()) {
				$guild_vice = TRUE;
				$guild_leader = TRUE;
				$level_in_guild = 3;
			}
		}

		if (!$guild_leader) {
			$guild_errors[] = 'You are not the leader of this guild!';
		}
	}

	if (!empty($guild_errors)) {
		foreach($guild_errors as $guild_error) {
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
		}
	}

	if (empty($guild_errors) && $_REQUEST['todo'] == 'save') {
		$description = htmlspecialchars(substr(trim($_REQUEST['description']),0,$config['site']['guild_description_chars_limit']));
		$guild->set('description', $description);
		$guild->save();

		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Guild Description</h3></div>
				<div class="panel-body">
					<p>The guild description has been changed.</p><br>
					<div class="text-center">
						<a class="btn btn-primary" href="?view=guilds&action=show&guild='.$guild_id.'">Back</a>
					</div>
				</div>
			</div>
		';
	} else {
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Edit Guild Description for <b>'.htmlspecialchars($guild->getName()).'</b></h3></div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="?view=guilds&action=changedescription&guild='.$guild_id.'" method="post">
						<input type="hidden" name="todo" value="save" />
						<fieldset>
							<div class="form-group">
								<label for="desc" class="col-lg-2 control-label">Description</label>
								<div class="col-lg-10">
									<textarea class="form-control" rows="'.($config['site']['guild_description_lines_limit'] - 1).'" id="description" name="description">'.$guild->getDescription().'</textarea>
								</div>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary" value="Save description">Save</button>
								<a class="btn btn-default" href="?view=guilds&action=show&guild='.$guild_id.'">Back</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		';
	}
}

//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
if ($action == 'passleadership')
{
	$guild_id = (int) $_REQUEST['guild'];
	$pass_to = trim($_REQUEST['player']);
	if (empty($guild_errors)) {
		$guild = new Guild();
		$guild->load($guild_id);

		if (!$guild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';
	}

	if (empty($guild_errors)) {
		if ($_POST['todo'] == 'save') {

			if (!check_name($pass_to))
				$guild_errors2[] = 'Invalid player name format.';

			if (empty($guild_errors2)) {
				$to_player = new Player();
				$to_player->find($pass_to);

				if (!$to_player->isLoaded())
					$guild_errors2[] = 'Player with name <b>'.htmlspecialchars($pass_to).'</b> doesn\'t exist.';

				if (empty($guild_errors2)) {
					$to_player_rank = $to_player->getRank();
					if (!empty($to_player_rank)) {
						$to_player_guild = $to_player_rank->getGuild();
						if ($to_player_guild->getId() != $guild->getId())
							$guild_errors2[] = 'Player with name <b>'.htmlspecialchars($to_player->getName()).'</b> isn\'t from your guild.';
					} else {
						$guild_errors2[] = 'Player with name <b>'.htmlspecialchars($to_player->getName()).'</b> isn\'t from your guild.';
					}
				}
			}
		}
	}

	if (empty($guild_errors) && empty($guild_errors2)) {
		if (!$logged) {
			$guild_errors[] = 'You are not logged in. You cannot pass the leadership to another player.';
		}

		$guild_leader_char = $guild->getOwner();
		$guild_leader = FALSE;
		$account_players = $account_logged->getPlayers();
		foreach ($account_players as $player) {
			if ($guild_leader_char->getId() == $player->getId()) {
				$guild_vice = TRUE;
				$guild_leader = TRUE;
				$level_in_guild = 3;
			}
		}

		if (!$guild_leader) {
			$guild_errors[] = 'You are not the leader of this guild!';
		}
	}

	if (!empty($guild_errors)) {
		foreach($guild_errors as $guild_error) {
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
		}
	}

	if (!empty($guild_errors2)) {
		foreach($guild_errors2 as $guild_error2) {
			$main_content .= '<div class="alert alert-danger">'.$guild_error2.'</div>';
		}
	}

	if (empty($guild_errors) && empty($guild_errors2) && $_POST['todo'] == 'save') {
		$guild->setOwner($to_player);
		$guild->save();
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Pass Leadership</h3></div>
				<div class="panel-body">
					<p>The leadership has been passed onto <b>'.htmlspecialchars($to_player->getName()).'</b>. <b>'.htmlspecialchars($to_player->getName()).'</b> is now the leader of <b>'.htmlspecialchars($guild->getName()).'</b>.</p><br>
					<div class="text-center">
						<a class="btn btn-primary" href="?view=guilds&action=show&guild='.$guild_id.'">Back</a>
					</div>
				</div>
			</div>
		';
	} else {
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Pass Leadership</h3></div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="?view=guilds&guild='.$guild_id.'&action=passleadership" method="post">
						<input type="hidden" name="todo" value="save">
						<fieldset>
							<div class="form-group">
								<label for="player" class="col-lg-2 control-label">Name</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="player" name="player" placeholder="2 to 30 characters" maxlength="30" required>
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary" value="Save">Submit</button>
								<a class="btn btn-default" href="?view=guilds&action=show&guild='.$guild_id.'">Back</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		';
	}

}
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
if ($action == 'deleteguild')
{
	$guild_id = (int) $_REQUEST['guild'];
	if (empty($guild_errors)) {
		$guild = new Guild();
		$guild->load($guild_id);
		if (!$guild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';
	}

	if (!$logged) {
		$guild_errors[] = 'You are not logged. You cannot disband a guild.';
	}

	$guild_leader_char = $guild->getOwner();
	$rank_list = $guild->getGuildRanksList();
	$guild_leader = FALSE;
	$account_players = $account_logged->getPlayers();
	foreach($account_players as $player) {
		if ($guild->getOwner()->getId() == $player->getId()) {
			$guild_vice = TRUE;
			$guild_leader = TRUE;
			$level_in_guild = 3;
		}
	}

	if (!$guild_leader) {
		$guild_errors[] = 'You are not a leader of guild!';
	}

	if (!empty($guild_errors)) {
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
	}

	if (empty($guild_errors) && $_REQUEST['todo'] == 'save') {
		$guild->delete();
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Guild Disbanded</h3></div>
				<div class="panel-body">
					<p>Your guild has been disbanded.</p><br>
					<div class="text-center">
						<a class="btn btn-primary" href="?view=guilds">Back</a>
					</div>
				</div>
			</div>
		';
	} else {
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Disband Guild</h3></div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="?view=guilds&guild='.$guild_id.'&action=deleteguild" method="post">
						<input type="hidden" name="todo" value="save">
						<fieldset>
							<p>Are you sure you want to disband the guild?</p><br>
							<div class="text-center">
								<button type="submit" class="btn btn-danger" value="Yes, delete">Delete</button>
								<a class="btn btn-default" href="?view=guilds&action=show&guild='.$guild_id.'">Back</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		';
	}
}

if ($action == 'changenick') {
	if (!$logged) {
		$errors[] = 'You have to be logged in, in order to change your guild nickname.';
	}

	$guild_id = (int) $_REQUEST['guild'];
	$player_n = $_REQUEST['name'];
	$new_nick = $_REQUEST['nick'];
	$player = new Player();
	$player->find($player_n);
	$player_from_account = FALSE;
	if (strlen($new_nick) > 15) {
		$errors[] = 'The nickname is too long!';
	}

	if (!$player->isLoaded()) {
		$errors[] = 'Unknown error occured.';
	}

	$account_players = $account_logged->getPlayersList();
	if (count($account_players) > 0) {
		foreach($account_players as $acc_player) {
			if ($acc_player->getId() == $player->getId()) {
				$player_from_account = TRUE;
			}
		}
	}
	if (!$player_from_account) {
		$errors[] = 'This player is not from your account.';
	}

	if (!empty($errors)) {
		foreach($errors as $error) {
			$main_content .= '<div class="alert alert-danger">'.$error.'</div>';
		}
	}

	if (empty($errors) && $_REQUEST['todo'] == 'save') {
		$player->setGuildNick($new_nick);
		$player->save();
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Nickname for '.htmlspecialchars($player->getName()).' changed</h3></div>
				<div class="panel-body">
					<p>You have changed your guild nickname to <b>'.htmlspecialchars($new_nick).'</b>.</p><br>
					<div class="text-center">
						<a class="btn btn-primary" href="?view=guilds&action=show&guild='.$guild_id.'">Back</a>
					</div>
				</div>
			</div>
		';

	} else {
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Edit nickname for <b>'.htmlspecialchars($player->getName()).'</b></h3></div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="?view=guilds&action=changenick&guild='.$guild_id.'&name='.urlencode($player->getName()).'" method="post">
						<input type="hidden" name="todo" value="save" />
						<fieldset>
							<div class="form-group">
								<label for="nick" class="col-lg-2 control-label">Nick</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="nick" name="nick" placeholder="'.htmlspecialchars($player->getGuildNick()).'" maxlength="15" required>
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary" value="Save nick">Save</button>
								<a class="btn btn-default" href="?view=guilds&action=show&guild='.$guild_id.'">Back</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		';

	}
}

if ($action == 'promote') {
	$name = trim($_GET['name']);
	$gid = (int) $_GET['guild'];
	if (empty($name) || empty($gid) || !$logged) {
		header("Location: ?view=guilds");
		return;
	}

	$guild = getGuild($gid);
	if (!$guild) {
		header("Location: ?view=guilds");
		return;
	}

	$accIsInGuild = $account_logged->isInGuild($gid);
	if (!$accIsInGuild) {
		header("Location: ?view=guilds");
		return;
	}

	$accGuildLevel = $account_logged->getGuildLevel($gid);
	if ($accGuildLevel < 3) {
		header("Location: ?view=guilds");
		return;
	}

	$player = getPlayer($name);
	if (!$player || !$player->isInGuild($gid)) {
		header("Location: ?view=guilds");
		return;
	}

	$playerRank = $player->getRank();
	if (empty($playerRank) || $playerRank->getLevel() != 1) {
		header('Location: ?view=guilds');
		return;
	}

	$ranks = $guild->getGuildRanksList(true);
	foreach ($ranks as $rank) {
		if ($rank->getLevel() == 2) {
			$player->setRank($rank);
			$player->save();
			break;
		}
	}

	header('Location: ?view=guilds&action=show&guild='.urlencode($gid));
}

if ($action == 'demote') {
	$name = trim($_GET['name']);
	$gid = (int) $_GET['guild'];
	if (empty($name) || empty($gid) || !$logged) {
		header("Location: ?view=guilds");
		return;
	}

	$guild = getGuild($gid);
	if (!$guild) {
		header("Location: ?view=guilds");
		return;
	}

	$accIsInGuild = $account_logged->isInGuild($gid);
	if (!$accIsInGuild) {
		header("Location: ?view=guilds");
		return;
	}

	$accGuildLevel = $account_logged->getGuildLevel($gid);
	if ($accGuildLevel < 3) {
		header("Location: ?view=guilds");
		return;
	}

	$player = getPlayer($name);
	if (!$player || !$player->isInGuild($gid)) {
		header("Location: ?view=guilds");
		return;
	}

	$playerRank = $player->getRank();
	if (empty($playerRank) || $playerRank->getLevel() != 2) {
		header('Location: ?view=guilds');
		return;
	}

	$ranks = $guild->getGuildRanksList(true);
	foreach ($ranks as $rank) {
		if ($rank->getLevel() == 1) {
			$player->setRank($rank);
			$player->save();
			break;
		}
	}

	header('Location: ?view=guilds&action=show&guild='.urlencode($gid));
}

if ($action == 'join') {
	$name = trim($_GET['name']);
	$gid = (int) $_GET['guild'];
	if (empty($name) || empty($gid) || !$logged) {
		header("Location: ?view=guilds");
		return;
	}

	$guild = getGuild($gid);
	if (!$guild || !$guild->hasInvited($name)) {
		header("Location: ?view=guilds");
		return;
	}

	$player = getPlayer($name);
	if (!$player || $player->hasGuild()) {
		header("Location: ?view=guilds");
		return;
	}

	$account = $player->getAccount();
	if ($account->getID() != $account_logged->getID()) {
		header("Location: ?view=guilds");
		return;
	}

	$guild->acceptInvite($player);
	header('Location: ?view=guilds&action=show&guild='.urlencode($gid));
}

if ($action == 'leave') {
	$name = trim($_GET['name']);
	$gid = (int) $_GET['guild'];
	if (empty($name) || empty($gid) || !$logged) {
		header("Location: ?view=guilds");
		return;
	}

	$player = getPlayer($name);
	if (!$player || !$player->isInGuild($gid)) {
		header("Location: ?view=guilds");
		return;
	}

	$account = $player->getAccount();
	if ($account->getID() != $account_logged->getID()) {
		header("Location: ?view=guilds");
		return;
	}

	$player->setRank();
	$player->save();
	header('Location: ?view=guilds&action=show&guild='.urlencode($gid));
}

if ($action == 'kick') {
	$name = trim($_GET['name']);
	$gid = (int) $_GET['guild'];
	if (empty($name) || empty($gid) || !$logged) {
		header("Location: ?view=guilds");
		return;
	}

	$accIsInGuild = $account_logged->isInGuild($gid);
	if (!$accIsInGuild) {
		header("Location: ?view=guilds");
		return;
	}

	$accGuildLevel = $account_logged->getGuildLevel($gid);
	if ($accGuildLevel < 2) {
		header("Location: ?view=guilds");
		return;
	}

	$player = getPlayer($name);
	if (!$player || !$player->isInGuild($gid)) {
		header("Location: ?view=guilds");
		return;
	}

	$player->setRank();
	$player->save();
	header('Location: ?view=guilds&action=show&guild='.urlencode($gid));
}

if ($action == 'revokeinvitation') {
	$name = trim($_GET['name']);
	$gid = (int) $_GET['guild'];
	if (empty($name) || empty($gid) || !$logged) {
		header("Location: ?view=guilds");
		return;
	}

	$guild = getGuild($gid);
	if (!$guild || !$guild->hasInvited($name)) {
		header("Location: ?view=guilds");
		return;
	}

	$accIsInGuild = $account_logged->isInGuild($gid);
	if (!$accIsInGuild) {
		header("Location: ?view=guilds");
		return;
	}

	$accGuildLevel = $account_logged->getGuildLevel($gid);
	if ($accGuildLevel < 2) {
		header("Location: ?view=guilds");
		return;
	}

	$player = getPlayer($name);
	if (!$player || $player->isInGuild($gid)) {
		header("Location: ?view=guilds");
		return;
	}

	$guild->deleteInvite($player);
	header('Location: ?view=guilds&action=show&guild='.urlencode($gid));
}

if ($action == 'guildwaraccept')
{
	$guild_id = (int) $_REQUEST['guild'];
	$war_id = (int) $_REQUEST['warId'];
	if (!$logged)
		$guild_errors[] = 'You are not logged.';
	if (empty($guild_errors)) {
		$guild = new Guild($guild_id);
		if (!$guild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';
		if (empty($guild_errors)) {
			$guild_leader_char = $guild->getOwner();
			$guild_leader = FALSE;
			$account_players = $account_logged->getPlayers();
			foreach($account_players as $player) {
				if ($guild_leader_char->getId() == $player->getId()) {
					$guild_leader = TRUE;
				}
			}
			if ($guild_leader) {
				$war = new GuildWar($war_id);
				if (!$war->isLoaded())
					$guild_errors[] = 'War with ID <b>'.$war_id.'</b> doesn\'t exist.';

				if (empty($guild_errors)) {
					if ($war->getGuild2ID() != $guild->getID() || $war->getStatus() != GuildWar::STATE_INVITED) {
						$guild_errors[] = 'Your guild is not invited to that war.';
					}

					if (empty($guild_errors)) {
						$war->setStatus(GuildWar::STATE_ON_WAR);
						$war->setStarted(time());
						$war->setEnded(0);
						$war->save();
						header("Location: ?view=guilds&action=show&guild=".$guild_id."");
					}
				}
			} else
				$guild_errors[] = 'You are not a leader of guild!';
		}
	}
	if (!empty($guild_errors)) {
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
	}
}
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
if ($action == 'guildwarreject')
{
	$guild_id = (int) $_REQUEST['guild'];
	$war_id = (int) $_REQUEST['warId'];
	if (!$logged)
		$guild_errors[] = 'You are not logged.';
	if (empty($guild_errors)) {
		$guild = new Guild($guild_id);
		if (!$guild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';
		if (empty($guild_errors)) {
			$guild_leader_char = $guild->getOwner();
			$guild_leader = FALSE;
			$account_players = $account_logged->getPlayers();
			foreach($account_players as $player) {
				if ($guild_leader_char->getId() == $player->getId()) {
					$guild_leader = TRUE;
				}
			}
			if ($guild_leader) {
				$war = new GuildWar($war_id);
				if (!$war->isLoaded())
					$guild_errors[] = 'War with ID <b>'.$war_id.'</b> doesn\'t exist.';

				if (empty($guild_errors)) {
					if ($war->getGuild2ID() != $guild->getID() || $war->getStatus() != GuildWar::STATE_INVITED) {
						$guild_errors[] = 'Your guild is not invited to that war.';
					}

					if (empty($guild_errors)) {
						$war->setStatus(GuildWar::STATE_REJECTED);
						$war->setEnded(time());
						$war->save();
						header("Location: ?view=guilds&action=show&guild=".$guild_id."");
					}
				}
			} else
				$guild_errors[] = 'You are not a leader of guild!';
		}
	}
	if (!empty($guild_errors)) {
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
	}
}
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
if ($action == 'guildwarcancel')
{
	$guild_id = (int) $_REQUEST['guild'];
	$war_id = (int) $_REQUEST['warId'];
	if (!$logged)
		$guild_errors[] = 'You are not logged.';
	if (empty($guild_errors)) {
		$guild = new Guild($guild_id);
		if (!$guild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';
		if (empty($guild_errors)) {
			$guild_leader_char = $guild->getOwner();
			$guild_leader = FALSE;
			$account_players = $account_logged->getPlayers();
			foreach($account_players as $player) {
				if ($guild_leader_char->getId() == $player->getId()) {
					$guild_leader = TRUE;
				}
			}
			if ($guild_leader) {
				$war = new GuildWar($war_id);
				if (!$war->isLoaded())
					$guild_errors[] = 'War with ID <b>'.$war_id.'</b> doesn\'t exist.';

				if (empty($guild_errors)) {
					if ($war->getGuild1ID() != $guild->getID() || $war->getStatus() != GuildWar::STATE_INVITED) {
						$guild_errors[] = 'Your guild is not invited to this war.';
					}

					if (empty($guild_errors)) {
						$war->setStatus(GuildWar::STATE_CANCELED);
						$war->setEnded(time());
						$war->save();
						header("Location: ?view=guilds&action=show&guild=".$guild_id."");
					}
				}
			} else
				$guild_errors[] = 'You are not a leader of guild!';
		}
	}
	if (!empty($guild_errors))
	{
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
	}
}

//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
if ($action == 'guildwarstart')
{
	$guild_id = (int) $_REQUEST['guild'];
	if (!$logged)
		$guild_errors[] = 'You are not logged.';
	if (empty($guild_errors)) {
		$guild = new Guild($guild_id);
		if (!$guild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> doesn\'t exist.';
		if (empty($guild_errors)) {
			$guild_leader_char = $guild->getOwner();
			$guild_leader = FALSE;
			$account_players = $account_logged->getPlayers();
			foreach($account_players as $player) {
				if ($guild_leader_char->getId() == $player->getId()) {
					$guild_leader = TRUE;
				}
			}
			if ($guild_leader) {
				$currentWars = array();
				$wars = new DatabaseList('GuildWar');
				foreach($wars as $war)
				{
					if ($war->getStatus() == GuildWar::STATE_INVITED || $war->getStatus() == GuildWar::STATE_ON_WAR)
					{
						if ($war->getGuild1ID() == $guild->getID())
							$currentWars[$war->getGuild2ID()] = $war->getStatus();
						elseif ($war->getGuild2ID() == $guild->getID())
							$currentWars[$war->getGuild1ID()] = $war->getStatus();
					}
				}

				$guildsList = new DatabaseList('Guild');
				$guildsList->addOrder(new SQL_Order(new SQL_Field('name'), SQL_Order::ASC));
				$shown_guilds = 0;

				$optionsData = '';
				foreach($guildsList as $enemyGuild) {
					if ($enemyGuild->getID() != $guild->getID()) {
						if (!isset($currentWars[$enemyGuild->getID()])) {
							$optionsData .= '<option value="' . $enemyGuild->getID() . '">'.htmlspecialchars($enemyGuild->getName()).'</option>';
						}
					}
				}

				$main_content .= '
					<div class="panel panel-default">
						<div class="panel-heading"><h3 class="panel-title">War Declaration</h3></div>
						<div class="panel-body">
							<form class="form-horizontal" role="form" action="?view=guilds&action=guildwarinvite&guild='.$guild_id.'" method="post">
								<fieldset>';
								if (!empty($optionsData)) {
									$main_content .= '
										<div class="form-group">
											<label for="select" class="col-lg-3 control-label">Opponent guild</label>
											<div class="col-lg-9">
												<select class="form-control" name="enemy">
													'.$optionsData.'
												</select>
											</div>
										</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Send a war declaration</button>
										<a href="?view=guilds&action=show&guild='.$guild_id.'" class="btn btn-default">Back</a>
									</div>
									';
								} else {
									$main_content .= '
										<p>There are no guilds to declare against at the moment.</p>
										<div class="text-center">
											<a href="?view=guilds&action=show&guild='.$guild_id.'" class="btn btn-primary">Back</a>
										</div>
									';
								}

								$main_content .= '
								</fieldset>
							</form>
						</div>
					</div>
				';
			} else
				$guild_errors[] = 'You are not a leader of guild!';
		}
	}
	if (!empty($guild_errors))
	{
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
	}
}


//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------//-----------------------------------------------------------------------------
if ($action == 'guildwarinvite')
{
	$guild_id = (int) $_REQUEST['guild'];
	$enemy_id = (int) $_POST['enemy'];
	var_dump($guild_id);
	var_dump($enemy_id);
	if (!$logged)
		$guild_errors[] = 'You are not logged.';
	if (empty($guild_errors)) {
		$guild = new Guild($guild_id);
		$enemyGuild = new Guild($enemy_id);
		if (!$guild->isLoaded() || !$enemyGuild->isLoaded())
			$guild_errors[] = 'Guild with ID <b>'.$guild_id.'</b> or ID <b>'.$enemy_id.'</b> doesn\'t exist.';
		if (empty($guild_errors)) {
			$guild_leader_char = $guild->getOwner();
			$guild_leader = FALSE;
			$account_players = $account_logged->getPlayers();
			foreach($account_players as $player) {
				if ($guild_leader_char->getId() == $player->getId()) {
					$guild_leader = TRUE;
				}
			}
			if ($guild_leader) {
				if ($enemyGuild->getID() != $guild->getID()) {
					$currentWars = array();
					$wars = new DatabaseList('GuildWar');
					foreach($wars as $war) {
						if ($war->getStatus() == GuildWar::STATE_INVITED || $war->getStatus() == GuildWar::STATE_ON_WAR) {
							if ($war->getGuild1ID() == $guild->getID())
								$currentWars[$war->getGuild2ID()] = $war->getStatus();
							elseif ($war->getGuild2ID() == $guild->getID())
								$currentWars[$war->getGuild1ID()] = $war->getStatus();
						}
					}
					if (isset($currentWars[$enemyGuild->getID()])) {
						// in war or invited
						if ($currentWars[$enemyGuild->getID()] == GuildWar::STATE_INVITED) {
							// guild already invited you or you invited that guild
							$guild_errors[] = 'There is already invitation between your and this guild.';
						} else {
							// you are on war with this guild
							$guild_errors[] = 'There is already war between your and this guild.';
						}
					} else {
						// can invite
						$war = new GuildWar();
						$war->setGuild1ID($guild->getID());
						$war->setGuild2ID($enemyGuild->getID());
						$war->setGuild1Name($guild->getName());
						$war->setGuild2Name($enemyGuild->getName());
						$war->setStatus(GuildWar::STATE_INVITED);
						$war->setStarted(time());
						$war->setEnded(0);
						$war->setLimit(isset($_POST['limit']) ? (int) $_POST['limit'] : 100);
						$war->save();
						header("Location: ?view=guilds&action=show&guild=".$guild_id."");
					}
				} else {
					$guild_errors[] = 'You cannot invite same guild!';
				}
			} else
				$guild_errors[] = 'You are not a leader of guild!';
		}
	}
	if (!empty($guild_errors)) {
		foreach($guild_errors as $guild_error)
			$main_content .= '<div class="alert alert-danger">'.$guild_error.'</div>';
	}
}

