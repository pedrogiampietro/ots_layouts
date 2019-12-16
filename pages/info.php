<?php
if(!defined('INITIALIZED'))
	exit;

$houses = $SQL->query('SELECT COUNT(1) FROM `houses` WHERE `owner` = 0')->fetch();
?>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Server Information</h3>
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
						<td><b>Client:</b></td>
						<td>10.00<br><b><a href="?view=downloads">Click here to be taken to the download page</a></b></td>
					</tr>
					<tr>
						<td><b>Location:</b></td>
						<td>Brazil</td>
					</tr>
										<tr>
						<td><b>World Type:</b></td>
						<td>Retro Open PvP with Twist of Fate.</td>
					</tr>
					<tr>
						<td><b>Bless Protection:</b></td>
						<td><b>Level 40</b><br>You will not drop any items until level 40.</td>
					</tr>
					<tr>
						<td><b>Exp Stages:</b></td>
						<td>
							1 - 50 level: <b>x100</b><br>
							51 - 100 level: <b>x50</b><br>
							101 - 150 level: <b>x25</b><br>
							151 - 200 level: <b>x15</b><br>
							201 - 250 level: <b>x10</b><br>
							251 - 300 level: <b>x8</b><br>
							301 - 350 level: <b>x5</b><br>
							351 - 400 level: <b>x4</b><br>
							401+ level: <b>x3</b>
						</td>
					</tr>
					<tr>
						<td><b>Skill Rate:</b></td>
						<td>x15.0</td>
					</tr>
					<tr>
						<td><b>Magic Rate:</b></td>
						<td>x10.0</td>
					</tr>
						<tr>
						<td><b>Loot Rate:</b></td>
						<td>x3.0</td>
					</tr>
					<tr>
						<td><b>Houses:</b></td>
						<td>There are currently <?PHP echo $houses[0]; ?> houses available to be bought. There is no monthly rent, but if your character has been offline for more than 15 days you will lose your house due to inactivity.</td>
					</tr>
					<tr>
						<td><b>Frags:</b></td>
						<td><b>Frags to get red skull:</b> 8<br>
							<b>Frags to get black skull:</b> 16<br>
							It takes 12 hours for a frag to disappear, and you will have a PZ lock for 8 minutes if you kill someone.
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>