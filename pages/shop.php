<?php
if (!defined('INITIALIZED'))
	exit;

if ($config['site']['shop_system'])
{

	if ($logged)
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
		if ($data['offer_type'] == 'item')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif ($data['offer_type'] == 'exclusive')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif ($data['offer_type'] == 'misc')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['item_id'] = $data['itemid1'];
			$offer['item_count'] = $data['count1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif ($data['offer_type'] == 'outfit')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['maleLookType'] = $data['itemid1'];
			$offer['addons'] = $data['count1'];
			$offer['femaleLookType'] = $data['itemid2'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		elseif ($data['offer_type'] == 'mount')
		{
			$offer['id'] = $data['id'];
			$offer['type'] = $data['offer_type'];
			$offer['mountid'] = $data['itemid1'];
			$offer['points'] = $data['points'];
			$offer['description'] = $data['offer_description'];
			$offer['name'] = $data['offer_name'];
		}
		return $offer;
	}

	function getOfferArray()
	{
		$offer_list = $GLOBALS['SQL']->query('SELECT * FROM '.$GLOBALS['SQL']->tableName('z_shop_offer').' ORDER BY `id` ASC;');
		$i_item = 0;
		$i_exclusive = 0;
		$i_misc = 0;
		$i_outfit = 0;
		$i_mount = 0 ;
		while($data = $offer_list->fetch())
		{
			if ($data['offer_type'] == 'item')
			{
				$offer_array['item'][$i_item]['id'] = $data['id'];
				$offer_array['item'][$i_item]['item_id'] = $data['itemid1'];
				$offer_array['item'][$i_item]['item_count'] = $data['count1'];
				$offer_array['item'][$i_item]['points'] = $data['points'];
				$offer_array['item'][$i_item]['description'] = $data['offer_description'];
				$offer_array['item'][$i_item]['name'] = $data['offer_name'];
				$i_item++;
			}
			elseif ($data['offer_type'] == 'exclusive')
			{
				$offer_array['exclusive'][$i_exclusive]['id'] = $data['id'];
				$offer_array['exclusive'][$i_exclusive]['item_id'] = $data['itemid1'];
				$offer_array['exclusive'][$i_exclusive]['item_count'] = $data['count1'];
				$offer_array['exclusive'][$i_exclusive]['points'] = $data['points'];
				$offer_array['exclusive'][$i_exclusive]['description'] = $data['offer_description'];
				$offer_array['exclusive'][$i_exclusive]['name'] = $data['offer_name'];
				$i_exclusive++;
			}
			elseif ($data['offer_type'] == 'misc')
			{
				$offer_array['misc'][$i_misc]['id'] = $data['id'];
				$offer_array['misc'][$i_misc]['item_id'] = $data['itemid1'];
				$offer_array['misc'][$i_misc]['item_count'] = $data['count1'];
				$offer_array['misc'][$i_misc]['points'] = $data['points'];
				$offer_array['misc'][$i_misc]['description'] = $data['offer_description'];
				$offer_array['misc'][$i_misc]['name'] = $data['offer_name'];
				$i_misc++;
			}
			elseif ($data['offer_type'] == 'outfit')
			{
				$offer_array['outfit'][$i_outfit]['id'] = $data['id'];
				$offer_array['outfit'][$i_outfit]['maleLookType'] = $data['itemid1'];
				$offer_array['outfit'][$i_outfit]['addons'] = $data['count1'];
				$offer_array['outfit'][$i_outfit]['femaleLookType'] = $data['itemid2'];
				$offer_array['outfit'][$i_outfit]['points'] = $data['points'];
				$offer_array['outfit'][$i_outfit]['description'] = $data['offer_description'];
				$offer_array['outfit'][$i_outfit]['name'] = $data['offer_name'];
				$i_outfit++;
			}
			elseif ($data['offer_type'] == 'mount')
			{
				$offer_array['mount'][$i_mount]['id'] = $data['id'];
				$offer_array['mount'][$i_mount]['mountid'] = $data['itemid1'];
				$offer_array['mount'][$i_mount]['points'] = $data['points'];
				$offer_array['mount'][$i_mount]['description'] = $data['offer_description'];
				$offer_array['mount'][$i_mount]['name'] = $data['offer_name'];
				$i_mount++;
			}
		}
		return $offer_array;
	}
	if (($action == '') || ($action == 'item') || ($action == 'outfit') || ($action == 'mount') || ($action == 'misc') || ($action == 'exclusive'))
	{
		unset($_SESSION['viewed_confirmation_page']);
		$offer_list = getOfferArray();
		//avar_dump($offer_list);
		if (empty($action))
		{
			if (count($offer_list['item']) > 0)
				$action = 'item';
			elseif (count($offer_list['exclusive']) > 0)
				$action = 'exclusive';
			elseif (count($offer_list['misc']) > 0)
				$action = 'misc';
			elseif (count($offer_list['outfit']) > 0)
				$action = 'outfit';
			elseif (count($offer_list['mount']) > 0)
				$action = 'mount';

		}

		function selectcolor($value)
		{
			if ($GLOBALS['action'] == $value)
				return '#505050; color: #FFFFFF';
			else
				return '#303030; color: #aaaaaa';
		}

		$itemData = '';
		$exclusiveData = '';
		$outfitData = '';
		$mountData = '';
		$miscData = '';

		if (isset($offer_list['item'])) {
			foreach ($offer_list['item'] as $item) {
				$itemData .= '
					<tr>
						<td width="5%"><img src="' . $config['site']['item_images_url'] . $item['item_id'] . $config['site']['item_images_extension'] . '"></td>
						<td><strong>'.$item['name'].'</strong> <span class="label label-info">'.$item['points'].' coins</span><br>'.$item['description'].'</td>
						<td width="35%">
							<div class="pull-right">
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$item['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
							</div>
						</td>
					</tr>
				';
			}
		}

		if (isset($offer_list['exclusive'])) {
			foreach ($offer_list['exclusive'] as $exclusive) {
				$exclusiveData .= '
					<tr>
						<td width="5%"><img src="' . $config['site']['item_images_url'] . $exclusive['item_id'] . $config['site']['item_images_extension'] . '"></td>
						<td><strong>'.$exclusive['name'].'</strong> <span class="label label-info">'.$exclusive['points'].' coins</span><br>'.$exclusive['description'].'</td>
						<td width="35%">
							<div class="pull-right">
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$exclusive['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
							</div>
						</td>
					</tr>
				';
			}
		}

		if (isset($offer_list['outfit'])) {
			foreach ($offer_list['outfit'] as $outfit) {
				$outfitData .= '
					<tr>
						<td width="5%"><div style="position: relative; width: 32px; height: 32px;"><div style="background-image: url(' . $config['site']['outfit_images_url'] . '?id=' . $outfit['maleLookType'] . '&addons=' . $outfit['addons'] . '&head=95&body=113&legs=39&feet=115); position: absolute; width: 64px; height: 80px; background-position: bottom right; background-repeat: no-repeat; right: 0px; bottom: 0px;"></div></div></td>
						<td><strong>'.$outfit['name'].'</strong> <span class="label label-info">'.$outfit['points'].' coins</span><br>'.$outfit['description'].'</td>
						<td width="35%">
							<div class="pull-right">
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$outfit['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
							</div>
						</td>
					</tr>
				';
			}
		}

		if (isset($offer_list['mount'])) {
			foreach ($offer_list['mount'] as $mount) {
				$mountData .= '
					<tr>
						<td width="5%"><img src="images/shop/mount/' . $mount['name'] . $config['site']['item_images_extension'] . '" alt="" /></td>
						<td><strong>'.$mount['name'].'</strong> <span class="label label-info">'.$mount['points'].' coins</span><br>'.$mount['description'].'</td>
						<td width="35%">
							<div class="pull-right">
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$mount['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
							</div>
						</td>
					</tr>
				';
			}
		}

		if (isset($offer_list['misc'])) {
			foreach ($offer_list['misc'] as $misc) {
				$miscData .= '
					<tr>
						<td width="5%"><img src="' . $config['site']['item_images_url'] . $misc['item_id'] . $config['site']['item_images_extension'] . '"></td>
						<td><strong>'.$misc['name'].'</strong> <span class="label label-info">'.$misc['points'].' coins</span><br>'.$misc['description'].'</td>
						<td width="35%">
							<div class="pull-right">
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$misc['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
							</div>
						</td>
					</tr>
				';
			}
		}

?>

<div class="panel panel-default">
	<div class="panel-heading">
		<?php if ($logged) { ?>
			<div class="pull-right">
				<span class="label btn-info" style="top:-7px;position:relative;" >You have <?php echo $account_logged->getCustomField('premium_points'); ?> coins</span>
				<a href="?view=purchasecoins" style="top:-7px;position:relative;" class="btn btn-warning btn-sm"><i class="fa fa-cart-plus fa-lg"></i> Purchase Coins</a>
			</div>
		<?php } ?>
		<h3 class="panel-title">Shop</h3>
	</div>
	<div class="panel-body">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#items" data-toggle="tab" aria-expanded="true">Items</a></li>
			<li><a href="#exclusive" data-toggle="tab" aria-expanded="true">Exclusive</a></li>
			<li><a href="#outfits" data-toggle="tab" aria-expanded="true">Outfits</a></li>
			<li><a href="#mounts" data-toggle="tab" aria-expanded="true">Mounts</a></li>
			<li><a href="#misc" data-toggle="tab" aria-expanded="true">Misc</a></li>
		</ul>

		<div id="shopContent" class="tab-content">
			<div class="tab-pane fade active in" id="items">
				<table class="table table-condensed table-content table-striped">
					<tbody>
						<?php echo $itemData; ?>
					</tbody>
				</table>
			</div>

			<div class="tab-pane fade" id="exclusive">
				<table class="table table-condensed table-content table-striped">
					<tbody>
				<?php echo $exclusiveData; ?>
					</tbody>
				</table>
			</div>

			<div class="tab-pane fade" id="outfits">
				<table class="table table-condensed table-content table-striped">
					<tbody>
				<?php echo $outfitData; ?>
					</tbody>
				</table>
			</div>

			<div class="tab-pane fade" id="mounts">
				<table class="table table-condensed table-content table-striped">
					<tbody>
				<?php echo $mountData; ?>
					</tbody>
				</table>
			</div>

			<div class="tab-pane fade" id="misc">
				<table class="table table-condensed table-content table-striped">
					<tbody>
				<?php echo $miscData; ?>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</div>

<?php
	}

	if ($action == 'select_player') {
		unset($_SESSION['viewed_confirmation_page']);
		if(!$logged) {
			$errormessage .= 'Please login first.';
		}
		else
		{
			$buy_id = (int) $_REQUEST['buy_id'];
			if(empty($buy_id))
			{
				$errormessage .= 'Please <a href="?view=shop">select item</a> first.';
			}
			else
			{
				$buy_offer = getItemByID($buy_id);
				if(isset($buy_offer['id'])) //item exist in database
				{
					if($user_premium_points >= $buy_offer['points'])
					{
						$main_content .= '
							<div class="panel panel-default">
								<div class="panel-heading"><h3 class="panel-title">Shop</h3></div>
								<div class="panel-body">

									<div class="panel panel-primary">
										<div class="panel-heading"><h3 class="panel-title">Selected Offer</h3></div>
										<div class="panel-body">
											<table class="table table-condensed table-content table-striped">
												<thead>
													<tr>
														<th>Name</th>
														<th width="50%">Description</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>'.htmlspecialchars($buy_offer['name']).'</td>
														<td>'.htmlspecialchars($buy_offer['description']).'</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div class="panel panel-primary">
										<div class="panel-heading"><h3 class="panel-title">Enter a character name that shall receive the gift</h3></div>
										<div class="panel-body">
											<form class="form-horizontal" role="form" action="?view=shop&action=confirm_transaction" method="post">
												<input type="hidden" name="buy_id" value="'.$buy_id.'">
												<div class="form-group">
													<label for="receiver" class="col-lg-2 control-label">Receiver</label>
													<div class="col-lg-10">
														<input type="text" class="form-control" id="buy_name" name="buy_name" placeholder="2 to 30 characters" maxlength="30" required>
													</div>
												</div>

												<div class="form-group">
													<label for="sender" class="col-lg-2 control-label">Sender</label>
													<div class="col-lg-10">
														<input type="text" class="form-control" id="buy_from" name="buy_from" placeholder="Anonymous">
													</div>
												</div>


												<div class="text-center">
													<button type="submit" class="btn btn-primary" value="Give">Send</button>
													<a class="btn btn-default" href="?view=shop">Cancel</a>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						';

					}
					else
					{
						$errormessage .= 'For this item you need <b>'.$buy_offer['points'].'</b> coins. You have only <b>'.$user_premium_points.'</b> shop coins. Please <a href="?view=shop">select other item</a> or buy shop coins.';
					}
				}
				else
				{
					$errormessage .= 'Offer with ID <b>'.$buy_id.'</b> doesn\'t exist. Please <a href="?view=shop">select item</a> again.';
				}
			}
		}
		if(!empty($errormessage))
		{
			$main_content .= '<div class="alert alert-danger">'.$errormessage.'</div>';
		}
	} elseif ($action == 'confirm_transaction') {
		if(!$logged) {
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
				$errormessage .= 'Please <a href="?view=shop">select item</a> first.';
			}
			else
			{
				if(!check_name($buy_from))
				{
					$errormessage .= 'Invalid nick ("from player") format. Please <a href="?view=shop&action=select_player&buy_id='.$buy_id.'">select other name</a> or contact with administrator.';
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
										if($buy_offer['type'] == 'item' || $buy_offer['type'] == 'misc' || $buy_offer['type'] == 'exclusive')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote('').', '.$SQL->quote('').', '.$SQL->quote('item').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('').', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '
												<div class="panel panel-default">
													<div class="panel-heading"><h3 class="panel-title">Item Added</h3></div>
													<div class="panel-body">
														<p><b>'.htmlspecialchars($buy_player->getName()).'</b> has received the product <b>'.htmlspecialchars($buy_offer['name']).'</b>. '.$buy_offer['points'].' shop coins was taken from your account.</p>
														<div class="text-center">
															<a class="btn btn-primary" href="?view=shop">Return to the shop</a>
														</div>
													</div>
												</div>
											';

										}

										elseif($buy_offer['type'] == 'container')
										{
											$sql = 'INSERT INTO '.$SQL->tableName('z_ots_comunication').' ('.$SQL->fieldName('id').','.$SQL->fieldName('name').','.$SQL->fieldName('type').','.$SQL->fieldName('action').','.$SQL->fieldName('param1').','.$SQL->fieldName('param2').','.$SQL->fieldName('param3').','.$SQL->fieldName('param4').','.$SQL->fieldName('param5').','.$SQL->fieldName('param6').','.$SQL->fieldName('param7').','.$SQL->fieldName('delete_it').') VALUES (NULL, '.$SQL->quote($buy_player->getName()).', '.$SQL->quote('login').', '.$SQL->quote('give_item').', '.$SQL->quote($buy_offer['item_id']).', '.$SQL->quote($buy_offer['item_count']).', '.$SQL->quote($buy_offer['container_id']).', '.$SQL->quote($buy_offer['container_count']).', '.$SQL->quote('container').', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('').', '.$SQL->quote(1).');';
											$SQL->query($sql);
											$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('wait').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
											$SQL->query($save_transaction);
											$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
											$user_premium_points = $user_premium_points - $buy_offer['points'];
											$main_content .= '
												<div class="panel panel-default">
													<div class="panel-heading"><h3 class="panel-title">Container Added</h3></div>
													<div class="panel-body">
														<p><b>'.htmlspecialchars($buy_player->getName()).'</b> has received the product <b>'.htmlspecialchars($buy_offer['name']).'</b>. '.$buy_offer['points'].' shop coins was taken from your account.</p>
														<div class="text-center">
															<a class="btn btn-primary" href="?view=shop">Return to the shop</a>
														</div>
													</div>
												</div>
											';
										}

										elseif ($buy_offer['type'] == 'outfit')
										{
											if (!$buy_player->isOnline()) {
												$maleLookType = $buy_offer['maleLookType'];
												$femaleLookType = $buy_offer['femaleLookType'];
												$addons = $buy_offer['addons'];
												if (!$buy_player->hasOutfit($maleLookType, $addons) && !$buy_player->hasOutfit($femaleLookType, $addons)) {

													$buy_player->addOutfit($maleLookType, $addons);
													$buy_player->addOutfit($femaleLookType, $addons);
													$buy_player->save();

													$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('realized').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
													$SQL->query($save_transaction);

													$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
													$user_premium_points = $user_premium_points - $buy_offer['points'];
													$main_content .= '
														<div class="panel panel-default">
															<div class="panel-heading"><h3 class="panel-title">Outfit Added</h3></div>
															<div class="panel-body">
																<p><b>'.htmlspecialchars($buy_player->getName()).'</b> has received the <b>'.htmlspecialchars($buy_offer['name']).'</b>. '.$buy_offer['points'].' shop coins was taken from your account.</p>
																<div class="text-center">
																	<a class="btn btn-primary" href="?view=shop">Return to the shop</a>
																</div>
															</div>
														</div>
													';
												} else {
													$main_content .= '
														<div class="panel panel-default">
															<div class="panel-heading"><h3 class="panel-title">Shop Error</h3></div>
															<div class="panel-body">
																<p>This player already own this outfit.</p>
																<div class="text-center">
																	<a class="btn btn-primary" href="?view=shop">Return to the shop</a>
																</div>
															</div>
														</div>
													';
												}
											} else {
												$main_content .= '
													<div class="panel panel-default">
														<div class="panel-heading"><h3 class="panel-title">Shop Error</h3></div>
														<div class="panel-body">
															<p>The player has to be offline in order to proceed.</p>
															<div class="text-center">
																<a class="btn btn-primary" href="?view=shop">Return to the shop</a>
															</div>
														</div>
													</div>
												';
											}
										}

										elseif ($buy_offer['type'] == 'mount')
										{
											if (!$buy_player->isOnline()) {
												$playerId = $buy_player->getId();
												$mountId = $buy_offer['mountid'];
												if (!$buy_player->hasMount($mountId)) {

													$buy_player->addMount($mountId);
													$buy_player->save();

													$save_transaction = 'INSERT INTO '.$SQL->tableName('z_shop_history_item').' ('.$SQL->fieldName('id').','.$SQL->fieldName('to_name').','.$SQL->fieldName('to_account').','.$SQL->fieldName('from_nick').','.$SQL->fieldName('from_account').','.$SQL->fieldName('price').','.$SQL->fieldName('offer_id').','.$SQL->fieldName('trans_state').','.$SQL->fieldName('trans_start').','.$SQL->fieldName('trans_real').') VALUES ('.$SQL->lastInsertId().', '.$SQL->quote($buy_player->getName()).', '.$SQL->quote($buy_player_account->getId()).', '.$SQL->quote($buy_from).',  '.$SQL->quote($account_logged->getId()).', '.$SQL->quote($buy_offer['points']).', '.$SQL->quote($buy_offer['name']).', '.$SQL->quote('realized').', '.$SQL->quote(time()).', '.$SQL->quote(0).');';
													$SQL->query($save_transaction);

													$account_logged->setCustomField('premium_points', $user_premium_points-$buy_offer['points']);
													$user_premium_points = $user_premium_points - $buy_offer['points'];
													$main_content .= '
														<div class="panel panel-default">
															<div class="panel-heading"><h3 class="panel-title">Mount Added</h3></div>
															<div class="panel-body">
																<p><b>'.htmlspecialchars($buy_player->getName()).'</b> has received the <b>'.htmlspecialchars($buy_offer['name']).'</b>. '.$buy_offer['points'].' shop coins was taken from your account.</p>
																<div class="text-center">
																	<a class="btn btn-primary" href="?view=shop">Return to the shop</a>
																</div>
															</div>
														</div>
													';
												} else {
													$main_content .= '
														<div class="panel panel-default">
															<div class="panel-heading"><h3 class="panel-title">Shop Error</h3></div>
															<div class="panel-body">
																<p>This player already own this mount.</p>
																<div class="text-center">
																	<a class="btn btn-primary" href="?view=shop">Return to the shop</a>
																</div>
															</div>
														</div>
													';
												}
											} else {
												$main_content .= '
													<div class="panel panel-default">
														<div class="panel-heading"><h3 class="panel-title">Shop Error</h3></div>
														<div class="panel-body">
															<p>The player has to be offline in order to proceed.</p>
															<div class="text-center">
																<a class="btn btn-primary" href="?view=shop">Return to the shop</a>
															</div>
														</div>
													</div>
												';
											}
										}
									}
									else
									{
										$set_session = TRUE;
										$_SESSION['viewed_confirmation_page'] = 'yes';
										$main_content .= '
											<div class="panel panel-default">
												<div class="panel-heading"><h3 class="panel-title">Confirm</h3></div>
												<div class="panel-body">
													<form class="form-horizontal" role="form" action="?view=shop&action=confirm_transaction" method="post">
														<input type="hidden" name="buy_confirmed" value="yes">
														<input type="hidden" name="buy_id" value="'.$buy_id.'">
														<input type="hidden" name="buy_from" value="'.htmlspecialchars($buy_from).'">
														<input type="hidden" name="buy_name" value="'.htmlspecialchars($buy_name).'">

														<div class="panel panel-primary">
															<div class="panel-heading">Information</div>
															<table class="table table-striped table-condensed table-bordered">
																<tr>
																	<td width="20%">Product Name</td>
																	<td>'. htmlspecialchars($buy_offer['name']).'</td>
																</tr>
																<tr>
																	<td>Description</td>
																	<td>'. htmlspecialchars($buy_offer['description']).'</td>
																</tr>
																<tr>
																	<td>Cost</td>
																	<td>'. htmlspecialchars($buy_offer['points']).' shop coins</td>
																</tr>
																<tr>
																	<td>Receiver</td>
																	<td>'.htmlspecialchars($buy_player->getName()).'</td>
																</tr>
																<tr>
																	<td>Sender</td>
																	<td>'.htmlspecialchars($buy_from).'</td>
																</tr>
															</table>
														</div>

														<div class="text-center">
															<button type="submit" class="btn btn-success" value="Accept">Accept</button>
															<a class="btn btn-default" href="?view=shop">Cancel</a>
														</div>
													</form>
												</div>
											</div>
										';
									}
								}
								else
								{
									$errormessage .= 'Player with name <b>'.htmlspecialchars($buy_name).'</b> doesn\'t exist. Please <a href="?view=shop&action=select_player&buy_id='.$buy_id.'">select other name</a>.';
								}
							}
							else
							{
								$errormessage .= 'Invalid name format. Please <a href="?view=shop&action=select_player&buy_id='.$buy_id.'">select other name</a> or contact with administrator.';
							}
						}
						else
						{
							$errormessage .= 'For this item you need <b>'.$buy_offer['points'].'</b> coins. You have only <b>'.$user_premium_points.'</b> shop coins. Please <a href="?view=shop">select other item</a> or buy shop coins.';
						}
					}
					else
					{
						$errormessage .= 'Offer with ID <b>'.$buy_id.'</b> doesn\'t exist. Please <a href="?view=shop">select item</a> again.';
					}
				}
			}
		}
		if(!empty($errormessage))
		{
			$main_content .= '<div class="alert alert-danger">'.$errormessage.'</div>';
		}
		if(!$set_session)
		{
			unset($_SESSION['viewed_confirmation_page']);
		}
	} elseif ($action == 'show_history') {
		if (!$logged) {
			$errormessage .= 'Please login first.';
		} else {
			$items_history_received = $SQL->query('SELECT * FROM '.$SQL->tableName('z_shop_history_item').' WHERE '.$SQL->fieldName('to_account').' = '.$SQL->quote($account_logged->getId()).' OR '.$SQL->fieldName('from_account').' = '.$SQL->quote($account_logged->getId()).';');
			if (is_object($items_history_received)) {
				foreach($items_history_received as $item_received)
				{
					if ($account_logged->getId() == $item_received['to_account'])
						$char_color = 'green';
					else
						$char_color = 'red';
					$items_received_text .= '<tr bgcolor="'.$config['site']['lightborder'].'"><td><font color="'.$char_color.'">'.htmlspecialchars($item_received['to_name']).'</font></td><td>';
					if ($account_logged->getId() == $item_received['from_account'])
						$items_received_text .= '<i>Your account</i>';
					else
						$items_received_text .= htmlspecialchars($item_received['from_nick']);
					$items_received_text .= '</td><td>'.htmlspecialchars($item_received['offer_id']).'</td><td>'.date("j F Y, H:i:s", $item_received['trans_start']).'</td>';
					if ($item_received['trans_real'] > 0)
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

			if (!empty($items_received_text)) {
				$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
					<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white colspan="5"><B>Item Transactions</B></TD></TR>
					<tr bgcolor="'.$config['site']['darkborder'].'"><td><b>To:</b></td><td><b>From:</b></td><td><b>Offer name</b></td><td><b>Bought on page</b></td><td><b>Received on OTS</b></td></tr>
					'.$items_received_text.'
					</table><br />';
			}
			if (empty($items_received_text))
				$errormessage .= 'You did not buy/receive any item.';
		}

		if (!empty($errormessage)) {
			$main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
				<TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" ALIGN=left CLASS=white><B>Informations</B></TD></TR>
				<TR><TD BGCOLOR="'.$config['site']['lightborder'].'" ALIGN=left><b>'.$errormessage.'</b></TD></TR>
				</table>';
		}
	}
} else
	$main_content .= '
		<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title">Shop</h3></div>
		<div class="panel-body">
			<p>The shop is currently closed.</p>
			<div class="text-center">
				<a class="btn btn-primary" href="'.$config['site']['url'].'">Return to the homepage</a>
			</div>
		</div>
	</div>';
