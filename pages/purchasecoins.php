<?php

switch($action)
{
	default:
	{
		if($logged)
		{

			$main_content .= '
			<div id="content_ajax"><style type="text/css" id="page_css"></style>
			<div id="page_ucp" class="page page_ucp ">
	<div class="page_header border_box">
			<h3 class="page_title">	<span>Account</span>
		 → 	<span>Purchase Coins</span>
		</h3>
						<a href="?view=account" class="back-to-account" title="Back to Account" data-hasevent="1">Back to Account</a>
				</div>
		<div class="page_body">
					<div class="page_body">
			<div id="tabContent" class="tab-content">';

			require_once('./custom_scripts/paypal/config.php');
			$main_content .= '
			<div class="tab-pane fade active in" id="paypal">
			<p>Using PayPal you can pay directly from your PayPal account, using a credit card or with an e-check payment.</p>
			<p><span class="label label-success">Bonus:</span> Pay with PayPal and get <span class="label label-info">20%</span> more shop coins for your money!</p>
			<p><span class="label label-info">You can make a purchase you need to send an email to @email confirming the payment.</span></p><br>
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

			<div class="form-group">
			<label for="select" class="col-lg-5 control-label">How much do you want to spend in EUR?</label>
			<div class="col-lg-7">
			<input type="text" class="form-control" name="amount" id="amount" value="1.00" onkeydown="document.getElementById(\'coins\').value = Math.floor(this.value * 1) + \' coins\';" onkeypress="document.getElementById(\'coins\').value = Math.floor(this.value * 1) + \' coins\';" onkeyup="if(this.value.indexOf(\'.\') + 3 < this.value.length) this.value = this.value.substring(0, this.value.indexOf(\'.\') + 3); document.getElementById(\'coins\').value = Math.floor(this.value * 1) + \' coins\';" onblur="this.value=Math.max(1,this.value);document.getElementById(\'coins\').value = Math.floor(this.value * 1) + \' coins\';" onmaxlength="8">
			</div>
			</div>

			<div class="form-group">
			<label for="coins" class="col-lg-5 control-label">For that amount you will receive</label>
			<div class="col-lg-7">
			<input type="text" class="form-control" id="coins" value="1 coins" readonly="readonly">
			</div>
			</div>
			<br>

			<div class="text-center">
			<button type="submit" class="nice_button">Proceed with PayPal</button>
			</div>

			</form>
			</div>
			';


			
		}
		else
		{		
			$main_content .= '
			<div id="content_ajax"><style type="text/css" id="page_css"></style>
		<div id="page_ucp" class="page page_ucp ">
<div class="page_header border_box">
		<h3 class="page_title">	<span>Account</span>
	 → 	<span>Purchase Coins</span>
	</h3>
					<a href="?view=account" class="back-to-account" title="Back to Account" data-hasevent="1">Back to Account</a>
			</div>
	<div class="page_body">
				<div class="page_body">
				<div class="alert alert-danger">You are not logged in. <a class="alert-link" href="?view=account">Log in</a> first to make a donate.</div>
				</div>
			</div>';

		}
		break;
	}
}

?>

