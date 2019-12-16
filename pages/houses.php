<?php
if(!defined('INITIALIZED'))
	exit;

##-- town --##
$houses_town = (int) $_POST['town'];
if(count($towns_list) > 0)
{
	foreach($towns_list as $town_ids => $town_names)
	{
		if($town_ids == $houses_town)
		{
			$town_id = $town_ids;
			$town_name = $town_names;
		}
	}
}

$world_name = $config['server']['serverName'];
##-- owner --##
$houses_owner = (int) $_POST['owner'];
if($houses_owner == 0)
{
	$owner_sql = '';
}
elseif($houses_owner == 1)
{
	$owner_sql = ' AND owner = 0';
}
elseif($houses_owner == 2)
{
	$owner_sql = ' AND owner > 0';
}
##-- order --##
$houses_order = (int) $_POST['order'];
if($houses_order == 0)
{
	$order_sql = 'name';
}
elseif($houses_order == 1)
{
	$order_sql = 'size';
}
elseif($houses_order == 2)
{
	$order_sql = 'rent';
}
##-- status --##
$houses_status = 0;
if($houses_status == 0)
{
	$status_sql = ' AND guild = 0';
	$status_name = 'Houses and Flats';
}
elseif($houses_status == 1)
{
	$status_sql = ' AND guild = 1';
	$status_name = 'Guildhalls';
}
##-- List Houses --##
$id = (int) $_GET['show'];
if(empty($id))
{
	$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Houses</h3></div><div class="panel-body"><p>Here you can see the list of all available houses, flats or guildhalls. Please select the game world of your choice. Click on any view button to get more information about a house or adjust the search criteria and start a new search.</p>';
	if($houses_town > 0)
	{
		$main_content .= '<table class="table table-condensed table-content table-striped"><tbody>
			<tr>
				<td colspan=5><b>Available '.$status_name.' in '.$town_name.' on '.$world_name.'</b></td>
			</tr>
			<tr>
				<td width=26%><b>Name</b></td><td width=11%><b>Size</b></td><td width=15%><b>Rent</b></td><td width=30%><b>Status</b></td><td width=20%></td>
			</tr>';
			$houses_sql = $SQL->query('SELECT * FROM houses WHERE town_id = '.$town_id.' '. $owner_sql.' ORDER BY '.$order_sql.' ASC')->fetchAll();
			$counter = 0;
			foreach($houses_sql as $house)
			{
				$counter++;
				if($house['owner'] == 0)
				{
					$owner = 'Empty';
				}
				elseif($house['owner'] > 0)
				{
 					$player = new Player($house['owner']);
					$owner = 'owned by <a href="?view=characters&name='.urlencode($player->getName()).'">'.$player->getName().'</a>';
				}
				$main_content .= '<tr>
					<td>'.$house['name'].'</td>
					<td>'.$house['size'].' sqm</td>
					<td>'.$house['rent'].' gold</td>
					<td>'.$owner.'</td>
					<td><a href="index.php?view=houses&show='.$house['id'].'" class="btn btn-primary">View</a></td>
				</tr>';
			}
		$main_content .= '</tbody></table><hr>';
	}

	$main_content .= '<form class="form-horizontal" role="form" action="?view=houses" method="post">
				<fieldset>

					<div class="form-group">
						<label for="select" class="col-lg-2 control-label">Town</label>
						<div class="col-lg-10">
							<select class="form-control" name="town">';
								foreach($towns_list as $id => $town_n) {
									$main_content .= '<option value="'.$id.'">'.$town_n.'</option>';
								}
							$main_content .= '</select>
						</div>
					</div>

					<div class="form-group">
						<label for="select" class="col-lg-2 control-label">Status</label>
						<div class="col-lg-10">
							<select class="form-control" name="owner">
								<option value="0">All States</option>
								<option value="1">Empty</option>
								<option value="2">Rented</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<label for="select" class="col-lg-2 control-label">Sort</label>
						<div class="col-lg-10">
							<select class="form-control" name="order">
								<option value="0">By Name</option>
								<option value="1">By Size</option>
								<option value="2">By Rent</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>

				</fieldset>
			</form>';
}
##-- Show House --##
else
{
	$house = $SQL->query('SELECT * FROM houses WHERE id = '.$id.'')->fetch();
	if($house['doors'] == 0)
		$door = '1 door';
	else
		$door = $house['doors'] + 1 .' doors';
	if($house['beds'] == 0)
		$bed = '1 bed';
	else
		$bed = $house['beds'].' beds';
	if($house['owner'] > 0)
	{
        $player = new Player($house['owner']);
		if($house['paid'] > 0)
			$paid = ' and paid until <b>Feb 08 2011, 23:58:43'.date("M j Y, H:i:s", $house['paid']).' CET</b>';
		$owner = '<br>The house is currently rented by <a href="?view=characters&name='.urlencode($player->getName()).'">'.$player->getName().'</a>'.$paid.'.';
	}
	$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">House: '.$house['name'].'</h3></div><div class="panel-body"><table class="table table-condensed table-content table-striped"><tbody>
		<tr>
			<td></td>
			<td>
                <p>This house has <b>'.$door.'</b> and <b>'.$bed.'</b> and it is placed in <b>'.$towns_list[$house['town_id']].'</b>.<br><br>
                The house has a size of <b>'.$house['size'].' square meters</b>.
                The monthly rent is <b>'.$house['rent'].' gold</b> and will be debited to the bank account on <b>' . $config['server']['serverName'] . '</b><br>
                '.$owner.'</p>
			</td>
		</tr>
	</tbody></table><a href="?view=houses" class="btn btn-primary form-control">Back</a></div></div>';
}
?>
