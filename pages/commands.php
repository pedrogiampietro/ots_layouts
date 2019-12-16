<?php
if(!defined('INITIALIZED'))
	exit;

$houses = $SQL->query('SELECT COUNT(1) FROM `houses` WHERE `owner` = 0')->fetch();
?>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Commands</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-condensed" id="faq">
				<thead>
					<tr>
						<th style="width:20%"></th>
						<th style="width:80%"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><b>!online</b></td>
						<td>Check how many players are online within the game.</b></td>
					</tr>
						<tr>
						<td><b>!food</b></td>
						<td>You can earn 100 brown mushroom every 10 minutes.</b></td>
					</tr>
						<tr>
						<td><b>!aol</b></td>
						<td>You will buy aol for 10k</b></td>
					</tr>
					<tr>
						<td><b>!uptime</b></td>
						<td>Check how long the server is online from server save.</td>
					</tr>
					<tr>
						<td><b>!kills</b></td>
						<td>Command to show how many frags you have.</td>
					</tr>
						<tr>
						<td><b>!bless</b></td>
						<td>This command is used to buy the <span style="color: #3bafda">all <b>eight</b> blessings</span> including Twist of Fate.
					</tr>
					<tr>
						<td><b>!cast</b></td>
						<td>Open cast for players publicly.</td>
					</tr>
					<tr>
						<td><b>!stopcast</b></td>
						<td>Close the cast if it is open.</td>
					</tr>
					<tr>
						<td><b>!emotespells</b></td><td>Change the color of the spell.</td>
					</tr>
					<tr>
						<td><b>!buyhouse</b></td>
						<td>Buy a house.<br><b>Note:</b> the command should be used in front of the door of the house.</td>
					</tr>
					<tr>
						<td><b>!leavehouse</b></td>
						<td>This command is used for you to leave your home.</td>
					</tr>
						<tr>
						<td><b>!sellhouse</b></td>
						<td>Sells a house to a player (using trade window). In order to sell a house both players must accept a trade, additionally the seller must stand inside the house which is being sold.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>