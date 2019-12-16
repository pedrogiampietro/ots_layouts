<?php
if(!defined('INITIALIZED'))
	exit;

$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Burmourne Rates</h3></div><div class="panel-body">';
$main_content .= '<table class="table table-condensed table-content table-striped"><tbody>';
$main_content .= '<tr><td style="font-weight:bold;width:150px">PvP protection</td><td>to ' . $config['server']['protectionLevel'] . ' level</td></tr>';
$main_content .= '<tr><td style="font-weight:bold;">Exp rate</td><td>';
$stages = new DOMDocument();
if($stages->load($config['site']['serverPath'] . 'data/XML/stages.xml') && $stages->getElementsByTagName('config')->item(0)->getAttribute('enabled'))
{
	foreach($stages->getElementsByTagName('stage') as $stage)
	{
		$main_content .= $stage->getAttribute('minlevel');
		if($stage->hasAttribute('maxlevel'))
		{
			$main_content .= ' - ' . $stage->getAttribute('maxlevel') . ' level';
		}
		else
		{
			$main_content .= '+ level';
		}
		$main_content .= ', ' . $stage->getAttribute('multiplier') . 'x<br />';
	}
}
else
{
	$main_content .= $config['server']['rateExp'] . 'x';
}
$main_content .= '</td></tr>';
$main_content .= '<tr><td style="font-weight:bold;">Skill rate</td><td>' . $config['server']['rateSkill'] . 'x</td></tr>';
$main_content .= '<tr><td style="font-weight:bold;">Magic rate</td><td>' . $config['server']['rateMagic'] . 'x</td></tr>';
$main_content .= '<tr><td style="font-weight:bold;">Loot rate</td><td>' . $config['server']['rateLoot'] . 'x</td></tr></tbody></table>';

$main_content .= '</div></div>';
