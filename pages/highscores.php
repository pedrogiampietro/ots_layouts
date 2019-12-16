<?php if(!defined('INITIALIZED')) exit;

switch($action)
{
	default:
	{
		$list = 'experience'; if(isset($_REQUEST['list'])) $list = $_REQUEST['list'];
		$page = 0; if(isset($_REQUEST['page'])) $page = min(10, $_REQUEST['page']);
		$vocation = ''; if(isset($_REQUEST['vocation'])) $vocation = $_REQUEST['vocation'];

		switch($list)
    	{
	    	case "fist":$id=Highscores::SKILL_FIST; $list_name='Fist Fighting'; break;
	    	case "club":$id=Highscores::SKILL_CLUB; $list_name='Club Fighting'; break;
	    	case "sword":$id=Highscores::SKILL_SWORD; $list_name='Sword Fighting'; break;
	    	case "axe":$id=Highscores::SKILL_AXE; $list_name='Axe Fighting'; break;
			case "distance":$id=Highscores::SKILL_DISTANCE; $list_name='Distance Fighting'; break;
	    	case "shield":$id=Highscores::SKILL_SHIELD; $list_name='Shielding'; break; 
			case "fishing":$id=Highscores::SKILL_FISHING; $list_name='Fishing'; break;
	    	case "magic":$id=Highscores::SKILL__MAGLEVEL; $list_name='Magic Level'; break;
	    	default:$id=Highscores::SKILL__LEVEL; $list_name='Experience'; break;
    	}

		$offset = $page * 100;
		$skills = new Highscores($id, 20, $page);
	
		echo '
		<div id="content_ajax"><style type="text/css" id="page_css"></style>
		<div id="page_ucp" class="page page_ucp ">
<div class="page_header border_box">
		<h3 class="page_title">	<span>Highscores</span>
	 → 	<span> Ranking of '.htmlspecialchars($list_name).'</span>
	</h3>
					<a href="?view=news" class="back-to-account" title="Back to Home" data-hasevent="1">Back to Home</a>
			</div>
	<div class="page_body">
				<div class="formatar">
			
			<table class="nice_table width="90%" cellpadding="0" cellspacing="0">
				<tr> 
					<td> <form action="?view=highscores" method="post" > <input type="hidden" name="list" value="experience" /> <button class="btn btn-primary btn-sm" type="submit"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/2006.gif">&nbsp;&nbsp; experience  </form></button> </td>
					
					<td> <form action="?view=highscores" method="post" > <input type="hidden" name="list" value="magic" /> <button class="btn btn-primary btn-sm" type="submit"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/2273.gif"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/invisibility.gif">&nbsp;&nbsp; Magic Level  </form></button> </td>

					<td> <form action="?view=highscores" method="post" > <input type="hidden" name="list" value="shield" /> <button class="btn btn-primary btn-sm" type="submit"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/2514.gif"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/spark.gif">&nbsp;&nbsp; Shield  </form></button> </td>

					<td> <form action="?view=highscores" method="post" > <input type="hidden" name="list" value="distance" /> <button class="btn btn-primary btn-sm" type="submit"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/2546.gif"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/2456.gif">&nbsp;&nbsp; Distance  </form></button> </td>

					<td> <form action="?view=highscores" method="post" > <input type="hidden" name="list" value="axe" /> <button class="btn btn-primary btn-sm" type="submit"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/Chopper_of_Destruction.gif">&nbsp;&nbsp; Axe  </form></button> </td>

					<td> <form action="?view=highscores" method="post" > <input type="hidden" name="list" value="club" /> <button class="btn btn-primary btn-sm" type="submit"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/Thunder_Hammer.gif">&nbsp;&nbsp; Club  </form></button> </td>

					<td> <form action="?view=highscores" method="post" > <input type="hidden" name="list" value="sword" /> <button class="btn btn-primary btn-sm" type="submit"><img style="margin-left:-25px;margin-top:-15px;position:absolute;" src="images/highscores/2396.gif">&nbsp;&nbsp; Sword  </form></button> </td>

				</tr>
			</table> </br>

			<table class="nice_table border="0" cellpadding="1" cellspacing="8">
				<tr> <td> <b> # </b> </td> <td width="80%"> <b> Nome </b> </td> <td width="10%"> <b> Level </b> </td> </tr>';

			$number_of_rows = 0;
			foreach($skills as $skill)
			{
				if($list == "magic") $value = $skill->getMagLevel();
				elseif($list == "experience") $value = $skill->getLevel();
				else $value = $skill->getScore();

				$number_of_rows++;
				echo '<tr> <td>'.($offset + $number_of_rows).'.</td> <td><a href="?view=characters&name='.urlencode($skill->getName()).'">
				'.($skill->getOnline()>0 ? '<font color="green"><b> '.htmlspecialchars($skill->getName()).' </b></font>' : '<font color="red"><b> '.htmlspecialchars($skill->getName()).' </b></font>').'</a> </td>
				<td> '.$value.' </td> </tr>';
			}
			echo '</table> <table border="0" cellpadding="1" cellspacing="8"> <tr>';

		if($page > 0)
		{
			echo '<td> <form action="rank" method="post" > 
				<input type="hidden" name="list" value="'.urlencode($list).'" />
				<input type="hidden" name="page" value="'.(int) ($page - 1).'" />  
				<button class="rank_button" type="submit"> Back Page </button> 
			</form> </td>';
		}
    
		if($number_of_rows > 10)
		{
			echo '<td> <form action="rank" method="post" > 
				<input type="hidden" name="list" value="'.urlencode($list).'" />
				<input type="hidden" name="page" value="'.(int) ($page + 1).'" />  
				<button class="rank_button" type="submit"> Next Page </button> 
			</form> </td>';
		}
	
		echo '</tr> </table> </div>';
		
		break;
	}
}
?>