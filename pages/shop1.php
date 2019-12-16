<?php
if(!defined('INITIALIZED'))
	exit;

// Start
/*if (count($_GET) == 1) {
	$main_content .= '
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Shop</h3>
			</div>
			<div class="panel-body">

				<div class="text-center">
					<a class="btn btn-primary" href="?view=shop&purchasecoins">Purchase Coins</a>
					<a class="btn btn-default" href="?view=shop&marketplace">Browse Marketplace</a>
				</div>
			</div>
		</div>
	';
}*/

if (isset($_GET['purchasecoins'])) {
	$proceed = (int) $_POST['proceed'];
	if (isset($proceed) && $proceed == 1) {
		if (!$logged) {
			$main_content .= '<div class="alert alert-danger">Oh no! You must be logged in to purchase coins. Please <a class="alert-link" href="?view=account&login">login</a>.</div>';
			return;
		}

		require_once('./custom_scripts/paypal/config.php');
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Purchase Coins: Payment Options</h3>
				</div>
				<div class="panel-body">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#paypal" data-toggle="tab" aria-expanded="true">PayPal</a></li>
						<li><a href="#zaypay" data-toggle="tab" aria-expanded="true">Zaypay</a></li>
					</ul>

					<div id="warsTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="paypal">
							<p>Using PayPal you can pay directly from your PayPal account, using a credit card or with an e-check payment.</p>
							<p><span class="label label-success">Bonus:</span> Pay with PayPal and get <span class="label label-info">20%</span> more shop coins for your money!</p><br>

							<form class="form-horizontal" role="form" action="https://www.paypal.com/cgi-bin/webscr" method="post">
								<input type="hidden" name="cmd" value="'.$paypal_payment_type.'">
								<input type="hidden" name="business" value="' . $paypal['mail'] . '">
								<input type="hidden" name="item_name" value="' . htmlspecialchars($paypal['name']) . '">
								<input type="hidden" name="custom" value="' . $account_logged->getID() . '">
								<input type="hidden" name="currency_code" value="' . htmlspecialchars($paypal['money_currency']) . '">
								<input type="hidden" name="no_note" value="0">
								<input type="hidden" name="no_shipping" value="1">
								<input type="hidden" name="notify_url" value="' . $paypal_report_url . '">
								<input type="hidden" name="return" value="' . $paypal_return_url . '">
								<input type="hidden" name="rm" value="0">
								<fieldset>

									<div class="form-group">
										<label for="amount" class="col-lg-5 control-label">How much do you want to spend (EUR)?</label>
										<div class="col-lg-7">
											<input type="number" class="form-control" id="amount" name="amount" value="3" min="1" max="99"
											onkeydown="document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';"
											onkeypress="document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';"
											onkeyup="if(this.value.indexOf('.') + 3 < this.value.length) this.value = this.value.substring(0, this.value.indexOf('.') + 3); document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';"
											onblur="this.value=Math.max(1,this.value);document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';"

											onmaxlength="8">
											<p class="help-block">This has to be at least 1 EUR.</p>
											<p class="help-block">... for the amount you want to spend you will receive</p>
											<input type="text" class="form-control" id="coins" value="360 coins" readonly="readonly">
											<br>
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Proceed with PayPal</button>
									</div>

								</fieldset>
							</form>
						</div>

						<div class="tab-pane fade" id="zaypay">
							<p>Using ZayPay you can pay from a selection of countries using Phone / SMS.</p><br>

							<form class="form-horizontal" role="form" action="" method="post">
								<fieldset>

									<div class="form-group">
										<label for="select" class="col-lg-3 control-label">Select a coin package</label>
										<div class="col-lg-9">
											<select class="form-control" name="coins">
												<option value="1">100 coins for 1 EUR</option>
												<option value="2">200 coins for 2 EUR</option>
												<option value="3">300 coins for 3 EUR</option>
												<option value="4">400 coins for 4 EUR</option>
											</select>
										</div>
									</div>

									<p><strong>Important:</strong> The prices represent what the amount of coins are worth in EUR. It might not be possible to pay that exact amount from your country, an accurate offer will be presented to you as you proceed and select your country.</p>


									<div class="text-center">
										<button type="submit" class="btn btn-primary">Proceed with Zaypay</button>
									</div>

								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		';
	} else {
		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Purchase Coins: Disclaimer</h3>
				</div>
				<div class="panel-body">
					<form role="form" method="post">
						<fieldset>
							<textarea readonly disabled cols="109"></textarea>

							<p><strong>Do you have agree with our terms?</strong></p>
							<div class="text-center">
								<button type="submit" class="btn btn-primary" name="proceed" value="1">I agree</button>
								<a class="btn btn-default" href="?view=shop">I disagree</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		';
	}
}

function getItemByID($id)
{
	$id = (int) $id;
	$SQL = $GLOBALS['SQL'];
	$data = $SQL->query('SELECT * FROM '.$SQL->tableName('z_shop_offer').' WHERE '.$SQL->fieldName('id').' = '.$SQL->quote($id).';')->fetch();
	if ($data['offer_type'] == 'item') {
		$offer['id'] = $data['id'];
		$offer['type'] = $data['offer_type'];
		$offer['item_id'] = $data['itemid1'];
		$offer['item_count'] = $data['count1'];
		$offer['points'] = $data['points'];
		$offer['description'] = $data['offer_description'];
		$offer['name'] = $data['offer_name'];

	} elseif ($data['offer_type'] == 'exclusive') {
		$offer['id'] = $data['id'];
		$offer['type'] = $data['offer_type'];
		$offer['item_id'] = $data['itemid1'];
		$offer['item_count'] = $data['count1'];
		$offer['points'] = $data['points'];
		$offer['description'] = $data['offer_description'];
		$offer['name'] = $data['offer_name'];

	} elseif ($data['offer_type'] == 'misc') {
		$offer['id'] = $data['id'];
		$offer['type'] = $data['offer_type'];
		$offer['item_id'] = $data['itemid1'];
		$offer['item_count'] = $data['count1'];
		$offer['points'] = $data['points'];
		$offer['description'] = $data['offer_description'];
		$offer['name'] = $data['offer_name'];

	} elseif ($data['offer_type'] == 'outfit') {
		$offer['id'] = $data['id'];
		$offer['type'] = $data['offer_type'];
		$offer['maleLookType'] = $data['itemid1'];
		$offer['addons'] = $data['count1'];
		$offer['femaleLookType'] = $data['itemid2'];
		$offer['points'] = $data['points'];
		$offer['description'] = $data['offer_description'];
		$offer['name'] = $data['offer_name'];

	} elseif ($data['offer_type'] == 'mount') {
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
	while($data = $offer_list->fetch()) {
		if ($data['offer_type'] == 'item') {
			$offer_array['item'][$i_item]['id'] = $data['id'];
			$offer_array['item'][$i_item]['item_id'] = $data['itemid1'];
			$offer_array['item'][$i_item]['item_count'] = $data['count1'];
			$offer_array['item'][$i_item]['points'] = $data['points'];
			$offer_array['item'][$i_item]['description'] = $data['offer_description'];
			$offer_array['item'][$i_item]['name'] = $data['offer_name'];
			$i_item++;
		} elseif ($data['offer_type'] == 'exclusive') {
			$offer_array['exclusive'][$i_exclusive]['id'] = $data['id'];
			$offer_array['exclusive'][$i_exclusive]['item_id'] = $data['itemid1'];
			$offer_array['exclusive'][$i_exclusive]['item_count'] = $data['count1'];
			$offer_array['exclusive'][$i_exclusive]['points'] = $data['points'];
			$offer_array['exclusive'][$i_exclusive]['description'] = $data['offer_description'];
			$offer_array['exclusive'][$i_exclusive]['name'] = $data['offer_name'];
			$i_exclusive++;
		} elseif ($data['offer_type'] == 'misc') {
			$offer_array['misc'][$i_misc]['id'] = $data['id'];
			$offer_array['misc'][$i_misc]['item_id'] = $data['itemid1'];
			$offer_array['misc'][$i_misc]['item_count'] = $data['count1'];
			$offer_array['misc'][$i_misc]['points'] = $data['points'];
			$offer_array['misc'][$i_misc]['description'] = $data['offer_description'];
			$offer_array['misc'][$i_misc]['name'] = $data['offer_name'];
			$i_misc++;
		} elseif ($data['offer_type'] == 'outfit') {
			$offer_array['outfit'][$i_outfit]['id'] = $data['id'];
			$offer_array['outfit'][$i_outfit]['maleLookType'] = $data['itemid1'];
			$offer_array['outfit'][$i_outfit]['addons'] = $data['count1'];
			$offer_array['outfit'][$i_outfit]['femaleLookType'] = $data['itemid2'];
			$offer_array['outfit'][$i_outfit]['points'] = $data['points'];
			$offer_array['outfit'][$i_outfit]['description'] = $data['offer_description'];
			$offer_array['outfit'][$i_outfit]['name'] = $data['offer_name'];
			$i_outfit++;
		} elseif ($data['offer_type'] == 'mount') {
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

if (isset($_GET['marketplace'])) {

	$user_premium_points = $logged ? $account_logged->getCustomField('premium_points') : 0;
	if (empty($action)) {

		$itemData = '';
		$exclusiveData = '';
		$outfitData = '';
		$mountData = '';
		$miscData = '';

		unset($_SESSION['viewed_confirmation_page']);
		$offer_list = getOfferArray();
		if (isset($offer_list['item'])) {
			foreach ($offer_list['item'] as $item) {
				$itemData .= '
					<tr>
						<td width="5%"><img src="' . $config['site']['item_images_url'] . $item['item_id'] . $config['site']['item_images_extension'] . '"></td>
						<td><strong>'.$item['name'].'</strong> <span class="label label-info">'.$item['points'].' coins</span><br>'.$item['description'].'</td>
						<td width="35%">
							<div class="pull-right">
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&marketplace&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$item['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
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
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&marketplace&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$exclusive['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
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
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&marketplace&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$outfit['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
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
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&marketplace&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$mount['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
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
								' . (!$logged ? 'You need to <a href="?view=account&action=login">login</a> to buy this item.' : '<form class="form-horizontal" role="form" action="?view=shop&marketplace&action=select_player" method="post"><input type="hidden" id="offer" name="buy_id" value="'.$misc['id'].'"><button type="submit" class="btn btn-primary">Buy</button></form>').'
							</div>
						</td>
					</tr>
				';
			}
		}

		$main_content .= '
			<div class="panel panel-default">
				<div class="panel-heading">
					' . ($logged ? '<span class="label btn-warning pull-right">You have ' . $account_logged->getCustomField('premium_points') . ' coins.</span>' : '') . '
					<h3 class="panel-title">Marketplace</h3>
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
									' . $itemData . '
								</tbody>
							</table>
						</div>

						<div class="tab-pane fade" id="exclusive">
							<table class="table table-condensed table-content table-striped">
								<tbody>
									' . $exclusiveData . '
								</tbody>
							</table>
						</div>

						<div class="tab-pane fade" id="outfits">
							<table class="table table-condensed table-content table-striped">
								<tbody>
									' . $outfitData . '
								</tbody>
							</table>
						</div>

						<div class="tab-pane fade" id="mounts">
							<table class="table table-condensed table-content table-striped">
								<tbody>
									' . $mountData . '
								</tbody>
							</table>
						</div>

						<div class="tab-pane fade" id="misc">
							<table class="table table-condensed table-content table-striped">
								<tbody>
									' . $miscData . '
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		';
	} elseif ($action == 'select_player') {
		unset($_SESSION['viewed_confirmation_page']);
		if(!$logged) {
			$errormessage .= 'Please login first.';
		}
		else
		{
			$buy_id = (int) $_REQUEST['buy_id'];
			if(empty($buy_id))
			{
				$errormessage .= 'Please <a href="?view=shop&marketplace">select item</a> first.';
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
											<form class="form-horizontal" role="form" action="?view=shop&marketplace&action=confirm_transaction" method="post">
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
													<a class="btn btn-default" href="?view=shop&marketplace">Cancel</a>
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
						$errormessage .= 'For this item you need <b>'.$buy_offer['points'].'</b> coins. You have only <b>'.$user_premium_points.'</b> shop coins. Please <a class="alert-link" href="?view=shop&marketplace">select other item</a> or buy shop coins.';
					}
				}
				else
				{
					$errormessage .= 'Offer with ID <b>'.$buy_id.'</b> doesn\'t exist. Please <a href="?view=shop&marketplace">select item</a> again.';
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
				$errormessage .= 'Please <a href="?view=shop&marketplace">select item</a> first.';
			}
			else
			{
				if(!check_name($buy_from))
				{
					$errormessage .= 'Invalid nick ("from player") format. Please <a href="?view=shop&marketplace&action=select_player&buy_id='.$buy_id.'">select other name</a> or contact with administrator.';
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
															<a class="btn btn-primary" href="?view=shop&marketplace">Return to the shop</a>
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
															<a class="btn btn-primary" href="?view=shop&marketplace">Return to the shop</a>
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
																	<a class="btn btn-primary" href="?view=shop&marketplace">Return to the shop</a>
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
																	<a class="btn btn-primary" href="?view=shop&marketplace">Return to the shop</a>
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
																<a class="btn btn-primary" href="?view=shop&marketplace">Return to the shop</a>
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
																	<a class="btn btn-primary" href="?view=shop&marketplace">Return to the shop</a>
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
																	<a class="btn btn-primary" href="?view=shop&marketplace">Return to the shop</a>
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
																<a class="btn btn-primary" href="?view=shop&marketplace">Return to the shop</a>
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
													<form class="form-horizontal" role="form" action="?view=shop&marketplace&action=confirm_transaction" method="post">
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
															<a class="btn btn-default" href="?view=shop&marketplace">Cancel</a>
														</div>
													</form>
												</div>
											</div>
										';
									}
								}
								else
								{
									$errormessage .= 'Player with name <b>'.htmlspecialchars($buy_name).'</b> doesn\'t exist. Please <a href="?view=shop&marketplace&action=select_player&buy_id='.$buy_id.'">select other name</a>.';
								}
							}
							else
							{
								$errormessage .= 'Invalid name format. Please <a href="?view=shop&marketplace&action=select_player&buy_id='.$buy_id.'">select other name</a> or contact with administrator.';
							}
						}
						else
						{
							$errormessage .= 'For this item you need <b>'.$buy_offer['points'].'</b> coins. You have only <b>'.$user_premium_points.'</b> shop coins. Please <a href="?view=shop&marketplace">select other item</a> or buy shop coins.';
						}
					}
					else
					{
						$errormessage .= 'Offer with ID <b>'.$buy_id.'</b> doesn\'t exist. Please <a href="?view=shop&marketplace">select item</a> again.';
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
	}
}
