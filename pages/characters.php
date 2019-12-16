<?php
if(!defined('INITIALIZED'))
	exit;

$name = '';
if(isset($_REQUEST['name']))
    $name = (string) $_REQUEST['name'];
 
if(!empty($_REQUEST['view'])
&& isset($_REQUEST['view'])){
    if($_REQUEST['view'] == "matches"){
 
        $main_content .= '<BR><BR>
            <FORM ACTION="?subtopic=characters&view=matches" METHOD=post>
                <TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
                    <TR><TD BGCOLOR="'.$config['site']['firstcolor'].'" CLASS=white><B>Search Character</B></TD></TR>
                    <TR>
                        <TD BGCOLOR="'.$config['site']['secondcolor'].'">
                            <TABLE BORDER=0 CELLPADDING=1>
                                <TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD>
                                <INPUT TYPE=submit value="Submit" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR>
                            </TABLE>
                        </TD>
                    </TR>
                </TABLE>
            </FORM>';
        $main_content .= '</TABLE>';
 
        if(isset($name) && !empty($name)){
            $matches = $SQL->query('SELECT * FROM `players` WHERE `name` LIKE '.$SQL->quote("%".$name."%").' LIMIT 25')->fetchAll();
 
            if(count($matches) > 0){
                foreach($matches as $match){
                    $sim = similar_text(strtolower($name), strtolower($match['name']), $pct);
                    $match["similarity"] = $pct;
                }
 
                //arsort($matches);
                for($i = 0; $i < count($fruits)-1; $i++){
                    for($j = 0; $j < (count($fruits)-1)-$i; $j++){
                        if($fruits[$j]["similarity"] < $fruits[$j+1]["similarity"]){
                            $temp = $fruits[$j];
                            $fruits[$j] = $fruits[$j+1];
                            $fruits[$j+1] = $temp;
                        }
                    }
                }
 
                $main_content.='<table style="width:100%;" cellspacing="1" cellpadding="4" border="0">
                <fieldset><legend><b>Matches Found</b> - Keyword(s): '.$name.'</fieldset></legend>';
                    foreach($matches as $index => $player){
                        $main_content.="
                        <tr bgcolor=\"#e8f1f6\">
                            <td><a href=\"/?subtopic=characters&name=".urlencode($player['name'])."\">".$player["name"]."</td>
                            <td>[ ".$player["level"]." ]</td>
                        </tr>";
                    }
                $main_content.="</table>";
            } else {
 
                $main_content.="<b>No matches found. Keyword: ".$name." </b>";
 
            }
            //print_r($matches);
        } else {
            $main_content .= "<b>Warning: Search parameter empty</b>";
        }
    }
} else {
        if(!empty($name))
        {
            $player = new Player();
            $player->find($name);
            if($player->isLoaded())
            {
		$number_of_rows = 0;
		$account = $player->getAccount();
		$skull = '';
		if ($player->getSkull() == 4)
			$skull = "<img style='border: 0;' src='./images/skulls/redskull.gif'/>";
		else if ($player->getSkull() == 5)
			$skull = "<img style='border: 0;' src='./images/skulls/blackskull.gif'/>";
		$main_content .= '<table border="0" cellspacing="1" cellpadding="4" width="100%"><fieldset><legend>Character Information</legend></fieldset>';
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td width="20%">Name:</td><td style="font-weight:bold;color:' . (($player->isOnline()) ? 'green' : 'red') . '">' . htmlspecialchars($player->getName()) . ' ' . $skull . ' <img src="' . $config['site']['flag_images_url'] . $account->getFlag() . $config['site']['flag_images_extension'] . '" title="Country: ' . $account->getFlag() . '" alt="' . $account->getFlag() . '" />';
		if($player->isBanned() || $account->isBanned())
			$main_content .= '<span style="color:red">[BANNED]</span>';
		if($player->isNamelocked())
			$main_content .= '<span style="color:red">[NAMELOCKED]</span>';
		$main_content .= '<br /><img src="' . $config['site']['outfit_images_url'] . '?id=' . $player->getLookType() . '&addons=' . $player->getLookAddons() . '&head=' . $player->getLookHead() . '&body=' . $player->getLookBody() . '&legs=' . $player->getLookLegs() . '&feet=' . $player->getLookFeet() . '" alt="" /></td></tr>';

		$playerNamelocks = new DatabaseList('PlayerNamelocks');
		$filter = new SQL_Filter(new SQL_Field('player_id'), SQL_Filter::EQUAL, $player->getID());
		$playerNamelocks->setFilter($filter);
		if(count($playerNamelocks) > 0)
		{
			$old_names_text = array();
			foreach($playerNamelocks as $oldName)
			{
				$old_names_text[] = 'until ' . date("j F Y, g:i a", $oldName->getDate()) . ' known as <b>' . htmlspecialchars($oldName->getName()) . '</b>';
			}
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Old Names:</td><td>' . implode('<br />', $old_names_text) . '</td></tr>';
		}
		if(in_array($player->getGroup(), $config['site']['groups_support']))
		{
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Group:</td><td>' . htmlspecialchars(Website::getGroupName($player->getGroup())) . '</td></tr>';
		}
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Sex:</td><td>' . htmlspecialchars((($player->getSex() == 0) ? 'female' : 'male')) . '</td></tr>';
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$meritalStatus = 'single';
		if($player->getMarriage() > 0)
		{
			$marriage = new Player();
			$marriage->load($player->getMarriage());
			if($marriage->isLoaded())
				$meritalStatus = 'married to <a href="?subtopic=characters&name='.urlencode($marriage->getName()).'"><b>'.htmlspecialchars($marriage->getName()).'</b></a>';
		}
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Marital status:</td><td>' . $meritalStatus . '</td></tr>';
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Profession:</td><td>' . htmlspecialchars(Website::getVocationName($player->getVocation(), $player->getPromotion())) . '</td></tr>';
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Level:</td><td>' . htmlspecialchars($player->getLevel()) . '</td></tr>';
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>World:</td><td>' . htmlspecialchars($config['site']['worlds'][$player->getWorldID()]) . '</td></tr>';
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Residence:</td><td>' . htmlspecialchars($towns_list[$player->getWorldID()][$player->getTownID()]) . '</td></tr>';
		$rank_of_player = $player->getRank();
		if(!empty($rank_of_player))
		{
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Guild Membership:</td><td>' . htmlspecialchars($rank_of_player->getName()) . ' of the <a href="?subtopic=guilds&action=show&guild='. $rank_of_player->getGuild()->getID() .'">' . htmlspecialchars($rank_of_player->getGuild()->getName()) . '</a></td></tr>';
		}
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Balance:</td><td>' . htmlspecialchars($player->getBalance()) . ' gold coins</td></tr>';
		$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
		$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Last login:</td><td>' . (($player->getLastLogin() > 0) ? date("j F Y, g:i a", $player->getLastLogin()) : 'Never logged in.') . '</td></tr>';
		if($player->getCreateDate() > 0)
		{
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Created:</td><td>' . date("j F Y, g:i a", $player->getCreateDate()) . '</td></tr>';
		}
		if($config['site']['show_vip_storage'] > 0)
		{
			$storageValue = $player->getStorage($config['site']['show_vip_storage']);
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>VIP:</td><td>' . (($storageValue === null || $storageValue < 0) ? '<span style="font-weight:bold;color:red">NOT VIP</span>' : '<span style="font-weight:bold;color:green">VIP</span>') . '</td></tr>';
		}
		$comment = $player->getComment();
		$newlines = array("\r\n", "\n", "\r");
		$comment_with_lines = str_replace($newlines, '<br />', $comment, $count);
		if($count < 50)
			$comment = $comment_with_lines;
		if(!empty($comment))
		{
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			$main_content .= '<tr bgcolor="' . $bgcolor . '"><td>Comment:</td><td>' . $comment . '</td></tr>';
		}
		$main_content .= '</TABLE>';

	
		if($config['site']['show_skills_info'])
        {
			
$main_content .= '<center><p onclick="myFunction()"><i class="fa fa-info-circle" aria-hidden="true"></i><span class="label label-info"> Click here to <span id="labelshow">show</span> <b>additional informations</span></b></center></p>



<div id="myDIV" <div id="minhaDiv" style="display:none">

<div class="panel panel-default"><fieldset><legend>Skills</legend></fieldset><div class="panel-body"><table class="table table-striped table-condensed table-content">
               
			   <table class "Table30" width="100%" style="padding: 5px 10px;">
                    <tbody>
                        <tr style="background-image: url(./layouts/thoria/images/global/content/scroll.gif)!important;">

                            <td>
                                <table width="100%" class="Table30">
                                    <tbody>';
									
									
        $hpPercent = max(0, min(100, $player->getHealth() / max(1, $player->getHealthMax()) * 100));
        $manaPercent = max(0, min(100, $player->getMana() / max(1, $player->getManaMax()) * 100));
		$expCurrent = Functions::getExpForLevel($player->getLevel());
        $expNext = Functions::getExpForLevel($player->getLevel() + 1);
        $expLeft = bcsub($expNext, $player->getExperience(), 0);
        $expLeftPercent = max(0, min(100, ($player->getExperience() - $expCurrent) / ($expNext - $expCurrent) * 100));
        $main_content .= '<td align=center ><table width=100%><tr><td align=center><table CELLSPACING="1" CELLPADDING="4" width="100%"><tr><td style="background-color: #e7edef align="left" width="20%"><b><font color="black">Health:</font></b></td>
        <td style="background-color: #e7edef align="left"><font color="black">'.$player->getHealth().'/'.$player->getHealthMax().'<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background-image: url(../images/skills/hp.png); width: ' . $hpPercent . '%; height: 3px;"></font></td></tr>
                                        </tr>
                                        <tr bgcolor="#e7edef" style="text-align: center">
                                                    <tr><td style="background-color: #e7edef align="left"><b><font color="black">Mana:</font></b></td><td style="background-color: #e7edef align="left"><font color="black">' . $player->getMana() . '/' . $player->getManaMax() . '<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background-image: url(../images/skills/mana.png); width: '.$manaPercent.'%; height: 3px;"></font></td></tr></table><tr>
                                        </tr>
                                    </tbody>
                                </table>
								</table>
                                <table width="100%" class="Table30">
                                    <tbody>
                                        <tr bgcolor="#e7edef">
										<tr><td style="background-color: #e7edef align="left"><b><font color="black">Experience:</font></b></td><td style="background-color: #e7edef align="left"><font color="black">' . $player->getExperience() . ' EXP.</font></td></tr>

                                        </tr>
                                        <tr bgcolor="#e7edef">
                                                    <tr><td style="background-color: #e7edef align="left"><b><font color="black">To Next Level:</font></b></td><td style="background-color: #e7edef align="left"><font color="black">You need <b>' . $expLeft . ' EXP</b> to Level <b>' . ($player->getLevel() + 1) . '</font></b>.<div title="' . (100 - $expLeftPercent) . '% left" style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background-image: url(../images/skills/exp.png); width: '.$expLeftPercent.'%; height: 3px;"></td></tr>
                                        </tr>
                                    </tbody>
                                </table>
                                <table width="100%" class="Table30">
                                    <tbody>
                                        <tr>
                                            <td style="text-align: center;"><a href="?subtopic=highscores&list=experience"><img src="images/skills/level.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=magic"><img src="images/skills/ml.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=club"><img src="images/skills/club.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=sword"><img src="images/skills/sword.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=axe"><img src="images/skills/axe.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=distance"><img src="images/skills/dist.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=shield"><img src="images/skills/def.gif" alt="" style="border-style: none"/></td>
                    </tr>
                    <tr>
                        <tr style="background-color: #e7edef"><td style="text-align: center;"><strong><font color="black">Level</font></strong></td>
                        <td style="text-align: center;"><strong><font color="black">Magic</font></strong></td>
                        <td style="text-align: center;"><strong><font color="black">Club</font></strong></td>
                        <td style="text-align: center;"><strong><font color="black">Sword</font></strong></td>
                        <td style="text-align: center;"><strong><font color="black">Axe</font></strong></td>
                        <td style="text-align: center;"><strong><font color="black">Dist</font></strong></td>
                        <td style="text-align: center;"><strong><font color="black">Def</font></strong></td>
                    </tr>
                    <tr>
                        <tr style="background-color: #e7edef"><td style="text-align: center;"><font color="black">' . $player->getLevel() . '</font></td>
                        <td style="text-align: center;"><font color="black">' . $player->getMagLevel().'</font></td>
                        <td style="text-align: center;"><font color="black">' . $player->getSkill(1) . '</font></td>
                        <td style="text-align: center;"><font color="black">' . $player->getSkill(2) . '</font></td>
                        <td style="text-align: center;"><font color="black">' . $player->getSkill(3) . '</font></td>
                        <td style="text-align: center;"><font color="black">' . $player->getSkill(4) . '</font></td>
                        <td style="text-align: center;"><font color="black">' . $player->getSkill(5) . '</font></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
			   
               </TABLE></div></div>
</div>
<script>
function myFunction() {
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>
			
			
			
			';
        }
		

		$deads = 0;

		//deaths list
		$player_deaths = $SQL->query('SELECT ' . $SQL->fieldName('id') . ', ' . $SQL->fieldName('date') . ', ' . $SQL->fieldName('level') . ' FROM ' . $SQL->tableName('player_deaths') . ' WHERE ' . $SQL->fieldName('player_id') . ' = '.$player->getId().' ORDER BY ' . $SQL->fieldName('date') . ' DESC LIMIT 10');
		foreach($player_deaths as $death)
		{
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			$deads++;
			$dead_add_content .= "<tr bgcolor=\"".$bgcolor."\"><td width=\"20%\" align=\"center\">".date("j M Y, H:i", $death['date'])."</td><td>";
			$killers = $SQL->query('SELECT ' . $SQL->tableName('environment_killers') . '.' . $SQL->fieldName('name') . ' AS monster_name, ' . $SQL->tableName('players') . '.' . $SQL->fieldName('name') . ' AS player_name, ' . $SQL->tableName('players') . '.' . $SQL->fieldName('deleted') . ' AS player_exists FROM ' . $SQL->tableName('killers') . ' LEFT JOIN ' . $SQL->tableName('environment_killers') . ' ON ' . $SQL->tableName('killers') . '.' . $SQL->fieldName('id') . ' = ' . $SQL->tableName('environment_killers') . '.' . $SQL->fieldName('kill_id') . ' LEFT JOIN ' . $SQL->tableName('player_killers') . ' ON ' . $SQL->tableName('killers') . '.' . $SQL->fieldName('id') . ' = ' . $SQL->tableName('player_killers') . '.' . $SQL->fieldName('kill_id') . ' LEFT JOIN ' . $SQL->tableName('players') . ' ON ' . $SQL->tableName('players') . '.' . $SQL->fieldName('id') . ' = ' . $SQL->tableName('player_killers') . '.' . $SQL->fieldName('player_id') . '  WHERE ' . $SQL->tableName('killers') . '.' . $SQL->fieldName('death_id') . ' = ' . $SQL->quote($death['id']) . ' ORDER BY ' . $SQL->tableName('killers') . '.' . $SQL->fieldName('final_hit') . ' DESC, ' . $SQL->tableName('killers') . '.' . $SQL->fieldName('id') . ' ASC')->fetchAll();

			$i = 0;
			$count = count($killers);
			foreach($killers as $killer)
			{
				$i++;
				if($i == 1)
				{
					if($count <= 4)
						$dead_add_content .= "killed at level <b>".$death['level']."</b> by ";
					elseif($count > 4 and $count < 10)
						$dead_add_content .= "slain at level <b>".$death['level']."</b> by ";
					elseif($count > 9 and $count < 15)
						$dead_add_content .= "crushed at level <b>".$death['level']."</b> by ";
					elseif($count > 14 and $count < 20)
						$dead_add_content .= "eliminated at level <b>".$death['level']."</b> by ";
					elseif($count > 19)
						$dead_add_content .= "annihilated at level <b>".$death['level']."</b> by ";
				}
				elseif($i == $count)
					$dead_add_content .= " and ";
				else
					$dead_add_content .= ", ";

				if($killer['player_name'] != "")
				{
					if($killer['monster_name'] != "")
						$dead_add_content .= htmlspecialchars($killer['monster_name'])." summoned by ";

					if($killer['player_exists'] == 0)
						$dead_add_content .= "<a href=\"index.php?subtopic=characters&name=".urlencode($killer['player_name'])."\">";

					$dead_add_content .= htmlspecialchars($killer['player_name']);
					if($killer['player_exists'] == 0)
						$dead_add_content .= "</a>";
				}
				else
					$dead_add_content .= htmlspecialchars($killer['monster_name']);
			}

			$dead_add_content .= "</td></tr>";
		}

		if($deads > 0)
			$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><fieldset><legend>Deaths</B></fieldset></legend>' . $dead_add_content . '</TABLE><br />';

		if(!$player->getHideChar())
		{
			$main_content .= '<TABLE BORDER=0><TR><TD></TD></TR></TABLE><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><fieldset><legend><B>Account Information</B></fieldset></legend>';
			if($account->getRLName())
			{
				$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
				$main_content .= '<TR BGCOLOR="' . $bgcolor . '"><TD WIDTH=20%>Real name:</TD><TD>' . $account->getRLName() . '</TD></TR>';
			}
			if($account->getLocation())
			{
				$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
				$main_content .= '<TR BGCOLOR="' . $bgcolor . '"><TD WIDTH=20%>Location:</TD><TD>' . $account->getLocation() . '</TD></TR>';
			}
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			if($account->getLastLogin())
				$main_content .= '<TR BGCOLOR="' . $bgcolor . '"><TD WIDTH=20%>Last login:</TD><TD>' . date("j F Y, g:i a", $account->getLastLogin()) . '</TD></TR>';
			else
				$main_content .= '<TR BGCOLOR="' . $bgcolor . '"><TD WIDTH=20%>Last login:</TD><TD>Never logged in.</TD></TR>';
			if($account->getCreateDate())
			{
				$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
				$main_content .= '<TR BGCOLOR="' . $bgcolor . '"><TD WIDTH=20%>Created:</TD><TD>' . date("j F Y, g:i a", $account->getCreateDate()) . '</TD></TR>';
			}
			$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
			$main_content .= '<TR BGCOLOR="' . $bgcolor . '"><TD>Account&#160;Status:</TD><TD>';
			$main_content .= ($account->isPremium() > 0) ? '<b><font color="green">Premium Account</font></b>' : '<b><font color="red">Free Account</font></b>';
			if($account->isBanned())
			{
				if($account->getBanTime() > 0)
					$main_content .= '<font color="red"> [Banished until '.date("j F Y, G:i", $account->getBanTime()).']</font>';
				else
					$main_content .= '<font color="red"> [Banished FOREVER]</font>';
			}
			$main_content .= '</TD></TR></TABLE>';
			$main_content .= '<br><TABLE BORDER=0><TR><TD></TD></TR></TABLE><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><fieldset><legend><B>Characters</B></fieldset></legend>
			<TR BGCOLOR="' . $bgcolor . '"><TD><B>Name</B></TD><TD><B>World</B></TD><TD><B>Level</B></TD><TD><b>Status</b></TD><TD><B>&#160;</B></TD></TR>';
			$account_players = $account->getPlayersList();
			$player_number = 0;
			foreach($account_players as $player_list)
			{
				if(!$player_list->getHideChar())
				{
					$player_number++;
					$bgcolor = (($number_of_rows++ % 2 == 1) ?  $config['site']['firstcolor'] : $config['site']['secondcolor']);
					if(!$player_list->isOnline())
						$player_list_status = '<font color="red">Offline</font>';
					else
						$player_list_status = '<font color="green">Online</font>';
					$main_content .= '<TR BGCOLOR="' . $bgcolor . '"><TD WIDTH=52%><NOBR>'.$player_number.'.&#160;'.htmlspecialchars($player_list->getName());
					$main_content .= ($player_list->isDeleted()) ? '<font color="red"> [DELETED]</font>' : '';
					$main_content .= '</NOBR></TD><TD WIDTH=15%>'.$config['site']['worlds'][$player_list->getWorld()].'</TD><TD WIDTH=25%>'.$player_list->getLevel().' '.htmlspecialchars($vocation_name[$player_list->getPromotion()][$player_list->getVocation()]).'</TD><TD WIDTH="8%"><b>'.$player_list_status.'</b></TD><TD><TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0><FORM ACTION="?subtopic=characters" METHOD=post><TR><TD><INPUT TYPE="hidden" NAME="name" VALUE="'.htmlspecialchars($player_list->getName()).'"><INPUT TYPE=submit value="View '.htmlspecialchars($player_list->getName()).'" ALT="View '.htmlspecialchars($player_list->getName()).'"  BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></FORM></TABLE></TD></TR>';
						}
					}
					$main_content .= '</TABLE></TD><TD><IMG SRC="'.$layout_name.'/images/blank.gif" WIDTH=10 HEIGHT=1 BORDER=0></TD></TR></TABLE>';
				}
			}
			else
				$search_errors[] = 'Character <b>'.htmlspecialchars($name).'</b> does not exist.';
		}
}

if(!isset($_REQUEST['view'])){
	if(!empty($search_errors))
	{
		$main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
		foreach($search_errors as $search_error)
		$main_content .= '<li>'.$search_error;
		$main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
	}
	$main_content .= '<BR><BR>
	<FORM ACTION="?subtopic=characters&view=matches" METHOD=post>
	<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
	<TR><TD BGCOLOR="'.$config['site']['firstcolor'].'" CLASS=white><B>Search Character</B></TD></TR>
	<TR><TD BGCOLOR="'.$config['site']['secondcolor'].'">
	<TABLE BORDER=0 CELLPADDING=1>
	<TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD>
	<INPUT TYPE=submit value="Submit" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR>
	</TABLE></TD></TR>
	</TABLE>
	</FORM>';
	$main_content .= '</TABLE>';
}