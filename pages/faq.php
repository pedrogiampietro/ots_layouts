<?php
if(!defined('INITIALIZED'))
	exit;


/*$main_content .= '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">Frequently Asked Questions</h3></div><div class="panel-body">';
$main_content .= '<b><i>Q: How does the attribute system work?</i></b><br>'.
'A: Each and every character is allowed to assign three attributes to their character, you can change these attributes back and forth as you like but keep in mind that if you have upgraded an attribute and you decide to remove it or replace it with another attribute you will NOT get anything of what you used to upgrade it back. The attributes can be upgraded from 0% to 25% by handing in minor crystalline tokens(henceforth referred to as tokens. In order to upgrade an attribute from 0% to 1% you will have to pay one minor crystalline token, and from 1% to 2% two minor crystalline tokens e.g).<br>'.
'The character attribute system is handled by the NPC Billy - he is located one floor up in the temple next to the offline trainers.​<br><br>'.
'<b><i>Q: How do I get minor crystalline tokens?</i></b><br>'.
'A: You can receive tokens through a various amount of methods, the following are: Participate in events which runs daily, achieve them through quests in the questroom, do tasks for Grizzly Adams, kill bosses in raids(every raid has atleast one boss that drop tokens), play the lottery machine or donate.​<br><br>'.
'<b><i>Q: How do I get a mount?</i></b><br>'.
'A: In delyria mounts are not achieved through regular mount items, therefore all mount items are useless and we ask you to report if you looted one so we can remove it from the drop. In order to get a mount ingame you need to play the lottery machine, you can play the machine by using either a lottery scroll purchased from the shop(30 charges) or play with regular ingame gold coins.​<br><br>'.
'<b><i>Q: How does the lottery machine work?</i></b><br>
A: The lottery machine was created since other relevant games has similar functions which are very popular - the machine operates like the following: When you first use the machine you will get an error message saying that you need to select your payment method, you can either select the lottery scroll payment method by typing !lottery scroll, or select the ingame gold coin payment method by typing !lottery gold - you will now be able to play the lottery if you have sufficient funds. There is roughly a 60% risk that you will get nothing from the machine, and a 40% chance that you will get something - out of this 40%, there is a 20% chance that you will receive a mount (some mounts are much harder to roll than others, the war bear for example is quite common while the king scorpion is much harder to roll). The other 20% of the 40% are items which may be valuable or less valuable.​<br><br>'.
'<b><i>Q: How do I get outfit addons?</i></b><br>'.
'A: The outfits available to you are those you can see when you select your outfit, you can upgrade these outfits by talking to Varkhal and give him the required addon items. If you want an outfit that is not available ingame, you can purchase a shop-exclusive outfit (these always come with two addons). There will be more outfits obtainable ingame in the future, but those available in the shop are exclusive for the shop.​<br><br>'.
'<b><i>Q: Where can I sell creature products and loot?</i></b><br>'.
'A: You can sell loot to Nah\'Bob and creature products to Bahir. Nah\'Bob trades with the most items, if you think that something is missing you can report it. Bahir pays twice as much for every creature product than real tibia, you can travel to him with Iyad which is located in the Depot.​<br><br>'.
'<b><i>Q: How many unjustified kills can I achieve before I get punished?</i></b><br>'.
'A: For each unjustified kill, your unjustified kills timer is increased by 6 hours and ticks down every second. You also receive a white skull for 15 minutes. You will receive a red skull if you have 5 unjustified kills and a black skull if you have 10.​<br><br>'.
'<b><i>Q: Where can I purchase blessings? Is there an amulet of loss?</i></b><br>'.
'A: You can purchase blessings from Cipfried in the temple, you can buy them one by one or say \'all\' to purchase all of them at once. Twist of fate is also available. You can buy an amulet of loss from Cipfried for 50.000.​<br><br>'.
'<b><i>Q: How do I buy a house? Is there rent?</i></b><br>'.
'You can buy a house by saying !buyhouse in front of the house you would like to buy, there is no rent.​<br><br>'.
'<b><i>Q: At what levels am I rewarded with crystal coins?</i></b><br>'.
'You are rewarded with one crystal coin at level 30, two at level 40, three at level 50, five at level 75 and ten once you reach level 100.​<br><br>'.
'<b><i>Q: What items do specific vocations get at certain levels?</i></b><br>'.
'A:<br>
<ul>
<li><b>Sorcerer:</b><br></li>
Level 20: Wand of decay.<br>
Level 35: Wand of cosmic energy.<br>

<li><b>Druid:</b><br></li>
Level 20: Necrotic rod.<br>
Level 35: Terra rod.<br>

<li><b>Paladin:</b><br></li>
Level 15: 5 spears.<br>
Level 25: 100 arrows.<br>
Level 30: 5 royal spears.<br>
Level 35: 100 arrows.<br>

<li><b>Knight:</b><br></li>
Level 30: Dragon shield and either a beastslayer axe, bright sword or dragonbone staff depending on which your highest skill is.​'.
'</ul>';
$main_content .= '</div></div>';*/
?>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Frequently Asked Questions</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-condensed" id="faq">
				<thead>
					<tr>
						<th style="width:30%">Question</th>
						<th style="width:70%">Answer</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td><b>How do I get an addon or a new outfit?</b></td>
						<td>In order to obtain an addon you must to talk to Varkhal, he is located at the shops. You can also get new outfits by doing quests, those outfits always come with both addons.
							<br>
							<br>
							<b>It is possible to get the following full outfits:</b>
							<br>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get citizen addons?" data-content="Ask Varkhal for 'first citizen addon' or 'second citizen addon' and bring him the required items.">Citizen</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get hunter addons?" data-content="Ask Varkhal for 'first hunter addon' or 'second hunter addon' and bring him the required items.">Hunter</span>

						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get knight addons?" data-content="Ask Varkhal for 'first knight addon' or 'second knight addon' and bring him the required items.">Knight</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get mage addons?" data-content="Ask Varkhal for 'first mage addon' or 'second mage addon' and bring him the required items.">Mage</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get nobleman addons?" data-content="Ask Varkhal for 'first nobleman addon' or 'second nobleman addon' and bring him the required items.">Nobleman</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get summoner addons?" data-content="Ask Varkhal for 'first summoner addon' or 'second summoner addon' and bring him the required items.">Summoner</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get warrior addons?" data-content="Ask Varkhal for 'first warrior addon' or 'second warrior addon' and bring him the required items.">Warrior</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get barbarian addons?" data-content="Ask Varkhal for 'first barbarian addon' or 'second barbarian addon' and bring him the required items.">Barbarian</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get druid addons?" data-content="Ask Varkhal for 'first druid addon' or 'second druid addon' and bring him the required items.">Druid</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get wizard addons?" data-content="Ask Varkhal for 'first wizard addon' or 'second wizard addon' and bring him the required items.">Wizard</span>

						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get oriental addons?" data-content="Ask Varkhal for 'first oriental addon' or 'second oriental addon' and bring him the required items.">Oriental</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get pirate addons?" data-content="Ask Varkhal for 'first pirate addon' or 'second pirate addon' and bring him the required items.">Pirate</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get assassin addons?" data-content="Ask Varkhal for 'first assassin addon' or 'second assassin addon' and bring him the required items.">Assassin</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get beggar addons?" data-content="Ask Varkhal for 'first beggar addon' or 'second beggar addon' and bring him the required items.">Beggar</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get shaman addons?" data-content="Ask Varkhal for 'first shaman addon' or 'second shaman addon' and bring him the required items.">Shaman</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get norseman addons?" data-content="Ask Varkhal for 'first norseman addon' or 'second norseman addon' and bring him the required items.">Norseman</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get nightmare addons?" data-content="Ask Varkhal for 'first nightmare addon' or 'second nightmare addon' and bring him the required items.">Nightmare</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get jester addons?" data-content="Ask Varkhal for 'first jester addon' or 'second jester addon' and bring him the required items.">Jester</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get brotherhood addons?" data-content="Ask Varkhal for 'first brotherhood addon' or 'second brotherhood addon' and bring him the required items.">Brotherhood</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get demonhunter addons?" data-content="Finish the inquisition quest.">Demonhunter</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get ranger outfit?" data-content="Finish the step by step quest.">Ranger</span>
						<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get yalahari outfit?" data-content="Finish the in service of yalahar quest.">Yalahari</span>
						<br>
						<br>
						Some other outfits can currently be obtained in the <a href="http://217.210.109.207/?view=shop">Shop</a>.
					</td>
					</tr>

					<tr>
						<td><b>How do I get a mount?</b></td>
						<td>You can get mounts ingame by mount quests.
							<br>
							<br>
							<b>It is possible to get the following mounts:</b>
							<br>
							<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How go I get war bear mount?" data-content="Finish the war bear mount quest.">War Bear</span>
							<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get stampor mount?" data-content="Finish the stampor mount quest.">Stampor</span>
							<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get crystal wolf mount?" data-content="Finish the crystal wolf mount quest.">Crystal Wolf</span>
							<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get scorpion king mount?" data-content="Finish the scorpion king mount quest.">Scorpion King</span>
							<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get panda mount?" data-content="Find a panda in a bamboo plant in the panda quest teleport.">Panda</span>
							<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get a water buffalo mount?" data-content="Finish the water buffalo mount quest.">Water Buffalo</span>
							<span class="label label-info" data-action="popover" data-placement="right" data-original-title="How do I get a horse mount?" data-content="Rent a horse from Appaloosa for 500 gold coins.">Horse</span>
							<br>
							<br>
							Some other mounts can currently be obtained in the <a href="http://217.210.109.207/?view=shop">Shop</a>.
						</td>
					</tr>
					<tr>
						<td><b>Where can I sell creature products?</b></td>
						<td>You can sell creature products for twice original price to Bahir, he is located at the top floor in the teleport building.</td>
					</tr>
					<tr>
						<td><b>Where do I buy blessings? Is there amulet of loss?</b></td>
						<td>You can purchase all available blessings from Cipfried at the temple, <span class="label label-info" data-action="popover" data-placement="right" data-original-title="How much do blessings cost?" data-content="<ul><li>Up to Level 30, blessings cost 2000 gold each.</li><li>After Level 30 up to Level 120, each blessing will cost: (Level - 20) * 200.</li><li>From Level 120, each blessing will cost 20000.</li>">prices vary</span> depending on your level. Cipfried also sells amulet of loss for 50.000 gold coins.</td>
					</tr>
					<tr>
						<td><b>At what levels am I rewarded with crystal coins?</b></td>
						<td><b>You will be rewarded with crystal coins at these five milestones:</b>
						<br>
						<ul>
							<li>Level 30: 3 crystal coins</li>
							<li>Level 40: 5 crystal coins</li>
							<li>Level 50: 10 crystal coins</li>
							<li>Level 75: 15 crystal coins</li>
							<li>Level 100: 25 crystal coins</li>
							<li>Level 150: 50 crystal coins</li>
							<li>Level 175: 75 crystal coins</li>
						</ul>
							<p>It will be deposited to your bank.</p>
						</td>
					</tr>
					<tr>
						<td><b>How do I buy a house? Do I have to pay rent? When will an inactive house owner lose the house?</b></td>
						<td>You can purchase a house ingame by typing <span class="label label-info" data-action="popover" data-placement="right" data-original-title="What is the required level to purchase a house?" data-content="You need to be level 75 or higher in order to purchase a house.">!buyhouse</span> in front of the house you would like to buy.

							There is no rent, a house owner who has not logged in for 30 days will lose his/her house.</td>
					</tr>
					<tr>
						<td><b>How does the task system work?</b></td>
						<td>Talk to Grizzly Adams in order to start a task, you are able to have a maximum of three tasks active at the same time. When you have finished a task and reported back to Grizzly Adams you can write 'boss' to him and he will let you face a boss for your completed task.
							<br>
							<br>
							You can repeat a task as many times as you like, but for each time you complete a task you need to kill more creatures the next time you do it. The required amount of kills increases differently depending on the difficulty of the task, a difficult task will not scale as rapidly as an easy one.
						</td>
					</tr>
					<tr>
						<td><b>What are dungeons and how do they work?</b></td>
						<td>Dungeons are maps with one-time-spawned creatures, this means that the creatures will not respawn until the dungeon has been cleansed entirely. When the last creature
						 has died in a dungeon the players in it will be teleported out of it in five minutes, then it will take an hour for the dungeon to get replenished - not until then you may enter it again..
							<br>
							<br>
							The creatures in the dungeons do not always have their regular strength: their damage, experience and health is adaptive to how many players thats currently are in the dungeon.
							<br>
							<br>
							In the dungeons you will also find creatures whom have skulls, these creatures are stronger than the regular creatures in the dungeon. <b>These are the skulls you may find in the dungeon, listed from the weakest to the strongest.</b>
							<br>
							<div class="text-center">
								<span style="margin-right:20px;" data-action="popover" data-placement="top" data-original-title="White Skull - Additional Loot" data-content="<ul><li>1-5x platinum coins</li><li>1-5x demonic essences</li><li>a wand of inferno</li><li>a hailstorm rod</li><li>an ethno coat</li><li>a crown helmet</li></ul>"><img src="images/skulls/white.gif"></span>
								<span style="margin-right:20px;" data-action="popover" data-placement="top" data-original-title="Orange Skull - Additional Loot" data-content="<ul><li>1-10x platinum coins</li><li>1-5x demonic essences</li><li>1-9x small topaz</li><li>1-8x small diamonds</li><li>1-15x small emeralds</li><li>1-3x small sapphires</li><li>1-13x small rubies</li><li>1-19x talons</li></ul>"><img src="images/skulls/orange.gif"></span>
								<span style="margin-right:20px;" data-action="popover" data-placement="top" data-original-title="Yellow Skull - Additional Loot" data-content="<ul><li>1-15x platinum coins</li><li>a blood herb</li><li>a spellbook of enlightenment</li><li>a spellbook of mind control</li><li>1-5x demonic essences</li><li>a minor crystalline token</li></ul>"><img src="images/skulls/yellow.gif"></span>
								<span style="margin-right:20px;" data-action="popover" data-placement="top" data-original-title="Green Skull - Additional Loot" data-content="<ul><li>1-10x platinum coins</li><li>1-20x platinum coins</li><li>1-10x demonic essences</li><li>1-2x minor crystalline tokens</li><li>blue legs</li><li>a bonebreaker</li><li>a skullcracker armor</li></ul>"><img src="images/skulls/green.gif"></span>
								<span style="margin-right:20px;" data-action="popover" data-placement="top" data-original-title="Red Skull - Additional Loot" data-content="<ul><li>1-12x platinum coins</li><li>1-25x platinum coins</li><li>1-15x demonic essences</li><li>1-6x minor crystalline tokens</li><li>boots of haste</li><li>a paladin armor</li></ul>"><img src="images/skulls/red.gif"></span>
								<span data-action="popover" data-placement="top" data-original-title="Black Skull - Additional Loot" data-content="<ul><li>1-15x platinum coins</li><li>1-30x platinum coins</li><li>1-20x demonic essences</li><li>1-10x minor crystalline tokens</li><li>a golden armor</li><li>a magic plate armor</li><li>golden boots</li></ul>"><img src="images/skulls/black.gif"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td><b>What are character attributes and how do they work?</b></td>
						<td>The character attributes are extra skill options you can assign to your character, each character can have a maximum of three attributes assigned to them. Minor crystalline tokens are used in order to upgrade the attributes, you can get them from doing tasks and dungeons.
						<br>
						<br>
						There are currently 7 attributes available to choose from, talk to Billy in the temple in order to learn more about them.
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

