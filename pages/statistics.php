<?php
if(!defined('INITIALIZED'))
	exit;

$main_content .= '
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Lost Account Interface</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" role="form" action="?view=account&action=changecomment" method="post">
				<fieldset>
					<div class="form-group">
						<label for="name" class="col-lg-2 control-label">Name</label>
						<div class="col-lg-10">
					  		<p class="form-control-static">x</p>
						</div>
					</div>

					<div class="form-group">
						<label for="sex" class="col-lg-2 control-label">Sex</label>
						<div class="col-lg-10">
					  		<p class="form-control-static">x</p>
						</div>
					</div>

					<div class="text-center">
						<a class="btn btn-default" href="'.$config['site']['url'].'">Back</a>
					</div>

				</fieldset>
			</form>
		</div>
	</div>
';
