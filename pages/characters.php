<?php
if(!defined('INITIALIZED'))
	exit;

function getTimeString($seconds)
{
	$text = "";
	$days = floor(($seconds / 3600) / 24);
	$hours = floor(($seconds / 3600) % 24);
   	$minutes = floor(($seconds / 3600) % 60);
	if ($days != 0) {

		if ($days > 1) {
 			$text .= $days . " days";
		} else {
			 $text .= "1 day";
		}
	}

    if ($hours != 0) {
		if ($days != 0) {
			$text .= ", ";
		}

		if ($hours > 1) {
	        $text .= $hours . " hours";
	    } else {
	        $text .= "1 hour";
	    }
    }

    if ($minutes != 0) {
        if ($days != 0 || $hours != 0) {
            $text .= " and ";
        }

        if ($minutes > 1) {
            $text .= $minutes ." minutes";
        } else {
            $text .= "1 minute";
        }
    }

    return $text;
}

$name = '';
if (isset($_REQUEST['name']))
	$name = (string) $_REQUEST['name'];

$showSearch = true;
if(!empty($name))
{
	$player = new Player();
	$player->find($name);
	if($player->isLoaded())
	{
		$showSearch = false;
		$number_of_rows = 0;
		$account = $player->getAccount();

		// Character Information - Start
		$main_content .= '<div id="content_ajax"><style type="text/css" id="page_css"></style>
		<div id="page_ucp" class="page page_ucp ">
<div class="page_header border_box">
		<h3 class="page_title">	<span>Home</span>
	 → 	<span>Characters</span>
	</h3>
					<a href="?view=news" class="back-to-account" title="Back to Home" data-hasevent="1">Back to Home</a>
			</div>
	<div class="page_body">
				
				<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Character Information</h3></div><div class="panel-body"><table class="nice_table"><tbody>';
		$main_content .= '<tr><td width="20%">Name</td><td>' . htmlspecialchars($player->getName());
		if($player->isBanned() || $account->isBanned())
			$main_content .= '<span style="color:red">[BANNED]</span>';
		if($player->isNamelocked())
			$main_content .= '<span style="color:red">[NAMELOCKED]</span>';
		$main_content .= '</td></tr>';

		if(in_array($player->getGroup(), $config['site']['groups_support']))
		{
			$main_content .= '<tr><td>Position</td><td>' . htmlspecialchars(Website::getGroupName($player->getGroup())) . '</td></tr>';
		}

		$main_content .= '<tr><td>Sex</td><td>' . htmlspecialchars((($player->getSex() == 0) ? 'female' : 'male')) . '</td></tr>';
		$main_content .= '<tr><td>Profession</td><td>' . htmlspecialchars(Website::getVocationName($player->getVocation())) . '</td></tr>';
		$main_content .= '<tr><td>Level</td><td>' . htmlspecialchars($player->getLevel()) . '</td></tr>';
		$main_content .= '<tr><td>Residence</td><td>' . htmlspecialchars($towns_list[$player->getTownID()]) . '</td></tr>';

		$rank_of_player = $player->getRank();
		if(!empty($rank_of_player))
		{
			$main_content .= '<tr><td>Guild Membership</td><td>' . htmlspecialchars($rank_of_player->getName()) . ' of the <a href="?view=guilds&action=show&guild='. $rank_of_player->getGuild()->getID() .'">' . htmlspecialchars($rank_of_player->getGuild()->getName()) . '</a></td></tr>';
		}

		$main_content .= '<tr><td>Last login</td><td>' . (($player->getLastLogin() > 0) ? date("j F Y, g:i a", $player->getLastLogin()) : 'Never logged in.') . '</td></tr>';

		/*$onlineTime = getTimeString($player->getOnlineTime());
		if ($onlineTime) {
			$main_content .= '<tr><td>Online Time</td><td>'.$onlineTime.'</td></tr>';
		}*/

		if($player->getCreateDate() > 0)
		{
			$main_content .= '<tr><td>Created</td><td>' . date("j F Y, g:i a", $player->getCreateDate()) . '</td></tr>';
		}

	$comment = $player->getComment();
		$newlines = array("\r\n", "\n", "\r");
		$comment_with_lines = str_replace($newlines, '<br />', $comment, $count);
		if($count < 50)
			$comment = $comment_with_lines;
		if(!empty($comment))
		{
			$main_content .= '<tr><td>Comment:</td><td>' . $comment . '</td></tr>';
		}

		// Character Information - }
		$main_content .= '</tbody></table></div></div>';

		if($config['site']['show_skills_info'])
        {
			
		$verifica_item_id = function ($pid) use ($player) {
            $kalabok = (array_keys($player->getItems()->getItem($pid)) === []?'':array_keys($player->getItems()->getItem($pid))[0]);
            if ($player->getItems()->getItem($pid)[$kalabok]->data['itemtype'] == NULL) {
                return $pid;
            } else {
                $item_id = $player->getItems()->getItem($pid)[$kalabok]->data['itemtype'];
                return $item_id;
            }
        };

$main_content .= '<center><p onclick="myFunction()"><i class="fa fa-info-circle" aria-hidden="true"></i><span class="label label-info"> Click here to <span id="labelshow">show</span> <b>additional informations</span></b></center></p>



<div id="myDIV" <div id="minhaDiv" style="display:none">

<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Skills</h3></div><div class="panel-body"><table class="table table-striped table-condensed table-content">
               
			   <table class "Table30" width="100%" style="padding: 5px 10px;">
                    <tbody>
                        <tr style="background-image: url(./layouts/thoria/images/global/content/scroll.gif)!important;">
                            <td style="padding-right: 5px;">
                                <table width="100%" class="Table30">
                                    <tbody>
                                        <tr bgcolor="#2a2120">
                                            <td align="center" width="100px"><b><font color="white">Current<br>outfit:</font></b></td>
                                            <td><img style="text-decoration:none;margin: 0 0 0 -13px;" class="outfitImgsell2" src="#" alt="" name=""></td>
                                        </tr>
                                    </tbody>
                                </table>
                               <table class="Table30" width="100%" style="border-spacing: 2px; padding: 0px;">
                                    <tbody>
                                        <tr>
                                            <td colspan="3" style="background-color: #2a2120; text-align: center;">
                                                <font color="white"><b>Inventory:</font></b>
                                            </td>
                                        </tr>
                                        <tr>
										<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(2).'.gif" class="CharItems"></td>
										<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(1).'.gif" class="CharItems"></td>
										<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(3).'.gif" class="CharItems"></td>
										</tr>
										<tr>
											<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(6).'.gif" class="CharItems"></td>
											<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(4).'.gif" class="CharItems"></td>
											<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(5).'.gif" class="CharItems"></td>
										</tr>
										<tr>
											<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(9).'.gif" class="CharItems"></td>
											<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(7).'.gif" class="CharItems"></td>
											<td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(10).'.gif" class="CharItems"></td>
										</tr>
										<tr>               <td style="background-color: #2a2120; text-align: center;">
                                                <b>Soul:</b><br>0
                                            </td><td style="background-color: #2a2120; text-align: center;"><img src="images/equipaments/'.$verifica_item_id(8).'.gif" class="CharItems"></td>
                                            <td style="background-color: #2a2120; text-align: center;">
                                                <b>Cap:</b><br>400
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                <table width="100%" class="Table30">
                                    <tbody>';
									
									
        $hpPercent = max(0, min(100, $player->getHealth() / max(1, $player->getHealthMax()) * 100));
        $manaPercent = max(0, min(100, $player->getMana() / max(1, $player->getManaMax()) * 100));
		$expCurrent = Functions::getExpForLevel($player->getLevel());
        $expNext = Functions::getExpForLevel($player->getLevel() + 1);
        $expLeft = bcsub($expNext, $player->getExperience(), 0);
        $expLeftPercent = max(0, min(100, ($player->getExperience() - $expCurrent) / ($expNext - $expCurrent) * 100));
        $main_content .= '<td align=center ><table width=100%><tr><td align=center><table CELLSPACING="1" CELLPADDING="4" width="100%"><tr><td style="background-color: #2a2120 align="left" width="20%"><b><font color="white">Health:</font></b></td>
        <td style="background-color: #2a2120 align="left"><font color="white">'.$player->getHealth().'/'.$player->getHealthMax().'<div style="width: 100%; height: 5px; border: 1px solid #000;"><div style="background-image: url(../images/skills/hp.png); width: ' . $hpPercent . '%; height: 3px;"></font></td></tr>
                                        </tr>
                                        <tr bgcolor="#2a2120" style="text-align: center">
                                                    <tr><td style="background-color: #2a2120 align="left"><b><font color="white">Mana:</font></b></td><td style="background-color: #2a2120 align="left"><font color="white">' . $player->getMana() . '/' . $player->getManaMax() . '<div style="width: 100%; height: 5px; border: 1px solid #000;"><div style="background-image: url(../images/skills/mana.png); width: '.$manaPercent.'%; height: 3px;"></font></td></tr></table><tr>
                                        </tr>
                                    </tbody>
                                </table>
								</table>
                                <table width="100%" class="Table30">
                                    <tbody>
                                        <tr bgcolor="#F1E0C6">
										<tr><td style="background-color: #2a2120 align="left"><b><font color="white">Experience:</font></b></td><td style="background-color: #2a2120 align="left"><font color="white">' . $player->getExperience() . ' EXP.</font></td></tr>

                                        </tr>
                                        <tr bgcolor="#2a2120">
                                                    <tr><td style="background-color: #2a2120 align="left"><b><font color="white">To Next Level:</font></b></td><td style="background-color: #2a2120 align="left"><font color="white">You need <b>' . $expLeft . ' EXP</b> to Level <b>' . ($player->getLevel() + 1) . '</font></b>.<div title="' . (100 - $expLeftPercent) . '% left" style="width: 100%; height: 5px; border: 1px solid #000;"><div style="background-image: url(../images/skills/exp.png); width: '.$expLeftPercent.'%; height: 3px;"></td></tr>
                                        </tr>
                                    </tbody>
                                </table>
                                <table width="100%" class="Table30">
                                    <tbody>
                                        <tr>
                                            <td style="text-align: center;"><a href="?subtopic=highscores&list=experience"><img src="images/skills/level.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=magic"><img src="images/skills/ml.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=fist"><img src="images/skills/fist.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=club"><img src="images/skills/club.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=sword"><img src="images/skills/sword.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=axe"><img src="images/skills/axe.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=distance"><img src="images/skills/dist.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=shield"><img src="images/skills/def.gif" alt="" style="border-style: none"/></td>
                        <td style="text-align: center;"><a href="?subtopic=highscores&list=fishing"><img src="images/skills/fish.gif" alt="" style="border-style: none"/></td>
                    </tr>
                    <tr>
                        <tr style="background-color: #2a2120"><td style="text-align: center;"><strong><font color="white">Level</font></strong></td>
                        <td style="text-align: center;"><strong><font color="white">Magic</font></strong></td>
                        <td style="text-align: center;"><strong><font color="white">Fist</font></strong></td>
                        <td style="text-align: center;"><strong><font color="white">Club</font></strong></td>
                        <td style="text-align: center;"><strong><font color="white">Sword</font></strong></td>
                        <td style="text-align: center;"><strong><font color="white">Axe</font></strong></td>
                        <td style="text-align: center;"><strong><font color="white">Dist</font></strong></td>
                        <td style="text-align: center;"><strong><font color="white">Def</font></strong></td>
                        <td style="text-align: center;"><strong><font color="white">Fish</font></strong></td>
                    </tr>
                    <tr>
                        <tr style="background-color: #2a2120"><td style="text-align: center;"><font color="white">' . $player->getLevel() . '</font></td>
                        <td style="text-align: center;"><font color="white">' . $player->getMagLevel().'</font></td>
                        <td style="text-align: center;"><font color="white">' . $player->getSkill(0) . '</font></td>
                        <td style="text-align: center;"><font color="white">' . $player->getSkill(1) . '</font></td>
                        <td style="text-align: center;"><font color="white">' . $player->getSkill(2) . '</font></td>
                        <td style="text-align: center;"><font color="white">' . $player->getSkill(3) . '</font></td>
                        <td style="text-align: center;"><font color="white">' . $player->getSkill(4) . '</font></td>
                        <td style="text-align: center;"><font color="white">' . $player->getSkill(5) . '</font></td>
                        <td style="text-align: center;"><font color="white">' . $player->getSkill(6) . '</font></td>
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


			
			// Task list show
			$getStorageValueTask = function ($pid, $key) use ($SQL){
				$storage = $SQL->prepare("SELECT * FROM `player_storage` WHERE `player_id` = :id AND `key` = :key");
				$storage->execute(['id' => $pid, 'key' => $key]);				
				
				if($storage->rowCount() > 0){
					return $storage->fetchAll();
				}else{
					return FALSE;
				}
			};
			
			$showKillValue = function ($pid, $key) use ($getStorageValueTask){
				$kill = $getStorageValueTask($pid, $key);
				if(!$kill){return "0 Kills";}
				if ($kill[0]['value'] == 1){					
					return $kill[0]['value']. ' Kill';
				}else{
					return $kill[0]['value']. ' Kills';
				}
			};
			//$storage = $SQL->query("SELECT * FROM `player_storage` WHERE `player_id` = '583' AND `key` = '21122'")->fetchAll();
			//$storage->execute(['id' => 583, 'key' => 21122]);
			$teste = $showKillValue($player->getId(), 21122);
			$hotimg = "<img style='margin-left:10px;' src='".$layout_name."/images/hot2-fix.gif' />";
			$btstorage = 21121;
			$tasks["tasks"] = array(
					"<b>Fairus</b>".$hotimg."<br><small>Status: ".($showKillValue($player->getId(), ($btstorage+1)))." de 20000</nobr></small><br><small>Recompensa: Elf Outfit + 4kk</small></nobr>" => array("storageid" => ($btstorage+1), "startvalue" => 0, "endvalue" => 20000),
					"<b>Soul Dead</b><br><small>Status: ".($showKillValue($player->getId(), ($btstorage+2)))." de 15000</nobr></small><br><small>Recompensa: Retro Warrior Outfit</small></nobr>" => array("storageid" => ($btstorage+2), "startvalue" => 0, "endvalue" => 15000),
					"<b>Soul Guard</b>".$hotimg."<br><small>Status: ".($showKillValue($player->getId(), ($btstorage+3)))." de 15000</nobr></small><br><small>Recompensa: Dwarf Outfit + 3kk</small></nobr>" => array("storageid" => ($btstorage+3), "startvalue" => 0, "endvalue" => 15000),
					"<b>Comander Nomad</b><br><small>Status: ".($showKillValue($player->getId(), ($btstorage+4)))." de 7000</nobr></small><br><small>Recompensa: Retro Nobleman Outfit</small></nobr>" => array("storageid" => ($btstorage+4), "startvalue" => 0, "endvalue" => 7000)
			);
            if ($config['site']['showTasks']) {
                $main_content .= '';
                $tasks = $tasks['tasks'];
                $taskCount = count($tasks);
                $taskCountDone = 0;
                $number_of_rows = 0;
                $bgcolor = $config['site']['lightborder'];

                foreach($tasks as $storage => $name) {
					
                    $task = $SQL->query('SELECT * FROM player_storage WHERE player_id = ' . $player->getId() . ' AND `key` = ' . $name['storageid'] . ';')->fetch();

                    if (is_int($number_of_rows / 2)) {
                        if ($bgcolor == $config['site']['darkborder']) {
                            $taskList .= '<TR>';
                            $bgcolor = $config['site']['lightborder'];
                        } else {
                            $taskList .= '<TR>';
                            $bgcolor = $config['site']['darkborder'];
                        }
                    }

                    if ($showKillValue($player->getId(), $name['storageid']) < $name['endvalue']) {
                        $taskList .= '<TD><img src="images/false.png"/></TD>';
                        $taskList .= '<TD WIDTH=49%>' . $storage . '</TD>';
                    } else {
                        $taskList .= '<TD><img src="images/true.png"/></TD>';
                        $taskList .= '<TD WIDTH=49%><b><font color="green">' . $storage . '</font></b></TD>';
                        $taskCountDone++;
                    }
                    if (!is_int($taskCount/2)) {
                        if (!is_int($number_of_rows / 2) || $number_of_rows + 1 == $taskCount) {

                            if ($number_of_rows + 1 == $taskCount) {
                                if ($bgcolor == $config['site']['darkborder']) {

                                    $taskList .= '<td colspan="2">&nbsp;</td>';

                                } else {
                                    $taskList .= '<td colspan="2">&nbsp;</td>';
                                }
                            }
                            $taskList .= '</TR>';
                        }
                    }
                    $number_of_rows++;
                }                
            }

            // Quest list show
            if ($config['site']['showQuests']) {
                $main_content .= '';
                $quests = $config['site']['quests'];
                $questCount = count($config['site']['quests']);
                $questCountDone = 0;
                $number_of_rows = 0;
                $bgcolor = $config['site']['lightborder'];

                foreach($quests as $storage => $name) {

                    $quest = $SQL->query('SELECT * FROM player_storage WHERE player_id = ' . $player->getId() . ' AND `key` = ' . $name['storageid'] . ';')->fetch();

                    if (is_int($number_of_rows / 2)) {
                        if ($bgcolor == $config['site']['darkborder']) {
                            $questList .= '<TR>';
                            $bgcolor = $config['site']['lightborder'];
                        } else {
                            $questList .= '<TR>';
                            $bgcolor = $config['site']['darkborder'];
                        }
                    }

                    if ($quest == false) {
                        $questList .= '<TD><img src="images/false.png"/></TD>';
                        $questList .= '<TD WIDTH=49%>' . $storage . '</TD>';
                    } else {
                        $questList .= '<TD><img src="images/true.png"/></TD>';
                        $questList .= '<TD WIDTH=49%><b><font color="green">' . $storage . '</font></b></TD>';
                        $questCountDone++;
                    }
                    if (!is_int($questCount/2)) {

                        if (!is_int($number_of_rows / 2) || $number_of_rows + 1 == $questCount) {

                            if ($number_of_rows + 1 == $questCount) {
                                if ($bgcolor == $config['site']['darkborder']) {

                                    $questList .= '<td colspan="2">&nbsp;</td>';

                                } else {
                                    $questList .= '<td colspan="2">&nbsp;</td>';
                                }
                            }
                            $questList .= '</TR>';
                        }
                    }
                    $number_of_rows++;
                }                
            }

            if ($config['site']['showQuests'] || $config['site']['showTasks']) {

                $main_content .= '<BR>
		<div class="panel panel-default">
			<div class="panel-heading">
			<h3 class="panel-title">More Infos</h3>
				</div>
				<div class="panel-body">
		<table class="nice_table" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td>
                                            
                                                ';
                if ($config['site']['showQuests']) {
                    $ilosc_procent = ($questCountDone / $questCount) * 100;
                    $main_content .= '
                    <table style="width:100%;">
                        <tbody>
                                                    <tr>
                                                        <td>';
                                    
                                    $main_content .='
                                    <table border="0" cellspacing="1" cellpadding="4" width="100%">
                                        <tbody>
                                        <tr>
                                                <td colspan="2" width="15%" class="white">
                                                    <img id="ButtonQuests" onmousedown="ToggleMaskedText(\'Quests\');" style="vertical-align:middle;cursor:pointer;" src="./layouts/metro/images/show.gif">
                                                    <b>Quests: </b>
                                                </td>
                                                <td>
                                                    <progress max="100" value="' . $ilosc_procent . '"></progress>
                                                </td>
                                                <td class="white">
                                                    <b>' . intval($ilosc_procent < 10 ? 0 ."". $ilosc_procent : $ilosc_procent) . '%</b>
                                                </td>
                                        </tr>
                                        </tbody>
                                    </table>';
                                    $main_content .='
                                    <span id="DisplayQuests" ></span>
                                    <span id="MaskedQuests" style="visibility:hidden;display:none" ></span>
                                    <span id="ReadableQuests" style="visibility:hidden;display:none" >                                                                  
                                    <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
                                    ' . $questList . '
                                    </TABLE></span>
                                  
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        
                    ';
                }
                if ($config['site']['showTasks']) {
                    $task_ilosc_procent = ($taskCountDone / $taskCount) * 100;
                    $main_content .= '
                    <table style="width:100%;">
                    <tbody>
                                                    <tr>
                                                        <td>';
                                    $main_content .='
                                    <table border="0" cellspacing="1" cellpadding="4" width="100%">
                                        <tbody>
                                        <tr>
                                                <td colspan="2" width="15%" class="white">
                                                    <img id="ButtonTasks" onmousedown="ToggleMaskedText(\'Tasks\');" style="vertical-align:middle;cursor:pointer;" src="./layouts/metro/images/show.gif">
                                                    <b>Tasks: </b>
                                                </td>
                                                <td>
                                                    <progress max="100" value="' . $task_ilosc_procent . '"></progress>
                                                </td>
                                                <td class="white">
                                                    <b>' . intval($task_ilosc_procent  < 10 ? 0 ."". $task_ilosc_procent : $task_ilosc_procent) . '%</b>
                                                </td>
                                        </tr>
                                        </tbody>
                                    </table>'; 

                                    $main_content .='
                                    <span id="DisplayTasks" ></span>
                                    <span id="MaskedTasks" style="visibility:hidden;display:none" ></span>
                                    <span id="ReadableTasks" style="visibility:hidden;display:none" >
                                    <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
                                    ' . $taskList . '
                                    </TABLE>
                                    </span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                    ';
                }
                $main_content .= '
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                </div>
			</div>';

            }



		$deads = 0;
		//deaths list
		$player_deaths = new DatabaseList('PlayerDeath');
		$player_deaths->setFilter(new SQL_Filter(new SQL_Filter(new SQL_Field('player_id'), SQL_Filter::EQUAL, $player->getId()), SQL_Filter::CRITERIUM_AND,new SQL_Filter(new SQL_Field('id', 'players'), SQL_Filter::EQUAL, new SQL_Field('player_id', 'player_deaths'))));
		$player_deaths->addOrder(new SQL_Order(new SQL_Field('time'), SQL_Order::DESC));
		$player_deaths->setLimit(20);

		foreach($player_deaths as $death)
		{

			$deads++;
			$dead_add_content .= "<tr><td width=\"20%\" align=\"center\">".date("j M Y, H:i", $death->getTime())."</td><td>Died at level " . $death->getLevel() . " by " . $death->getKillerString();
			if($death->getMostDamageString() != '' && $death->getKillerString() != $death->getMostDamageString())
				$dead_add_content .= ' and ' . $death->getMostDamageString();
			$dead_add_content .= "</td></tr>";
		}

		if ($deads > 0)
			$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Deaths</h3></div><div class="panel-body"><table class="nice_table"><tbody>' . $dead_add_content . '</tbody></TABLE></div></div>';

		// Account Information
		if (!$player->getHideChar()) {
			$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Account Information</h3></div><div class="panel-body"><table class="nice_table"><tbody>';
			if ($account->getRLName()) {
				$main_content .= '<tr><td width=20%>Real name</td><td>' . $account->getRLName() . '</td></tr>';
			}
			if ($account->getLocation()) {
				$main_content .= '<tr><td width=20%>Location</td><td>' . $account->getLocation() . '</td></tr>';
			}

			if ($account->getLastLogin())
				$main_content .= '<tr><td width=20%>Last login</td><td>' . date("j F Y, g:i a", $account->getLastLogin()) . '</td></tr>';
			else
				$main_content .= '<tr><td width=20%>Last login</td><td>Never logged in.</td></tr>';
			if ($account->getCreateDate()) {

				$main_content .= '<tr><td width=20%>Created</td><td>' . date("j F Y, g:i a", $account->getCreateDate()) . '</td></tr>';
			}

			$main_content .= '<tr><td>Account&#160;Status</td><td>';
			$main_content .= ($account->isPremium() > 0) ? '<span class="label label-success">Premium Account</span>' : '<span class="label label-danger">Free Account</span>';
			if ($account->isBanned()) {
				if ($account->getBanTime() > 0)
					$main_content .= '<font color="red"> [Banished until '.date("j F Y, G:i", $account->getBanTime()).']</font>';
				else
					$main_content .= '<font color="red"> [Banished FOREVER]</font>';
			}
			$main_content .= '</td></tr></tbody></table></div></div>';
			
			
	
			// Characters
			$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Characters</h3></div><div class="panel-body"><table class="nice_table">';
			$main_content .= '<thead><tr><td>Name</td><td>Level</td><td>Status</td><td></td></tr></thead><tbody>';
			$account_players = $account->getPlayersList();
			$player_number = 0;
			foreach($account_players as $player_list) {
				if(!$player_list->getHideChar()) {
					$player_number++;

					if(!$player_list->isOnline())
						$player_list_status = '<span class="label label-danger">Offline</span>';
					else
						$player_list_status = '<span class="label label-success">Online</span>';
					$main_content .= '<tr><td style="width:52%;'.($name == $player_list->getNAme() ? 'font-weight:bold;' : '').'">'.htmlspecialchars($player_list->getName());
					$main_content .= ($player_list->isDeleted()) ? ' <span class="label label-danger">Deleted</span>' : '';
					$main_content .= '</td><td width=25%>'.$player_list->getLevel().' '.htmlspecialchars($vocation_name[$player_list->getVocation()]).'</td>';
					$main_content .= '<td width="8%"><b>'.$player_list_status.'</b></td><td><a class="nice_button" href="?view=characters&name='.htmlspecialchars($player_list->getName()).'">View</a></td></tr>';
				}
			}
			$main_content .= '</tbody></TABLE></div></div>';
		}
	}
	else
		$search_errors[] = 'Character <b>'.htmlspecialchars($name).'</b> does not exist.';
}

if (!empty($search_errors)) {
	foreach($search_errors as $search_error) {
		$main_content .= '<div class="alert alert-danger">'.$search_error.'</div>';
	}
}

if ($showSearch) {

	$main_content .= '<div id="content_ajax"><style type="text/css" id="page_css"></style>
	<div id="page_ucp" class="page page_ucp ">
<div class="page_header border_box">
	<h3 class="page_title">	<span>Community</span>
 → 	<span>Seach Character</span>
</h3>
				<a href="?view=news" class="back-to-account" title="Back to Home" data-hasevent="1">Back to Home</a>
		</div>
<div class="page_body">
			<div class="page_body">
			<form role="form" action="?view=characters" method=post class="form-horizontal">
			    <div class="form-inline">
		      		<label for="name" class="col-lg-2 control-label">Name</label>
					  <span class="warfg_input" style=""><input type="text" maxlength="35" class="form-control" name="name" placeholder="" required></span>
					  <br>
					  <br>
					  <br>
			        <center><button type="submit" class="nice_button">Submit</button></center>
			    </div>
			</form>
		</div>
	</div>';




	/*$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Search Character</h3></div><div class="panel-body"><table class="table table-striped table-condensed"><tbody>';
	$main_content .= '';
	$main_content .= '<FORM ACTION="?view=characters" METHOD=post><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><tr><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></td></tr><tr><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><tr><td>Name</td><td><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></td><td><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></td></tr></TABLE></td></tr></TABLE></FORM>';
	$main_content .= '</tbody></table></div></div>';*/
}
