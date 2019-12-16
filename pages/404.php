<?php
if(!defined('INITIALIZED'))
	exit;

$main_content .= '<div class="panel panel-default">
	<div class="panel-heading"><h3 class="panel-title">Page not found</h3></div>
	<div class="panel-body">
		<div class="error-404">
			<div class="error-code m-b-10 m-t-20">404 <i class="fa fa-warning"></i></div>
			<h2 class="font-bold">Oops 404! That page can’t be found.</h2>
			<div class="error-desc">
				<p>Sorry, but the page you are looking for was either not found or does not exist. <br/>
				Try refreshing the page or click the button below to go back to the Homepage.</p><br>
				<div class="text-center">
					<a href="'.$config['site']['url'].'" class="btn btn-primary"><span class="fa fa-home"></span> Go back to Homepage</a>
				</div>
			</div>
		</div>
	</div>
</div>';
