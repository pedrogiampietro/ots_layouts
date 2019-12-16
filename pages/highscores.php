<?php
if(!defined('INITIALIZED'))
	exit;

$list = 'level';
if(isset($_REQUEST['skill']))
	$list = $_REQUEST['skill'];

$page = 0;
if (isset($_REQUEST['page']))
	$page = (int) $_REQUEST['page'];

$rows = 100;
$rowsPerPage = 20;

$vocation = '';
if(isset($_REQUEST['vocation']))
	$vocation = $_REQUEST['vocation'];

switch($list)
{
	case "fist":
		$id=Highscores::SKILL_FIST;
		$list_name='Fist Fighting';
		break;
	case "club":
		$id=Highscores::SKILL_CLUB;
		$list_name='Club Fighting';
		break;
	case "sword":
		$id=Highscores::SKILL_SWORD;
		$list_name='Sword Fighting';
		break;
	case "axe":
		$id=Highscores::SKILL_AXE;
		$list_name='Axe Fighting';
		break;
	case "distance":
		$id=Highscores::SKILL_DISTANCE;
		$list_name='Distance Fighting';
		break;
	case "shield":
		$id=Highscores::SKILL_SHIELD;
		$list_name='Shielding';
		break;
	case "fishing":
		$id=Highscores::SKILL_FISHING;
		$list_name='Fishing';
		break;
	case "magic":
		$id=Highscores::SKILL__MAGLEVEL;
		$list_name='Magic Level';
		break;
	default:
		$id=Highscores::SKILL__LEVEL;
		$list_name='Level';
		break;
}
$world_name = $config['server']['serverName'];

$tmpSkills = [
	'level' => 'Level',
	'magic' => 'ML',
	'club' => 'Club',
	'axe' => 'Axe',
	'sword' => 'Sword',
	'shield' => 'Shielding',
	'distance' => 'Distance',
	'fist' => 'Fist',
	'fishing' => 'Fishing',

];

$offset = $page * $rowsPerPage;
$skills = new Highscores($id, $rowsPerPage, $page, $vocation);

$main_content .= '<div class="panel panel-default"><div class="panel-heading"><legend>Ranking for '.htmlspecialchars($list_name).'</legend></div><div class="panel-body"><div class="text-center"><div class="btn-group">';
	foreach ($tmpSkills as $k => $v) {
		$main_content .= '<a href="?subtopic=highscores&skill='.$k.'" class="easing-variables" '.($list == $k ? 'active' : '') .'">'.$v.'</a>';
	}

$main_content .= '</div></div><table border="1" class="pTable"><thead>		<tbody><tr class="pTitle">
				
					<td width="10%" align="left"><font color="white">Pos</font></td>
					<td width="40%" align="left"><font color="white">Player Name</font></td>
					<td width="20%" align="left"><font color="white">Vocation</font></td>
					<td width="1%" align="center"><font color="white">Level</font></td>
					
				</tr></th></tr></thead><tbody><br>';


$number_of_rows = 0;
foreach($skills as $skill) {
	$number_of_rows++;
	if ($list == "magic")
		$value = $skill->getMagLevel();
	elseif ($list == "level")
		$value = $skill->getLevel();
	else
		$value = $skill->getScore();

	$main_content .= '<tr><td class="nr" align="center">'.($offset + $number_of_rows).'</td><td><a href="?subtopic=characters&name='.urlencode($skill->getName()).'">'.htmlspecialchars($skill->getName()).'</a></td><td>'.htmlspecialchars(Website::getVocationName($skill->getVocation())).'</td><td>'.$value.'</td></tr>';
}

$main_content .= '</tbody></table>';

$main_content .= '<center><div class="text-center"><ul class="pagination"><br><br>';
$pages = (int)($rows / $rowsPerPage);
for ($i = 0; $i < $pages; $i++) {
	$x = $i + 1;
	$main_content .= '<li '. (($x - 1) == $page ? 'class="active"' : '') .'><a href="?view=highscores&skill='.urlencode($list).'&page='.($x - 1).'" data-original-title="" title="">'.($x).'</a></li>';
}
$main_content .= '</ul></div>';
$main_content .= '</div></div>';