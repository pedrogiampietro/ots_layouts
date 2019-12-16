<?php
if(!defined('INITIALIZED'))
	exit;

$houses = $SQL->query('SELECT COUNT(1) FROM `houses` WHERE `owner` = 0')->fetch();
?>
	<div id="content_ajax"><style type="text/css" id="page_css"></style>
		<div id="page_ucp" class="page page_ucp ">
<div class="page_header border_box">
		<h3 class="page_title">	<span>Home</span>
	 → 	<span>Serverinfo</span>
	</h3>
					<a href="?view=news" class="back-to-account" title="Back to Home" data-hasevent="1">Back to Home</a>
			</div>
	<div class="page_body">
				<div class="page_body">
			<table class="nice_table" id="faq">
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
							1 - 29 level: <b>x28</b><br>
							30 - 49 level: <b>x24</b><br>
							50 - 74 level: <b>x16</b><br>
							75 - 94 level: <b>x12</b><br>
							95 - 119 level: <b>x8</b><br>
							120 - 149 level: <b>x6</b><br>
							150 - 179 level: <b>x4</b><br>
							180 - 219 level: <b>x2</b><br>
							220+ level: <b>x1</b>
						</td>
					</tr>
					<tr>
						<td><b>Skill Rate:</b></td>
						<td>x9.0</td>
					</tr>
					<tr>
						<td><b>Magic Rate:</b></td>
						<td>x3.0</td>
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
						<td><b>Frags to get red skull:</b> 6<br>
							<b>Frags to get black skull:</b> 12<br>
							It takes 12 hours for a frag to disappear, and you will have a PZ lock for 15 minutes if you kill someone.
						</td>
					</tr>
				</tbody>
			</table>
		</div>
