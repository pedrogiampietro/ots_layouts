<?php
if(!defined('INITIALIZED'))
    exit;
if(empty($orderby)) {
    $orderby = 'spectators';
}

if($idd == (int) $_GET['world'])
{
    $world_id = $idd;
    $world_name = $world_n;
}
if(!isset($world_id))
{
    $world_id = 0;
    $world_name = $config['server']['serverName'];
}
$players_online_data = $SQL->query('SELECT * FROM live_casts ORDER BY '.$orderby.' DESC');
$number_of_players_online = 0;
foreach($players_online_data as $player)
{
    $number_of_players_online++;
    if(is_int($number_of_players_online / 2))
    {
        $bgcolor = $config['site']['darkborder'];
    }
    else
    {
        $bgcolor = $config['site']['lightborder'];
    }
	
    $playerobj = $SQL->query("SELECT * FROM players WHERE name='". addslashes($player['cast_name'])."'")->fetch();	
	
	if ($playerobj['vocation'] == 1) {
	$tu = 'Sorcerer';
	} else if ($playerobj['vocation'] == 2) {
	$tu = 'Druid'; 
	} else if ($playerobj['vocation'] == 3) {
	$tu = 'Paladin'; 
	} else if ($playerobj['vocation'] == 4) {
	$tu = 'Knight';
	} else if ($playerobj['vocation'] == 5) {
	$tu = 'Master Sorcerer';
	} else if ($playerobj['vocation'] == 6) {
	$tu = 'Elder Druid'; 
	} else if ($playerobj['vocation'] == 7) {
	$tu = 'Royal Paladin'; 
	} else if ($playerobj['vocation'] == 8) {
	$tu = 'Elite Knight';
	}
	
	if ($player['password'] == 1) {
		$imagem = "https://cdn0.iconfinder.com/data/icons/fatcow/16/change_password.png";
	} else {
		$imagem = "https://cdn3.iconfinder.com/data/icons/fatcow/16/door_out.png";
	}
    $players_rows .= '
    <TR BGCOLOR='.$bgcolor.'>
		<TD height="40px" style="position:relative;"><span style="display:block; position:absolute; top:-30px; left:-20px;"><img src="http://outfit-images.ots.me/animatedOutfits1090/animoutfit.php?id='.$playerobj['looktype'].'&addons='.$playerobj['lookaddons'].'&head='.$playerobj['lookhead'].'&body='.$playerobj['lookbody'].'&legs='.$playerobj['looklegs'].'&feet='.$playerobj['lookfeet'].'"> </span><br/></TD>
        <TD WIDTH=90%><img src="'.$imagem.'"> <A HREF="index.php?subtopic=characters&name='.urlencode($player['cast_name']).'">'.$player['cast_name'].'</A><br><small>Info: '.$playerobj['level'].' - '.$tu.'</small><br/></TD>
        <TD WIDTH=6%><font color="#008000"><center>'.$player['spectators'].'<center></h3></font></TD>
    </TR>';
}

    //server status - someone is online
    $main_content .= '<a name="General+Information" >
</a>
	<div class="TopButtonContainer" >
		<div class="TopButton">
			<a href="#top" ><image style="border:0px;" src="'.$layout_name.'/images/content/back-to-top.gif" />
			</a>
		</div>
	</div>
	<div class="TableContainer" >
		<table class="Table3" cellpadding="0" cellspacing="0" >   
			<div class="CaptionContainer" >      
				<div class="CaptionInnerContainer" >        
					<span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" >
					</span>
					<span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" >
					</span>
					<span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" >
					</span>
					<span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" >
					</span>
						<div class="Text" >Lista de casts online
						</div>
						<span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" />
						</span>
						<span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" >
						</span>
						<span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" />
						</span>
						<span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" />
						</span>				
					</div>    
			</div>
		<tr>      
			<td>        
				<div class="InnerTableContainer" >          
					<table style="width:100%;" >
						<tr>
							<td>
								<div class="TableShadowContainerRightTop" >  
									<div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" >
									</div>
								</div>
		<div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" >
			<div class="TableContentContainer" >    
			
			<table class="TableContent" width="100%" >
        
        <TR >
            <TD>';
            $main_content .= 'Currently there are '.$number_of_players_online.' active live casts';
            $main_content .= ' on '.$world_name.'<br>
            </TD>
        </TR>
    </TABLE>
	<br>
		
			
			</div>
			</tr>
			</td>
				
			</table>
		</div>
		<div class="TableShadowContainer" >
			<div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" >
				<div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" >
				</div>
				<div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" >
				</div>  
			</div>
		</div>
		</div>
		</tr>
		</td>
		</table>
		</div>
		<p>Atualmente nosso server conta com um sistema unico de Cast.</p>
	<p>Você poderá assistir nossos jogadores apenas clicando para entrar na conta sem inserir a conta, muito menos a senha. Uma lista dos jogadores que estão transmitindo será mostrada, então escolha um e clique para entrar. Depois de entrar no cast do jogador, poderá interagir com ele utilizando o Spectator Chat, um chat onde você poderá falar com o jogador e com outros espectadores.</p>
	<p>Se você é um jogador e quer transmitir seu jogo, entre em seu personagem e utilize o comando <b>!cast</B>, se quiser colocar uma senha em seu cast digite o comando <b>!cast senha</b>, a palavra "senha" será a sua senha do cast. Para fechar o cast digite <b>!stopcast</B></p>
		
    <a name="General+Information" >
</a>
	<div class="TopButtonContainer" >
		<div class="TopButton">
			<a href="#top" ><image style="border:0px;" src="'.$layout_name.'/images/content/back-to-top.gif" />
			</a>
		</div>
	</div>
	<div class="TableContainer" >
		<table class="Table3" cellpadding="0" cellspacing="0" >   
			<div class="CaptionContainer" >      
				<div class="CaptionInnerContainer" >        
					<span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" >
					</span>
					<span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" >
					</span>
					<span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" >
					</span>
					<span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" >
					</span>
						<div class="Text" >Lista de casts online
						</div>
						<span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" />
						</span>
						<span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" >
						</span>
						<span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" />
						</span>
						<span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" />
						</span>				
					</div>    
			</div>
		<tr>      
			<td>        
				<div class="InnerTableContainer" >          
					<table style="width:100%;" >
						<tr>
							<td>
								<div class="TableShadowContainerRightTop" >  
									<div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" >
									</div>
								</div>
		<div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" >
			<div class="TableContentContainer" >    
				';
    //list of players
    $main_content .= '
    <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
	
        <TR BGCOLOR="#D4C0A1">
			<td class= "LabelV">Outfit</TD>
            <TD class="LabelV">Name</TD>
            <TD class="LabelV">Spectators</TD>
        </TR>
    '.$players_rows.'</TABLE>
			</div>
			</tr>
			</td>
				
			</table>
		</div>
		<div class="TableShadowContainer" >
			<div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" >
				<div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" >
				</div>
				<div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" >
				</div>  
			</div>
		</div>
		</div>
		</tr>
		</td>
		</table>
		</div>';
    //search bar
    //$main_content .= '<BR><FORM ACTION="index.php?subtopic=characters" METHOD=post> <TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
	