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
		$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Character Information</h3></div><div class="panel-body"><table class="table table-striped"><tbody>';
		$main_content .= '<tr><td width="20%">Name:</td><td>' . htmlspecialchars($player->getName());
		if($player->isBanned() || $account->isBanned())
			$main_content .= '<span style="color:red">[BANNED]</span>';
		if($player->isNamelocked())
			$main_content .= '<span style="color:red">[NAMELOCKED]</span>';
		$main_content .= '</td></tr>';

		if(in_array($player->getGroup(), $config['site']['groups_support']))
		{
			$main_content .= '<tr><td>Position:</td><td>' . htmlspecialchars(Website::getGroupName($player->getGroup())) . '</td></tr>';
		}

		$main_content .= '<tr><td>Sex:</td><td>' . htmlspecialchars((($player->getSex() == 0) ? 'female' : 'male')) . '</td></tr>';
		$main_content .= '<tr><td>Profession:</td><td>' . htmlspecialchars(Website::getVocationName($player->getVocation())) . '</td></tr>';
		$main_content .= '<tr><td>Level:</td><td>' . htmlspecialchars($player->getLevel()) . '</td></tr>';

		$main_content .= '<tr><td>Residence:</td><td>' . htmlspecialchars($towns_list[$player->getTownID()]) . '</td></tr>';

		$rank_of_player = $player->getRank();
		if(!empty($rank_of_player))
		{
			$main_content .= '<tr><td>Guild Membership:</td><td>' . htmlspecialchars($rank_of_player->getName()) . ' of the <a href="?view=guilds&action=show&guild='. $rank_of_player->getGuild()->getID() .'">' . htmlspecialchars($rank_of_player->getGuild()->getName()) . '</a></td></tr>';
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
			$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Skills</h3></div><div class="panel-body"><table class="table table-striped">
               
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
                        <tr bgcolor="' . $config['site']['darkborder'] . '"><td style="text-align: center;"><strong>Level</strong></td>
                        <td style="text-align: center;"><strong>Magic</strong></td>
                        <td style="text-align: center;"><strong>Fist</strong></td>
                        <td style="text-align: center;"><strong>Club</strong></td>
                        <td style="text-align: center;"><strong>Sword</strong></td>
                        <td style="text-align: center;"><strong>Axe</strong></td>
                        <td style="text-align: center;"><strong>Dist</strong></td>
                        <td style="text-align: center;"><strong>Def</strong></td>
                        <td style="text-align: center;"><strong>Fish</strong></td>
                    </tr>
                    <tr>
                        <tr bgcolor="' . $config['site']['lightborder'] . '"><td style="text-align: center;">' . $player->getLevel() . '</td>
                        <td style="text-align: center;">' . $player->getMagLevel().'</td>
                        <td style="text-align: center;">' . $player->getSkill(0) . '</td>
                        <td style="text-align: center;">' . $player->getSkill(1) . '</td>
                        <td style="text-align: center;">' . $player->getSkill(2) . '</td>
                        <td style="text-align: center;">' . $player->getSkill(3) . '</td>
                        <td style="text-align: center;">' . $player->getSkill(4) . '</td>
                        <td style="text-align: center;">' . $player->getSkill(5) . '</td>
                        <td style="text-align: center;">' . $player->getSkill(6) . '</td>
                    </tr>
</tbody></TABLE></div></div>';

        }


		$deads = 0;
		//deaths list
		$player_deaths = new DatabaseList('PlayerDeath');
		$player_deaths->setFilter(new SQL_Filter(new SQL_Filter(new SQL_Field('player_id'), SQL_Filter::EQUAL, $player->getId()), SQL_Filter::CRITERIUM_AND,new SQL_Filter(new SQL_Field('id', 'players'), SQL_Filter::EQUAL, new SQL_Field('player_id', 'player_deaths'))));
		$player_deaths->addOrder(new SQL_Order(new SQL_Field('time'), SQL_Order::DESC));
		$player_deaths->setLimit(8);

		foreach($player_deaths as $death)
		{

			$deads++;
			$dead_add_content .= "<tr><td width=\"20%\" align=\"center\">".date("j M Y, H:i", $death->getTime())."</td><td>Died at level " . $death->getLevel() . " by " . $death->getKillerString();
			if($death->getMostDamageString() != '' && $death->getKillerString() != $death->getMostDamageString())
				$dead_add_content .= ' and ' . $death->getMostDamageString();
			$dead_add_content .= ".</td></tr>";
		}

		if ($deads > 0)
			$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Deaths</h3></div><div class="panel-body"><table class="table table-striped"><tbody>' . $dead_add_content . '</tbody></TABLE></div></div>';

		// Account Information
		if (!$player->getHideChar()) {
			$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Account Information</h3></div><div class="panel-body"><table class="table table-striped"><tbody>';
			if ($account->getRLName()) {
				$main_content .= '<tr><td width=20%>Real Name:</td><td>' . $account->getRLName() . '</td></tr>';
			}
			if ($account->getLocation()) {
				$main_content .= '<tr><td width=20%>Location:</td><td>' . $account->getLocation() . '</td></tr>';
			}

			if ($account->getLastLogin())
				$main_content .= '<tr><td width=20%>Last Login:</td><td>' . date("j F Y, g:i a", $account->getLastLogin()) . '</td></tr>';
			else
				$main_content .= '<tr><td width=20%>Last Login:</td><td>Never logged in.</td></tr>';
			if ($account->getCreateDate()) {

				$main_content .= '<tr><td width=20%>Created:</td><td>' . date("j F Y, g:i a", $account->getCreateDate()) . '</td></tr>';
			}

			$main_content .= '<tr><td>Account&#160;Status:</td><td>';
			$main_content .= ($account->isPremium() > 0) ? '<span class="label label-success">Premium Account</span>' : '<span class="label label-danger">Free Account</span>';
			if ($account->isBanned()) {
				if ($account->getBanTime() > 0)
					$main_content .= '<font color="red"> [Banished until '.date("j F Y, G:i", $account->getBanTime()).']</font>';
				else
					$main_content .= '<font color="red"> [Banished FOREVER]</font>';
			}
			$main_content .= '</td></tr></tbody></table></div></div>';


			// Characters
			$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Characters</h3></div><div class="panel-body"><table class="table class="table table-striped">';
			$main_content .= '<thead><tr><th>Name</th><th>Level</th><th>Status</th><th></th></tr></thead><tbody>';
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
					$main_content .= '<td width="8%"><b>'.$player_list_status.'</b></td><td><a class="btn btn-xs btn-primary btn-block" href="?view=characters&name='.htmlspecialchars($player_list->getName()).'">View</a></td></tr>';
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

	$main_content .= '<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Search Character</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" role="form" action="?view=characters" method="post">
		      		<div class="form-group">
			<label for="name" class="col-lg-1 control-label">Name:</label>
		      		<div class="col-lg-4">
			        <input type="text" maxlength="35" class="form-control" name="name" placeholder="" required>
			    </div>
	</div>
	<div class="text-center">
			<button type="submit" class="btn btn-primary">Submit</button>
			</form>
			</div>
			</div>
			</div>';





	/*$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Search Character</h3></div><div class="panel-body"><table class="table table-striped table-condensed"><tbody>';
	$main_content .= '';
	$main_content .= '<FORM ACTION="?view=characters" METHOD=post><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><tr><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></td></tr><tr><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><tr><td>Name</td><td><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></td><td><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></td></tr></TABLE></td></tr></TABLE></FORM>';
	$main_content .= '</tbody></table></div></div>';*/
}
