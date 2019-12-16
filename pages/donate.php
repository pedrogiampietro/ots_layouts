<?php

switch($action)
{
	default:
	{
		if($logged)
		{

			$main_content .= '
			<div class="panel panel-default">
			<div class="panel-heading">
			<h3 class="panel-title">Purchase Coins: Payment Options</h3>
			</div>
			<div class="panel-body">
			<ul class="nav nav-tabs">
			<li class="active"><a href="#paypal" data-toggle="tab">Paypal</a></li>
			<li><a href="#pagseguro" data-toggle="tab">Pagseguro</a></li>
			</ul>
			<div id="tabContent" class="tab-content">';

			require_once('./custom_scripts/paypal/config.php');
			$main_content .= '
			<div class="tab-pane fade active in" id="paypal">
			<p>Using PayPal you can pay directly from your PayPal account, using a credit card or with an e-check payment.</p>
			<p><span class="label label-success">Bonus:</span> Pay with PayPal and get <span class="label label-info">20%</span> more shop coins for your money!</p>
			<p><span class="label label-info">You can make a purchase you need to send an email to thoriaonline@gmail.com confirming the payment.</span></p><br>
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
			<label for="select" class="col-lg-5 control-label">How much do you want to spend in BRL?</label>
			<div class="col-lg-7">
			<input type="text" class="form-control" name="amount" id="amount" value="1.00" onkeydown="document.getElementById(\'coins\').value = Math.floor(this.value * 11) + \' coins\';" onkeypress="document.getElementById(\'coins\').value = Math.floor(this.value * 11) + \' coins\';" onkeyup="if(this.value.indexOf(\'.\') + 3 < this.value.length) this.value = this.value.substring(0, this.value.indexOf(\'.\') + 3); document.getElementById(\'coins\').value = Math.floor(this.value * 11) + \' coins\';" onblur="this.value=Math.max(1,this.value);document.getElementById(\'coins\').value = Math.floor(this.value * 11) + \' coins\';" onmaxlength="8">
			</div>
			</div>

			<div class="form-group">
			<label for="coins" class="col-lg-5 control-label">For that amount you will receive</label>
			<div class="col-lg-7">
			<input type="text" class="form-control" id="coins" value="11 coins" readonly="readonly">
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


			$main_content .= '
			<div class="tab-pane" id="pagseguro">
			<p>Using Pagseguro you can pay directly from your Pagseguro account, using a credit card or with an e-check payment.</p>
			<br>
			We inform players and contributors that <b>'.$config['site']['server_name'].'</b> has no financial interest. All income obtained is directly reapplied to the
			server maintenance - this means that by making a donation, you are ensuring stability and increasing the quality of the server.</br></br>
			
			The points that are passed on to the players who make the donations represent our gratification, that is, you are not buying
			points and yes receiving a symbolic bonus (in points forms) that benefits you inside the game; you can use your points the way you want.</br></br>
			The spirit of this system is simple: in order to get closer to the players and make you feel at home, we understand your donation as a way of hand
			credibility. Believing that its worth investing in server maintenance, we invest in you. </br> </br>
			
			<div id="title2"> <h7> Terms of Donation </h7> </div>
			
			
			To make donations to the <b>'.$config['site']['server_name'].'</b> 
			the customer must be aware and agree to the following terms: <br/> <br/>
			
			<b>1)</b> Our company is not responsible for donations made by underage players. <br/>
			<b>2)</b> Issues related to donations will be treated exclusively by email, ie, no charge, doubts, etc. will be tolerated on such
				matter within the game, in the forum of the site, or in any other place, act subject to punishment. <br/>
			<b>3)</b> After the donation has been made, the client will no longer be able to cancel it and will not have in any way the reimbursement of the amount donated. <br/>
			<b>4)</b> New terms may appear without notice if necessary. </br> </br>

			<div id="title2"> <h7> Pagseguro </h7> </div>

						
				PagSeguro is the complete solution for online payments, which guarantees the security of those who buy and sell on the web.
			Those who buy with PagSeguro are guaranteed the product or service delivered or their money back. <br/> <br/>
			PagSeguro aims to foster electronic commerce, eliminating the barriers that make it difficult to negotiate.
			The main challenge is to increase confidence and security in transactions, eliminating the fear and insecurity of buyers. <br/> <br/>
			With PagSeguro you can make payments through online debit, bank slip and credit card of several flags up to 18x.           	           

			
			You will be redirected to the PagSeguro Site, where you can make the donation safely.
			<br/> <br/>  <center> <img alt="Pagseguro Banner" src="layouts/metro/images/pag_seg.gif" /> </center><br><br>
			<form class="form-horizontal" target="pagseguro" method="post" action="dntpagseguro.php">
			<fieldset>
			<center><span class="label label-info">Remembering that every R$10.00 you get 110 points.</span></center><br>
			<div class="form-group">
			<label for="select" class="col-lg-5 control-label">How many points do you want?</label>
			<div class="col-lg-7">
			<input class="form-control" name="itemCount" value="1.00" min="1" size="5" maxlength="5">
			</div>
			</div>
			<div style="margin-top: 15px;" class="text-center">
			<button type="submit" class="btn btn-primary">Proceed with PagSeguro</button>
			</div>
			</fieldset>
			</form>
		<br>
		<br>
		<b><span style="color:#ff0000;">OBS:</span></b> Points are delivered <b>automatically</b> after the <u>approved</u> of your payment by PagSeguro.</b></div></div></div>
			</div>
			';
		}
		else
		{		
			$main_content .= '
			<div style="margin-bottom: 0px;" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Donate</h3>
			</div>
			<div class="panel-body">
				<div class="alert alert-danger">You are not logged in. <a class="alert-link" href="?view=account">Log in</a> first to make a donate.</div>
				</div>
			</div>';

		}
		break;
	}
}

?>

