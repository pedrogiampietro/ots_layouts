<?php
if(!defined('INITIALIZED'))
	exit;

####################       CONFIG      ###################################################
# activate dotpay, zaypay and other systems: true / false
# making something active/not active here doesn't mean that people can somehow abuse X system to buy points
#
# Config about payment methods:
$payment_methods = array(
	'paypal' => array(
		'status' => 'active',

	),
	'zaypay' => array(
		'status' => 'active',
	),
);

if (!$logged) {
	$main_content .= '<div class="alert alert-danger">Oh no! You must be logged in to purchase coins. Please <a class="alert-link" href="?view=account&login">login</a>.</div>';
	return;
}

/*$accountId = 0;
$payalogueId = 0;

if (isset($_POST['zaypay']) && $_POST['zaypay'] == 'proceed') {
	$accountId = isset($_POST['accountId']) ? (int) $_POST['accountId'] : 0;
	$payalogueId = isset($_POST['payalogueId']) ? (int) $_POST['payalogueId'] : 0;

} else $_POST['zaypay'] = '';

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

			<div id="tabContent" class="tab-content">';

			require_once('./custom_scripts/paypal/config.php');
			$main_content .= '
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
								<label for="select" class="col-lg-5 control-label">How much do you want to spend in EUR?</label>
								<div class="col-lg-7">
									<input type="text" class="form-control" name="amount" id="amount" value="5.00" onkeydown="document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';" onkeypress="document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';" onkeyup="if(this.value.indexOf(\'.\') + 3 < this.value.length) this.value = this.value.substring(0, this.value.indexOf(\'.\') + 3); document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';" onblur="this.value=Math.max(1,this.value);document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';" onmaxlength="8">
								</div>
							</div>

							<div class="form-group">
								<label for="coins" class="col-lg-5 control-label">For that amount you will receive</label>
								<div class="col-lg-7">
									<input type="text" class="form-control" id="coins" value="600 coins" readonly="readonly">
								</div>
							</div>
							<br>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Proceed with PayPal</button>
							</div>

						</fieldset>
					</form>
				</div>
			';

			require_once('custom_scripts/zaypay/config.php');
			$main_content .= '
				<div class="tab-pane fade" id="zaypay">
					<p>Using ZayPay you can pay from a selection of countries using Phone / SMS.</p><br>
					<form class="form-horizontal" role="form" action="?view=purchasecoins" method="post">
						<input type="hidden" id="accountId" name="accountId" value="'.$account_logged->getID().'">
						<fieldset>';

						$main_content .= '
							<div class="form-group">
								<label for="select" class="col-lg-3 control-label">Select a coin package</label>
								<div class="col-lg-9">
									<select class="form-control" id="payalogueId" name="payalogueId">';
									foreach ($options as $option) {
										$main_content .= '<option value="'.$option['payalogue_id'].'">'.$option['points'].' coins for '.$option['name'].'</option>';
									}

									$main_content .= '</select>
								</div>
							</div>

							<p><strong>Important:</strong> The prices represent what the amount of coins are worth in EUR. It might not be possible to pay that exact amount from your country, an accurate offer will be presented to you as you proceed and select your country.</p>
							<div class="text-center">';
								if ($accountId != 0 && $payalogueId != 0) {
									$main_content .= '
										<script src="http://www.zaypay.com/pay/' . $payalogueId . '.js" type="text/javascript"></script>
										<a href="http://www.zaypay.com/pay/' . $payalogueId . '?acc=' . $accountId . '" onclick="ZPayment(this); return false" id="ZaypayPayalogue" class="btn btn-primary">Proceed with ZayPay</a>
										<script type=text/javascript>document.getElementById("ZaypayPayalogue").click();</script>
									';
								} else {
									$main_content .= '<button type="submit" class="btn btn-primary" name="zaypay" value="proceed">Proceed with ZayPay</button>';
								}

							$main_content .= '</div>
						</fieldset>
					</form>
				</div>
			</div>';
		$main_content .= '
		</div>
	</div>
';*/


require_once('./custom_scripts/paypal/config.php');
$main_content .= '
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Purchase Coins</h3>
		</div>
		<div class="panel-body">';
			$main_content .= '
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
							<label for="select" class="col-lg-5 control-label">How much do you want to spend in EUR?</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" name="amount" id="amount" value="5.00" onkeydown="document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';" onkeypress="document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';" onkeyup="if(this.value.indexOf(\'.\') + 3 < this.value.length) this.value = this.value.substring(0, this.value.indexOf(\'.\') + 3); document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';" onblur="this.value=Math.max(1,this.value);document.getElementById(\'coins\').value = Math.floor(this.value * 120) + \' coins\';" onmaxlength="8">
							</div>
						</div>

						<div class="form-group">
							<label for="coins" class="col-lg-5 control-label">For that amount you will receive</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" id="coins" value="600 coins" readonly="readonly">
							</div>
						</div>
						<br>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Proceed with PayPal</button>
						</div>

					</fieldset>
				</form>
			</div>
		</div>
			';
