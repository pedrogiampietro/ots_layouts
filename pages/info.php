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
					<tr>
						<td><b>Client:</b></td>
						<td>10.80-10.82 - <br> <b><a href="http://tibia.sx/download/137/exe">Click here to download Client</a><br><a href="http://static.otland.net/ipchanger.exe">Click here to download IP Changer</a></b></td>
					</tr>
					<tr>
						<td><b>Location:</b></td>
						<td>France</td>
					</tr>
					<tr>
						<td><b>PVP Protection:</b></td>
						<td><b>Level 75.</b> You will not be able to participate in PVP until you reach level 75, nor will you drop any items on death until level 75.</td>
					</tr>
					<tr>
						<td><b>Exp stages:</b></td>
						<td>
							1 - 29 level, 225x <br>
							30 - 59 level, 175x<br>
							60 - 79 level, 115x<br>
							80 - 99 level, 95x<br>
							100 - 119 level, 55x<br>
							120 - 149 level, 40x<br>
							150 - 199 level, 25x<br>
							200 - 224 level, 10x<br>
							225 - 249 level, 7x<br>
							250 - 299 level, 3x<br>
							300+ level, 2x<br>
						</td>
					</tr>
					<tr>
						<td><b>Skill Rate:</b></td>
						<td>35x</td>
					</tr>
					<tr>
						<td><b>Magic Level Rate:</b></td>
						<td>7x</td>
					</tr>
					<tr>
						<td><b>Loot Rate:</b></td>
						<td>3x</td>
					</tr>
					<tr>
						<td><b>Houses:</b></td>
						<td>There are currently <?PHP echo $houses[0]; ?> houses available to be bought. There is no monthly rent, but if your character has been offline for more than 30 days you will lose your house due to inactivity.</td>
					</tr>
					<tr>
						<td><b>Frags:</b></td>
						<td><b>Frags to get red skull:</b> 6<br>
							<b>Frags to get black skull:</b> 10<br>
							It takes 6 hours for a frag to disappear, and you will have a PZ lock for 15 minutes if you kill someone.
						</td>
					</tr>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>

