<?php
if(!defined('INITIALIZED'))
	exit;


if($config['site']['shop_system'])
{
	if($logged)
	{
		$user_premium_points = $account_logged->getCustomField('premium_points');
	}
	else
	{
		$user_premium_points = 'Login first';
	}
	function getItemByID($id)
	{
		$id = (int) $id;
		$SQL = $GLOBALS['SQL'];
		$data = $SQL->query('SELECT * FROM '.$SQL->tableName('z_shop_offer').' WHERE '.$SQL->fieldName('id').' = '.$SQL->quote($id).';')->fetch();
		if($data['offer_type'] == 'item')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif($data['offer_type'] == 'novos')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		
		elseif($data['offer_type'] == 'umbral')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		
		elseif($data['offer_type'] == 'custom')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		
		elseif($data['offer_type'] == 'mount')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif($data['offer_type'] == 'addon')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif($data['offer_type'] == 'mage')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif($data['offer_type'] == 'pala')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif($data['offer_type'] == 'kina')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}		
		elseif($data['offer_type'] == 'deco')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif($data['offer_type'] == 'container')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		return $offer;
	}

	function getOfferArray()
	{
		$offer_list = $GLOBALS['SQL']->query('SELECT * FROM '.$GLOBALS['SQL']->tableName('z_shop_offer').';');
		$i_item = 0;
		$i_novos = 0;
		$i_umbral = 0;
		$i_custom = 0;
		$i_mount = 0;
		$i_addon = 0;
		$i_mage = 0;
		$i_pala = 0;
		$i_kina = 0;
		$i_deco = 0;
		$i_container = 0;
		while($data = $offer_list->fetch())
		{
			if($data['offer_type'] == 'item')
			{
				$offer_array['item'][$i_item]['id'] = $data['id'];
				$offer_array['item'][$i_item]['item_id'] = $data['itemid1'];
				$offer_array['item'][$i_item]['item_count'] = $data['count1'];
				$offer_array['item'][$i_item]['points'] = $data['points'];
				$offer_array['item'][$i_item]['description'] = $data['offer_description'];
				$offer_array['item'][$i_item]['name'] = $data['offer_name'];
				$i_item++;
			}
			elseif($data['offer_type'] == 'novos')
			{
				$offer_array['novos'][$i_item]['id'] = $data['id'];
				$offer_array['novos'][$i_item]['item_id'] = $data['itemid1'];
				$offer_array['novos'][$i_item]['item_count'] = $data['count1'];
				$offer_array['novos'][$i_item]['points'] = $data['points'];
				$offer_array['novos'][$i_item]['description'] = $data['offer_description'];
				$offer_array['novos'][$i_item]['name'] = $data['offer_name'];
				$i_item++;
			}
			elseif($data['offer_type'] == 'umbral')
			{
				$offer_array['umbral'][$i_item]['id'] = $data['id'];
				$offer_array['umbral'][$i_item]['item_id'] = $data['itemid1'];
				$offer_array['umbral'][$i_item]['item_count'] = $data['count1'];
				$offer_array['umbral'][$i_item]['points'] = $data['points'];
				$offer_array['umbral'][$i_item]['description'] = $data['offer_description'];
				$offer_array['umbral'][$i_item]['name'] = $data['offer_name'];
				$i_item++;
			}
			elseif($data['offer_type'] == 'custom')
			{
				$offer_array['custom'][$i_item]['id'] = $data['id'];
				$offer_array['custom'][$i_item]['item_id'] = $data['itemid1'];
				$offer_array['custom'][$i_item]['item_count'] = $data['count1'];
				$offer_array['custom'][$i_item]['points'] = $data['points'];
				$offer_array['custom'][$i_item]['description'] = $data['offer_description'];
				$offer_array['custom'][$i_item]['name'] = $data['offer_name'];
				$i_item++;
			}
			elseif($data['offer_type'] == 'mount')
			{
				$offer_array['mount'][$i_mount]['id'] = $data['id'];
				$offer_array['mount'][$i_mount]['container_id'] = $data['itemid1'];
				$offer_array['mount'][$i_mount]['container_count'] = $data['count1'];
				$offer_array['mount'][$i_mount]['item_id'] = $data['itemid1'];
				$offer_array['mount'][$i_mount]['item_count'] = $data['count2'];
				$offer_array['mount'][$i_mount]['points'] = $data['points'];
				$offer_array['mount'][$i_mount]['description'] = $data['offer_description'];
				$offer_array['mount'][$i_mount]['name'] = $data['offer_name'];
				$i_mount++;
			}
			elseif($data['offer_type'] == 'addon')
			{
				$offer_array['addon'][$i_addon]['id'] = $data['id'];
				$offer_array['addon'][$i_addon]['container_id'] = $data['itemid1'];
				$offer_array['addon'][$i_addon]['container_count'] = $data['count1'];
				$offer_array['addon'][$i_addon]['item_id'] = $data['itemid1'];
				$offer_array['addon'][$i_addon]['item_count'] = $data['count2'];
				$offer_array['addon'][$i_addon]['points'] = $data['points'];
				$offer_array['addon'][$i_addon]['description'] = $data['offer_description'];
				$offer_array['addon'][$i_addon]['name'] = $data['offer_name'];
				$i_addon++;
			}
			elseif($data['offer_type'] == 'mage')
			{
				$offer_array['mage'][$i_mage]['id'] = $data['id'];
				$offer_array['mage'][$i_mage]['container_id'] = $data['itemid1'];
				$offer_array['mage'][$i_mage]['container_count'] = $data['count1'];
				$offer_array['mage'][$i_mage]['item_id'] = $data['itemid1'];
				$offer_array['mage'][$i_mage]['item_count'] = $data['count2'];
				$offer_array['mage'][$i_mage]['points'] = $data['points'];
				$offer_array['mage'][$i_mage]['description'] = $data['offer_description'];
				$offer_array['mage'][$i_mage]['name'] = $data['offer_name'];
				$i_mage++;
			}
			elseif($data['offer_type'] == 'pala')
			{
				$offer_array['pala'][$i_pala]['id'] = $data['id'];
				$offer_array['pala'][$i_pala]['container_id'] = $data['itemid1'];
				$offer_array['pala'][$i_pala]['container_count'] = $data['count1'];
				$offer_array['pala'][$i_pala]['item_id'] = $data['itemid1'];
				$offer_array['pala'][$i_pala]['item_count'] = $data['count2'];
				$offer_array['pala'][$i_pala]['points'] = $data['points'];
				$offer_array['pala'][$i_pala]['description'] = $data['offer_description'];
				$offer_array['pala'][$i_pala]['name'] = $data['offer_name'];
				$i_pala++;
			}
			elseif($data['offer_type'] == 'kina')
			{
				$offer_array['kina'][$i_kina]['id'] = $data['id'];
				$offer_array['kina'][$i_kina]['container_id'] = $data['itemid1'];
				$offer_array['kina'][$i_kina]['container_count'] = $data['count1'];
				$offer_array['kina'][$i_kina]['item_id'] = $data['itemid1'];
				$offer_array['kina'][$i_kina]['item_count'] = $data['count2'];
				$offer_array['kina'][$i_kina]['points'] = $data['points'];
				$offer_array['kina'][$i_kina]['description'] = $data['offer_description'];
				$offer_array['kina'][$i_kina]['name'] = $data['offer_name'];
				$i_kina++;
			}			
			elseif($data['offer_type'] == 'deco')
			{
				$offer_array['deco'][$i_deco]['id'] = $data['id'];
				$offer_array['deco'][$i_deco]['container_id'] = $data['itemid1'];
				$offer_array['deco'][$i_deco]['container_count'] = $data['count1'];
				$offer_array['deco'][$i_deco]['item_id'] = $data['itemid1'];
				$offer_array['deco'][$i_deco]['item_count'] = $data['count2'];
				$offer_array['deco'][$i_deco]['points'] = $data['points'];
				$offer_array['deco'][$i_deco]['description'] = $data['offer_description'];
				$offer_array['deco'][$i_deco]['name'] = $data['offer_name'];
				$i_deco++;
			}	
			elseif($data['offer_type'] == 'container')
			{
				$offer_array['container'][$i_container]['id'] = $data['id'];
				$offer_array['container'][$i_container]['container_id'] = $data['itemid1'];
				$offer_array['container'][$i_container]['container_count'] = $data['count1'];
				$offer_array['container'][$i_container]['item_id'] = $data['itemid2'];
				$offer_array['container'][$i_container]['item_count'] = $data['count2'];
				$offer_array['container'][$i_container]['points'] = $data['points'];
				$offer_array['container'][$i_container]['description'] = $data['offer_description'];
				$offer_array['container'][$i_container]['name'] = $data['offer_name'];
				$i_container++;
			}
		}
		return $offer_array;
	}
	if(($action == '') or ($action == 'item') or ($action == 'novos') or ($action == 'umbral') or ($action == 'custom') or ($action == 'mount') or ($action == 'addon') or ($action == 'container') or ($action == 'mage') or ($action == 'pala') or ($action == 'kina') or ($action == 'deco'))
	{
		unset($_SESSION['viewed_confirmation_page']);
		$offer_list = getOfferArray();

		if(empty($action))
		{
			if(count($offer_list['item']) > 0)
				$action = 'item';
			elseif(count($offer_list['novos']) > 0)
				$action = 'novos';
			elseif(count($offer_list['umbral']) > 0)
				$action = 'umbral';
			elseif(count($offer_list['custom']) > 0)
				$action = 'custom';
			elseif(count($offer_list['mount']) > 0)
				$action = 'mount';
			elseif(count($offer_list['addon']) > 0)
				$action = 'addon';
			elseif(count($offer_list['mage']) > 0)
				$action = 'mage';
			elseif(count($offer_list['pala']) > 0)
				$action = 'pala';
			elseif(count($offer_list['kina']) > 0)
				$action = 'kina';				
			elseif(count($offer_list['deco']) > 0)
				$action = 'deco';
				elseif(count($offer_list['container']) > 0)
				$action = 'container';
		}

		function selectcolor($value)
		{
			if($GLOBALS['action'] == $value)
				return '#505050; color: #FFFFFF';
			else
				return '#303030; color: #aaaaaa';
		}

		if((count($offer_list['item']) > 0) or (count($offer_list['novos']) > 0) or (count($offer_list['umbral']) > 0) or (count($offer_list['custom']) > 0) or (count($offer_list['mount']) > 0) or (count($offer_list['addon']) > 0) or (count($offer_list['container']) > 0) or (count($offer_list['mage']) > 0) or (count($offer_list['pala']) > 0) or (count($offer_list['kina']) > 0) or (count($offer_list['deco']) > 0))
		{
			$main_content .= '<center><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
		<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=center CLASS=white><B>Tibia Coins</B></TD></TR>
		<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=center><b>You have<font color="green"> '.$user_premium_points.' </font>Tibia Coins. </b></TD></TR>
		</table>
		<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=4><TR>';
			if(count($offer_list['item']) > 0) $main_content .= '<center><a href="?view=shopsystem&action=item" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('item').';">Items  <img src="http://www.tibiawiki.com.br/images/b/ba/The_Epiphany.gif"></a>';
			if(count($offer_list['novos']) > 0) $main_content .= '<a href="?view=shopsystem&action=novos" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('novos').';">News  <img src="http://www.tibiawiki.com.br/images/f/f7/Void_Boots.gif"></a>';
			if(count($offer_list['umbral']) > 0) $main_content .= '<a href="?view=shopsystem&action=umbral" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('umbral').';">Umbral  <img src="http://www.tibiawiki.com.br/images/8/81/Umbral_Master_Crossbow.gif"></a>';
			if(count($offer_list['custom']) > 0) $main_content .= '<a href="?view=shopsystem&action=custom" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('custom').';">Custom  <img src="http://www.tibiawiki.com.br/images/d/d7/Golden_Newspaper.gif"></a>';
			if(count($offer_list['mount']) > 0) $main_content .= '<a href="?view=shopsystem&action=mount" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('mount').';">Mounts<img src="http://www.tibiawiki.com.br/images/4/4d/Vortexion.gif"></a>';
			if(count($offer_list['addon']) > 0) $main_content .= '<a href="?view=shopsystem&action=addon" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('addon').';">Addons<img src="http://www.tibiawiki.com.br/images/6/60/Outfit_Philosopher_Male_Addon_3.gif"></a>';
			if(count($offer_list['mage']) > 0) $main_content .= '<a href="?view=shopsystem&action=mage" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('mage').';">Mage<img src="/images/items/18390.gif"></a>';
			if(count($offer_list['pala']) > 0) $main_content .= '<a href="?view=shopsystem&action=pala" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('pala').';">Paladin<img src="/images/items/22421.gif"></a>';
			if(count($offer_list['kina']) > 0) $main_content .= '<a href="?view=shopsystem&action=kina" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('kina').';">Knight<img src="/images/items/22409.gif"></a>';			
			if(count($offer_list['deco']) > 0) $main_content .= '<a href="?view=shopsystem&action=deco" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('deco').';">Deco<img src="/images/items/2798.gif"></a>';
			if(count($offer_list['container']) > 0) $main_content .= '<a href="?view=shopsystem&action=container" style="padding: 5px 5px 7px 5px; margin: 5px 1px 0px 1px; background-color: '.selectcolor('container').';">Container</a></center>';
			$main_content .= '</TD></TR></TD></TR></table></center><table BORDER=0 CELLPaDDING="0" CELLSPaCING="3" style="width:100%;font-weight:bold;text-align:center;"><tr style="background:#505050;"><td colspan="3" style="height:px;"></td></tr></table>';
		}

		//show list of items offers
		if((count($offer_list['item']) > 0) and ($action == 'item'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['item'] as $item)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$item['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $item['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($item['name']).'</b> ('.$item['points'].' points)<br />'.htmlspecialchars($item['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$item['id'].'"><input type="hidden" name="buy_id" value="'.$item['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$item['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}
		
		//show list of novos offers
		if((count($offer_list['novos']) > 0) and ($action == 'novos'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['novos'] as $novos)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$novos['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $novos['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($novos['name']).'</b> ('.$novos['points'].' points)<br />'.htmlspecialchars($novos['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$novos['id'].'"><input type="hidden" name="buy_id" value="'.$novos['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$novos['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}
		
		//show list of umbral offers
		if((count($offer_list['umbral']) > 0) and ($action == 'umbral'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['umbral'] as $umbral)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$umbral['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $umbral['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($umbral['name']).'</b> ('.$umbral['points'].' points)<br />'.htmlspecialchars($umbral['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$umbral['id'].'"><input type="hidden" name="buy_id" value="'.$umbral['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$umbral['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}
		
		//show list of custom offers
		if((count($offer_list['custom']) > 0) and ($action == 'custom'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['custom'] as $custom)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$custom['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $custom['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($custom['name']).'</b> ('.$custom['points'].' points)<br />'.htmlspecialchars($custom['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$custom['id'].'"><input type="hidden" name="buy_id" value="'.$custom['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$custom['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}
		
		//show list of mount offers
		if((count($offer_list['mount']) > 0) and ($action == 'mount'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['mount'] as $mount)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$mount['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $mount['id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($mount['name']).'</b> ('.$mount['points'].' points)<br />'.htmlspecialchars($mount['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$mount['id'].'"><input type="hidden" name="buy_id" value="'.$mount['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$mount['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}
		//show list of addon offers
		if((count($offer_list['addon']) > 0) and ($action == 'addon'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['addon'] as $addon)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$addon['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $addon['id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($addon['name']).'</b> ('.$addon['points'].' points)<br />'.htmlspecialchars($addon['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$addon['id'].'"><input type="hidden" name="buy_id" value="'.$addon['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$addon['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}			
		//show list of mage offers
		if((count($offer_list['mage']) > 0) and ($action == 'mage'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['mage'] as $mage)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$mage['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $mage['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($mage['name']).'</b> ('.$mage['points'].' points)<br />'.htmlspecialchars($mage['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$mage['id'].'"><input type="hidden" name="buy_id" value="'.$mage['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$mage['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}
		//show list of pala offers
		if((count($offer_list['pala']) > 0) and ($action == 'pala'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['pala'] as $pala)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$pala['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $pala['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($pala['name']).'</b> ('.$pala['points'].' points)<br />'.htmlspecialchars($pala['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$pala['id'].'"><input type="hidden" name="buy_id" value="'.$pala['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$pala['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}	
		//show list of kina offers
		if((count($offer_list['kina']) > 0) and ($action == 'kina'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['kina'] as $kina)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$kina['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $kina['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($kina['name']).'</b> ('.$kina['points'].' points)<br />'.htmlspecialchars($kina['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$kina['id'].'"><input type="hidden" name="buy_id" value="'.$kina['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$kina['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';			
		}
		//show list of kina offers
		if((count($offer_list['deco']) > 0) and ($action == 'deco'))
		{
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['deco'] as $deco)
			{
				if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$deco['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $deco['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($deco['name']).'</b> ('.$deco['points'].' points)<br />'.htmlspecialchars($deco['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="itemform_'.$deco['id'].'"><input type="hidden" name="buy_id" value="'.$deco['id'].'"><div class="navibutton"><a href="" onClick="itemform_'.$deco['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';			
		}		
		//show list of containers offers
		if((count($offer_list['container']) > 0) and ($action == 'container'))
		{
			if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%"><tr bgcolor="'.$config['site']['vdarkborder'].'"><td width="8%" align="center" class="white"><b>Points</b></td><td width="9%" align="center" class="white"><b>Picture</b></td><td width="350" align="left" class="white"><b>Description</b></td><td width="250" align="center" class="white"><b>Select product</b></td></tr>';
			foreach($offer_list['container'] as $container)
			{
				$main_content .= '<tr bgcolor="'.$bgcolor.'"><td align="center"><b>'.$container['points'].'</b></td><td align="center"><img src="' . $config['site']['item_images_url'] . $container['item_id'] . $config['site']['item_images_extension'] . '"></td><td><b>'.htmlspecialchars($container['name']).'</b> ('.$container['points'].' points)<br />'.htmlspecialchars($container['description']).'</td><td align="center">';
				if(!$logged)
				{
					$main_content .= '<a href="?view=accountmanagement"><b>Login to buy</b></a>';
				}
				else
				{
					$main_content .= '<form action="?view=shopsystem&action=select_player" method="POST" name="contform_'.$container['id'].'"><input type="hidden" name="buy_id" value="'.$container['id'].'"><div class="navibutton"><a href="" onClick="contform_'.$container['id'].'.submit();return false;">BUY</a></div></form>';
				}
				$main_content .= '</td></tr>';
			}
			$main_content .= '</table>';
		}
		//Finish container
		if((count($offer_list['item']) > 0) or (count($offer_list['novos']) > 0) or (count($offer_list['umbral']) > 0) or (count($offer_list['custom']) > 0) or (count($offer_list['mount']) > 0) or (count($offer_list['addon']) > 0) or (count($offer_list['container']) > 0) or (count($offer_list['mage']) > 0) or (count($offer_list['pala']) > 0) or (count($offer_list['kina']) > 0))
		{
			$main_content .= '<table BORDER=0 CELLPaDDING="4" CELLSPaCING="1" style="width:100%;font-weight:bold;text-align:center;">
			<tr style="background:#505050;">
					<td colspan="3" style="height:px;"></td>
			</tr>
			</table>';
		}
	}
	if($action == 'select_player')
	{
		unset($_SESSION['viewed_confirmation_page']);
		if(!$logged) {
			$errormessage .= 'Please login first.';
		}
		else
		{
			$buy_id = (int) $_REQUEST['buy_id'];
			if(empty($buy_id))
			{
				$errormessage .= 'Please <a href="?view=shopsystem">select item</a> first.';
			}
			else
			{
				$buy_offer = getItemByID($buy_id);
				if(isset($buy_offer['id'])) //item exist in database
				{
					if($user_premium_points >= $buy_offer['points'])
					{
						$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%">
						<tr bgcolor="'.$config['site']['vdarkborder'].'"><td colspan="2" class="white"><b>Selected Offer</b></td></tr>
						<tr bgcolor="'.$config['site']['lightborder'].'"><td width="100"><b>Name:</b></td><td width="550">'.htmlspecialchars($buy_offer['name']).'</td></tr>
						<tr bgcolor="'.$config['site']['darkborder'].'"><td width="100"><b>Description:</b></td><td width="550">'.htmlspecialchars($buy_offer['description']).'</td></tr>
						</table><br />
						<form action="?view=shopsystem&action=confirm_transaction" method="POST"><input type="hidden" name="buy_id" value="'.$buy_id.'">
						<table border="0" cellpadding="4" cellspacing="1" width="100%">
						<tr bgcolor="'.$config['site']['vdarkborder'].'"><td colspan="2" class="white"><b>Give item to player from your account</b></td></tr>
						<tr bgcolor="'.$config['site']['lightborder'].'"><td width="110"><b>Name:</b></td><td width="550"><select name="buy_name">';
						$players_from_logged_acc = $account_logged->getPlayersList();
						if(count($players_from_logged_acc) > 0)
						{
							foreach($players_from_logged_acc as $player)
							{
								$main_content .= '<option>'.htmlspecialchars($player->getName()).'</option>';
							}
						}
						else
						{
							$main_content .= 'You don\'t have any character on your account.';
						}
						$main_content .= '</select>&nbsp;<input type="submit" value="Give"></td></tr>
						</table>
						</form><br /><form action="?view=shopsystem&action=confirm_transaction" method="POST"><input type="hidden" name="buy_id" value="'.$buy_id.'">
							<table border="0" cellpadding="4" cellspacing="1" width="100%">
							<tr bgcolor="'.$config['site']['vdarkborder'].'"><td colspan="2" class="white"><b>Give item to other player</b></td></tr>
							<tr bgcolor="'.$config['site']['lightborder'].'"><td width="110"><b>To player:</b></td><td width="550"><input type="text" name="buy_name"> - name of player</td></tr>
							<tr bgcolor="'.$config['site']['darkborder'].'"><td width="110"><b>From:</b></td><td width="550"><input type="text" name="buy_from">&nbsp;<input type="submit" value="Give"> - your nick, \'empty\' = Anonymous</td></tr>
							</table><br />
							</form>';

					}
					else
					{
						$errormessage .= 'For this item you need <b>'.$buy_offer['points'].'</b> points. You have only <b>'.$user_premium_points.'</b> tibia coins. Please <a href="?view=shopsystem">select other item</a> or buy tibia coins.';
					}
				}
				else
				{
					$errormessage .= 'Offer with ID <b>'.$buy_id.'</b> doesn\'t exist. Please <a href="?view=shopsystem">select item</a> again.';
				}
			}
		}
		if(!empty($errormessage))
		{
			$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
				<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Informations</B></TD></TR>
				<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.$errormessage.'</b></TD></TR>
				</table>';
		}
	}
	elseif($action == 'confirm_transaction')
	{
		if(!$logged)
		{
			$errormessage .= 'Please login first.';
		}
		else
		{
			$buy_id = (int) $_POST['buy_id'];
			$buy_name = trim($_POST['buy_name']);
			$buy_from = trim($_POST['buy_from']);
			if(empty($buy_from))
			{
				$buy_from = 'Anonymous';
			}
			if(empty($buy_id))
			{
				$errormessage .= 'Please <a href="?view=shopsystem">select item</a> first.';
			}
			else
			{
				if(!check_name($buy_from))
				{
					$errormessage .= 'Invalid nick ("from player") format. Please <a href="?view=shopsystem&action=select_player&buy_id='.$buy_id.'">select other name</a> or contact with administrator.';
				}
				else
				{
					$buy_offer = getItemByID($buy_id);
					if(isset($buy_offer['id'])) //item exist in database
					{
						if($user_premium_points >= $buy_offer['points'])
						{
							if(check_name($buy_name))
							{
								$buy_player = new Player();
								$buy_player->find($buy_name);
								if($buy_player->isLoaded())
								{
									$buy_player_account = $buy_player->getAccount();
									if($_SESSION['viewed_confirmation_page'] == 'yes' && $_POST['buy_confirmed'] == 'yes')
									{
										if($buy_offer['type'] == 'item')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote('').', '.$SQL->quote('').', '.$SQL->quote('item').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote($buy_offer['id']).', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
												<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Item added!</B></TD></TR>
												<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.htmlspecialchars($buy_offer['name']).'</b> added to player <b>'.htmlspecialchars($buy_player->getName()).'</b> items (he will get this items after relog) for <b>'.$buy_offer['points'].' tibia coins</b> from your account.<br />Now you have <b>'.$user_premium_points.' tibia coins</b>.<br /><a href="?view=shopsystem">GO TO MAIN SHOP SITE</a></TD></TR>
												</table>';
										}
										
										elseif($buy_offer['type'] == 'novos')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote('').', '.$SQL->quote('').', '.$SQL->quote('item').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote($buy_offer['id']).', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
												<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Item added!</B></TD></TR>
												<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.htmlspecialchars($buy_offer['name']).'</b> added to player <b>'.htmlspecialchars($buy_player->getName()).'</b> items (he will get this items after relog) for <b>'.$buy_offer['points'].' tibia coins</b> from your account.<br />Now you have <b>'.$user_premium_points.' tibia coins</b>.<br /><a href="?view=shopsystem">GO TO MAIN SHOP SITE</a></TD></TR>
												</table>';
										}
										
										elseif($buy_offer['type'] == 'umbral')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote('').', '.$SQL->quote('').', '.$SQL->quote('item').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote($buy_offer['id']).', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
												<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Item added!</B></TD></TR>
												<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.htmlspecialchars($buy_offer['name']).'</b> added to player <b>'.htmlspecialchars($buy_player->getName()).'</b> items (he will get this items after relog) for <b>'.$buy_offer['points'].' tibia coins</b> from your account.<br />Now you have <b>'.$user_premium_points.' tibia coins</b>.<br /><a href="?view=shopsystem">GO TO MAIN SHOP SITE</a></TD></TR>
												</table>';
										}
										
										elseif($buy_offer['type'] == 'custom')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote('').', '.$SQL->quote('').', '.$SQL->quote('item').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote($buy_offer['id']).', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
												<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Item added!</B></TD></TR>
												<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.htmlspecialchars($buy_offer['name']).'</b> added to player <b>'.htmlspecialchars($buy_player->getName()).'</b> items (he will get this items after relog) for <b>'.$buy_offer['points'].' tibia coins</b> from your account.<br />Now you have <b>'.$user_premium_points.' tibia coins</b>.<br /><a href="?view=shopsystem">GO TO MAIN SHOP SITE</a></TD></TR>
												</table>';
										}
										
										elseif($buy_offer['type'] == 'mount')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote('').', '.$SQL->quote('').', '.$SQL->quote('item').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote($buy_offer['id']).', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
												<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Mount added!</B></TD></TR>
												<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.htmlspecialchars($buy_offer['name']).'</b> added to player <b>'.htmlspecialchars($buy_player->getName()).'</b> items (he will get this items after relog) for <b>'.$buy_offer['points'].' tibia coins</b> from your account.<br />Now you have <b>'.$user_premium_points.' tibia coins</b>.<br /><a href="?view=shopsystem">GO TO MAIN SHOP SITE</a></TD></TR>
												</table>';
										}
										elseif($buy_offer['type'] == 'addon')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote('').', '.$SQL->quote('').', '.$SQL->quote('item').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote($buy_offer['id']).', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
												<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Addon added!</B></TD></TR>
												<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.htmlspecialchars($buy_offer['name']).'</b> added to player <b>'.htmlspecialchars($buy_player->getName()).'</b> items (he will get this items after relog) for <b>'.$buy_offer['points'].' tibia coins</b> from your account.<br />Now you have <b>'.$user_premium_points.' tibia coins</b>.<br /><a href="?view=shopsystem">GO TO MAIN SHOP SITE</a></TD></TR>
												</table>';
										}
										elseif($buy_offer['type'] == 'container')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote($buy_offer['container_id']).', '.$SQL->quote($buy_offer['container_count']).', '.$SQL->quote('container').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote($buy_offer['id']).', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
												<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Container of items added!</B></TD></TR>
												<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.htmlspecialchars($buy_offer['name']).'</b> added to player <b>'.htmlspecialchars($buy_player->getName()).'</b> items (he will get this container with items after relog) for <b>'.$buy_offer['points'].' tibia coins</b> from your account.<br />Now you have <b>'.$user_premium_points.' tibia coins</b>.<br /><a href="?view=shopsystem">GO TO MAIN SHOP SITE</a></TD></TR>
												</table>';
										}
									}
									else
									{
										$set_session = TRUE;
										$_SESSION['viewed_confirmation_page'] = 'yes';
										$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="100%">
										<tr bgcolor="'.$config['site']['vdarkborder'].'"><td colspan="3" class="white"><b>Confirm Transaction</b></td></tr>
										<tr bgcolor="'.$config['site']['lightborder'].'"><td width="100"><b>Name:</b></td><td width="550" colspan="2">'. htmlspecialchars($buy_offer['name']).'</td></tr>
										<tr bgcolor="'.$config['site']['darkborder'].'"><td width="100"><b>Description:</b></td><td width="550" colspan="2">'. htmlspecialchars($buy_offer['description']).'</td></tr>
										<tr bgcolor="'.$config['site']['lightborder'].'"><td width="100"><b>Cost:</b></td><td width="550" colspan="2"><b>'. htmlspecialchars($buy_offer['points']).' tibia coins</b> from your account</td></tr>
										<tr bgcolor="'.$config['site']['darkborder'].'"><td width="100"><b>For Player:</b></td><td width="550" colspan="2"><font color="red">'.htmlspecialchars($buy_player->getName()).'</font></td></tr>
										<tr bgcolor="'.$config['site']['lightborder'].'"><td width="100"><b>From:</b></td><td width="550" colspan="2"><font color="red">'.htmlspecialchars($buy_from).'</font></td></tr>
										<tr bgcolor="'.$config['site']['darkborder'].'"><td colspan="3"></td></tr>
										<tr bgcolor="'.$config['site']['darkborder'].'"><td width="100"><b>Transaction?</b></td><td width="275" align="left">
										<form action="?view=shopsystem&action=confirm_transaction" method="POST"><input type="hidden" name="buy_confirmed" value="yes"><input type="hidden" name="buy_id" value="'.$buy_id.'"><input type="hidden" name="buy_from" value="'.htmlspecialchars($buy_from).'"><input type="hidden" name="buy_name" value="'.htmlspecialchars($buy_name).'"><input type="submit" value="Accept"></form></td>
										<td align="right"><form action="?view=shopsystem" method="POST"><input type="submit" value="Cancel"></form></td></tr>
										<tr bgcolor="'.$config['site']['darkborder'].'"><td colspan="3"></td></tr>
										</table> 
										';
									}
								}
								else
								{
									$errormessage .= 'Player with name <b>'.htmlspecialchars($buy_name).'</b> doesn\'t exist. Please <a href="?view=shopsystem&action=select_player&buy_id='.$buy_id.'">select other name</a>.';
								}
							}
							else
							{
								$errormessage .= 'Invalid name format. Please <a href="?view=shopsystem&action=select_player&buy_id='.$buy_id.'">select other name</a> or contact with administrator.';
							}
						}
						else
						{
							$errormessage .= 'For this item you need <b>'.$buy_offer['points'].'</b> points. You have only <b>'.$user_premium_points.'</b> Tibia Coins. Please <a href="?view=shopsystem">select other item</a> or buy tibia coins.';
						}
					}
					else
					{
						$errormessage .= 'Offer with ID <b>'.$buy_id.'</b> doesn\'t exist. Please <a href="?view=shopsystem">select item</a> again.';
					}
				}
			}
		}
		if(!empty($errormessage))
		{
			$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
				<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Informations</B></TD></TR>
				<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.$errormessage.'</b></TD></TR>
				</table>';
		}
		if(!$set_session)
		{
			unset($_SESSION['viewed_confirmation_page']);
		}
	}
	elseif($action == 'show_history')
	{
		if(!$logged)
		{
			$errormessage .= 'Please login first.';
		}
		else
		{
			$items_history_received = $SQL->query('SELECT * FROM '.$SQL->tableName('z_shop_history_item').' WHERE '.$SQL->fieldName('to_account').' = '.$SQL->quote($account_logged->getId()).' OR '.$SQL->fieldName('from_account').' = '.$SQL->quote($account_logged->getId()).';');
			if(is_object($items_history_received))
			{
				foreach($items_history_received as $item_received)
				{
					if($account_logged->getId() == $item_received['to_account'])
						$char_color = 'green';
					else
						$char_color = 'red';
					$items_received_text .= '<tr bgcolor="'.$config['site']['lightborder'].'"><td><font color="'.$char_color.'">'.htmlspecialchars($item_received['to_name']).'</font></td><td>';
					if($account_logged->getId() == $item_received['from_account'])
						$items_received_text .= '<i>Your account</i>';
					else
						$items_received_text .= htmlspecialchars($item_received['from_nick']);
					$items_received_text .= '</td><td>'.htmlspecialchars($item_received['offer_id']).'</td><td>'.date("j F Y, H:i:s", $item_received['trans_start']).'</td>';
					if($item_received['trans_real'] > 0)
						$items_received_text .= '<td>'.date("j F Y, H:i:s", $item_received['trans_real']).'</td>';
					else
						$items_received_text .= '<td><b><font color="red">Not realized yet.</font></b></td>';
					$items_received_text .= '</tr>';
				}
			}
			$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
				<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'"></TD></TR>
				<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><center><B>Transactions History</B></center></TD></TR>
				<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'"></TD></TR> 
				</table><br>';
				
			if(!empty($items_received_text))
			{
				$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
					<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white colspan="5"><B>Item Transactions</B></TD></TR>
					<tr bgcolor="'.$config['site']['darkborder'].'"><td><b>To:</b></td><td><b>From:</b></td><td><b>Offer name</b></td><td><b>Bought on page</b></td><td><b>Received on OTS</b></td></tr>
					'.$items_received_text.'
					</table><br />';
			}
			if(empty($items_received_text))
				$errormessage .= 'You did not buy/receive any item.';
		}
		if(!empty($errormessage))
		{
			$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
				<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Informations</B></TD></TR>
				<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.$errormessage.'</b></TD></TR>
				</table>';
		}
	}
	$main_content .= '<br>';
}
else
	$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
	<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=center CLASS=white ><B>Shop Information</B></TD></TR>
	<TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><center>Shop is currently closed. [to admin: edit it in \'config/config.php\']</TD></TR>
	</table>';
	

                                        elseif ($buy_offer['type'] == 'item')
                                        if(file_exists('images/items/'.$buy_offer['item_id'].'.gif')) {
                                        $main_content .= '<img src="images/items/'.$buy_offer['item_id'].'.gif" height="32" width="32">';
                                        } else {
                                        $main_content .= '<img src="images/items/notfound.gif" height="32" width="32">';
                                        }
                                         else {
                                        $main_content .= '<img src="'.$layout_name.'/images/items/notfound.gif">';
                                        }    
    
                                        elseif ($buy_offer['type'] == 'itemvip')
                                        if(file_exists('images/items/'.$buy_offer['item_id'].'.gif')) {
                                        $main_content .= '<img src="images/items/'.$buy_offer['item_id'].'.gif" height="32" width="32">