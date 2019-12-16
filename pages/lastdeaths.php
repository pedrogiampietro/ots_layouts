<?php
if(!defined('INITIALIZED'))
	exit;


$players_deaths = new DatabaseList('PlayerDeath');
$players_deaths->setFilter(new SQL_Filter(new SQL_Field('id', 'players'), SQL_Filter::EQUAL, new SQL_Field('player_id', 'player_deaths')));
$players_deaths->addOrder(new SQL_Order(new SQL_Field('time'), SQL_Order::DESC));
$players_deaths->setLimit(50);
$players_deaths_count = 0;


foreach($players_deaths as $death)
{

	if ($G == 0){
		$G == 0+$G;
	}

	$bgcolor = (($players_deaths_count++ % 2 == 1));
	$players_rows .= '<TR><TD WIDTH="30"><center>'.$players_deaths_count.'.</center></TD><TD WIDTH="125"><small>'.date("j.m.Y, H:i:s",$death->getTime()).'</small></TD><TD><a href="index.php?view=characters&name=' . urlencode($death->data['name']) . '">' . htmlspecialchars($death->data['name']) . '</a> at level ' . $death->getLevel() . ' by ' . $death->getKillerString();
	if($death->getMostDamageString() != '' && $death->getKillerString() != $death->getMostDamageString())
		$players_rows .= ' and ' . $death->getMostDamageString();
	$players_rows .= '.</TD></TR>';
}
if($players_deaths_count == 0)
		$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Kill Statistics</h3></div><div class="panel-body"><table class="table table-striped"><div class="alert alert-info">No one died on '.htmlspecialchars($config['server']['serverName']).'.</div>
</tbody></TABLE></div></div>';
else
	
	$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Kill Statistics</h3></div><div class="panel-body"><table class="table table-striped">'.$players_rows.'</tbody></TABLE></div></div>';

