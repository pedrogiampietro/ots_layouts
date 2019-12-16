<?php
if(!defined('INITIALIZED'))
	exit;

/*$main_content .= '<center><h2>Support in game</h2></center>';
$main_content .= "<table border=0 cellspacing=1 cellpadding=4 width=100%>
	<tr bgcolor=\"".$config['site']['vdarkborder']."\">
	<td width=\"20%\"><font class=white><b>Group</b></font></td>
	<td width=\"65%\"><font class=white><b>Name</b></font></td>
	<td width=\"15%\"><font class=white><b>Status</b></font></td>";
foreach($list as $i => $supporter)
{
	if(!Player::isPlayerOnline($supporter['id']))
		$player_list_status = '<font color="red">Offline</font>';
	else
		$player_list_status = '<font color="green">Online</font>';
	$bgcolor = (($i++ % 2 == 1) ?  $config['site']['darkborder'] : $config['site']['lightborder']);
	$main_content .= '<tr bgcolor="'.$bgcolor.'"><td>' . htmlspecialchars(Website::getGroupName($supporter['group_id'])) . '</td><td><a href="?view=characters&name='.urlencode($supporter['name']).'">'.htmlspecialchars($supporter['name']).'</a></td><td>'.$player_list_status.'</td></tr>';
}

$main_content .= "</table>";*/

$main_content .= '
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title">Support</h3></div>
		<div class="panel-body">';

			$adminList = $SQL->query('SELECT ' . $SQL->fieldName('name') . ', ' . $SQL->fieldName('lastlogin') . ', ' . $SQL->fieldName('id') . ', ' . $SQL->fieldName('group_id') . ' FROM ' . $SQL->tableName('players') . ' WHERE ' . $SQL->fieldName('group_id') . ' > 2');
			$main_content .= '<table class="table table-striped table-condensed"><thead><tr><th style="width: 80%">Administrator List</th><th>Status</th></tr></thead><tbody>';
				foreach($adminList as $i => $admin) {
					$main_content .= '<tr><td><a href="?view=characters&name='.urlencode($admin['name']).'">'.htmlspecialchars($admin['name']).'</a></td><td><span class="label label-info">Last Seen: ' . (($admin['lastlogin'] > 0) ? date("j M Y, H:i:s", $admin['lastlogin']) : 'Never') . '</span></td></tr>';
				}

$main_content .= '
				</tbody>
			</table>
			<p>If no one is available to help you, you can also send an e-mail in English to <span class="label label-info">support@burmourne.net</span> and explain what you need help with. We will try to respond within 48 hours.</p>
		</div>
	</div>
';

