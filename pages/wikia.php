<?php 
if($action == 'npcs')
{
   
    $main_content .= '<br><h1>Aqui você vai encontrar os principais NPCs quando começar a joga.</h1></br>
 
<fieldset><legend>Tasker</legend></fieldset>

Este Npc é muito importante, principalmente no início de sua aventura nesse incrível game,
ele te dará missões muitos boas ao longo de sua carreira, e completando-as você terá incríveis recompensas.
<br>
<br>
<fieldset><legend> Merchant</legend></fieldset>

Esse é um dos NPC mais procurado no início, ele é o vendedor de food e ingredientes para cozinheiro (cooker).
<br>
<br>
 <br>
<fieldset><legend> Shopping Center</legend></fieldset>

Este local tem 5 NPCs neles contem:
<br>
- Assistent (ele vende ultilidades / como por exemplo Backpacks)
<br>
- Woodcutter (ele vende machados para cortar árvores)
<br>
- Fisherman (ele vende varas de pesca)
<br>
- Equipment Seller (ele vende e compra equipamentos)
<br>
- Collector (compra itens dropados e itens de quest))';

    }



?>



<?php 
if($action == 'map')
{
   
    $main_content .= '<img src="../images/wiki/Mapa.png" alt="Smiley face" height="601" width="337">';

    }



?>


</br>
</br>
</br>
</br>
</br>

<table border="1" class="pTable">
    <tbody>
       
        <tr>
			<td align="center"><a href="?subtopic=wikia&action="><button class="btn btn-xs btn-default" style="width: 75%;"><img src="../images/wiki/botao_akuma.fw.png"> Akuma</button></a></td>
          
			<td align="center"><a href="?subtopic=wikia&action="><button class="btn btn-xs btn-default" style="width: 75%;"><img src="../images/wiki/botao_personagens.fw.png"> Personagens</button></a></td>
		  
			<td align="center"><a href="?subtopic=wikia&action="><button class="btn btn-xs btn-default" style="width: 75%;"><img src="../images/wiki/botao_criaturas.fw.png"> Criaturas</button></a></td>
				  
        </tr>
        <tr>
			<td align="center"><a href="?subtopic=wikia&action="><button class="btn btn-xs btn-default" style="width: 75%;"><img src="../images/wiki/botao_itens.fw.png"> Itens</button></a></td>
          
			<td align="center"><a href="?subtopic=wikia&action=map"><button class="btn btn-xs btn-default" style="width: 75%;"><img src="../images/wiki/botao_map.fw.png"> Mapa</button></a></td>
		  
			<td align="center"><a href="?subtopic=wikia&action=npcs"><button class="btn btn-xs btn-default" style="width: 75%;"><img src="../images/wiki/botao_npcs.fw.png"> Npcs</button></a></td>
        </tr>

    </tbody>
</table>

</br>
</br>
</br>
</br>