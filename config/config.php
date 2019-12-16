<?PHP
# Account Maker Config
$config['site']['url'] = 'http://burmourne.net';
$config['site']['serverPath'] = "/home/otserv/";
$config['site']['useServerConfigCache'] = false;
$towns_list = array(1 => 'Enigma', 2 => 'Quinswood');

$config['site']['outfit_images_url'] = 'http://outfit-images.ots.me/outfit.php';
$config['site']['item_images_url'] = 'http://item-images.ots.me/1081/';
$config['site']['item_images_extension'] = '.gif';
$config['site']['flag_images_url'] = 'http://flag-images.ots.me/';
$config['site']['flag_images_extension'] = '.png';

# Create Account Options
$config['site']['one_email'] = false;
$config['site']['create_account_verify_mail'] = false;
$config['site']['verify_code'] = true;
$config['site']['email_days_to_change'] = 3;
$config['site']['newaccount_premdays'] = 999;
$config['site']['send_register_email'] = false;

# Create Character Options
$config['site']['newchar_vocations'] = array(1 => 'Sorcerer Sample', 2 => 'Druid Sample', 3 => 'Paladin Sample', 4 => 'Knight Sample');
$config['site']['newchar_towns'] = array(1);
$config['site']['max_players_per_account'] = 25;


# Emails Config
$config['site']['send_emails'] = true;
$config['site']['mail_address'] = "support@burmourne.net";
$config['site']['smtp_enabled'] = true;
$config['site']['smtp_host'] = "";
$config['site']['smtp_port'] = 465;
$config['site']['smtp_auth'] = true;
$config['site']['smtp_user'] = "support@burmourne.net";
$config['site']['smtp_pass'] = "";

# PAGE: whoisonline.php
$config['site']['private-servlist.com_server_id'] = 1;
/*
Server id on 'private-servlist.com' to show Players Online Chart (whoisonline.php page), set 0 to disable Chart feature.
To use this feature you must register on 'private-servlist.com' and add your server.
Format: number, 0 [disable] or higher
*/

# PAGE: characters.php
$config['site']['quests'] = array();
$config['site']['show_skills_info'] = true;
$config['site']['show_vip_storage'] = 0;

# PAGE: accountmanagement.php
$config['site']['send_mail_when_change_password'] = true;
$config['site']['send_mail_when_generate_reckey'] = true;
$config['site']['generate_new_reckey'] = false;
$config['site']['generate_new_reckey_price'] = 500;

# PAGE: guilds.php
$config['site']['guild_need_level'] = 1;
$config['site']['guild_need_pacc'] = false;
$config['site']['guild_image_size_kb'] = 50;
$config['site']['guild_description_chars_limit'] = 2000;
$config['site']['guild_description_lines_limit'] = 6;
$config['site']['guild_motd_chars_limit'] = 250;

# PAGE: adminpanel.php
$config['site']['access_admin_panel'] = 3;

# PAGE: latestnews.php
$config['site']['news_limit'] = 6;

# PAGE: killstatistics.php
$config['site']['last_deaths_limit'] = 40;

# PAGE: team.php
$config['site']['groups_support'] = array(2, 3, 4, 5, 6);

# PAGE: highscores.php
$config['site']['groups_hidden'] = array(3);
$config['site']['accounts_hidden'] = array(3);

# PAGE: shopsystem.php
$config['site']['shop_system'] = true;

# PAGE: lostaccount.php
$config['site']['email_lai_sec_interval'] = 180;

# Layout Config
$config['site']['layout'] = 'materialkit';
$config['site']['vdarkborder'] = '#505050';
$config['site']['darkborder'] = '#D4C0A1';
$config['site']['lightborder'] = '#F1E0C6';
$config['site']['download_page'] = false;
$config['site']['serverinfo_page'] = true;

$config['site']['betakeys'] = ['A1B2C3D4', 'E5F6G7H8'];

$config['site']['achievements'] = [
	300001 => [
		"name" => "Afraid of no Ghost!",
		"description" => "You passed their test and helped the Spirithunters testing equipment, researching the supernatural and catching ghosts - it's you they're gonna call.",
		"points" => 2,
	],
	300002 => [
		"name" => "Allow Cookies?",
		"description" => "With a perfectly harmless smile you fooled all of those wisecrackers into eating your exploding cookies. Consider a boy or girl scout outfit next time to make the trick even better.",
		"points" => 2,
	],
	300003 => [
		"name" => "Allowance Collector",
		"description" => "You certainly have your ways when it comes to acquiring money. Many of them are pink and paved with broken fragments of porcelain.",
		"points" => 2,
		"secret" => true,
	],
	300004 => [
		"name" => "Amateur Actor",
		"description" => "You helped bringing Princess Buttercup, Doctor Dumbness and Lucky the Wonder Dog to life - and will probably dream of them tonight, since you memorised your lines perfectly. What a .. special piece of.. screenplay.",
		"points" => 2,
	],
	300005 => [
		"name" => "Animal Activist",
		"description" => "You have a soft spot for little, weak animals, and you do everything in your power to protect them - even if you probably eat dragons for breakfast.",
		"points" => 2,
	],
	300006 => [
		"name" => "Arachnoise",
		"description" => "You've shattered each of Bloodweb's eight frozen legs. As they say: break a leg, and then some more.",
		"points" => 1,
	],
	300007 => [
		"name" => "Archpostman",
		"description" => "Delivering letters and parcels has always been a secret passion of yours, and now you can officially put on your blue hat, blow your Post Horn and do what you like to do most. Beware of dogs!",
		"points" => 3,
	],
	300008 => [
		"name" => "Askarak Nemesis",
		"description" => "You are now the royal archfiend of the Askarak, prince slayer.",
		"points" => 1,
	],
	300009 => [
		"name" => "Baby Sitter",
		"description" => "You have cheered up a demon baby and returned it to its mother. A quick count of your fingers will reveal if you made it through unharmed.",
		"points" => 1,
	],
	300010 => [
		"name" => "Back from the Dead",
		"description" => "You overcame the undead Zanakeph and sent him back into the darkness that spawned him.",
		"points" => 2,
	],
	300011 => [
		"name" => "Back into the Abyss",
		"description" => "You've cut off a whole lot of tentacles today. Thul was driven back to where he belongs.",
		"points" => 1,
	],
	300012 => [
		"name" => "Backpack Tourist",
		"description" => "If someone lost a random thing in a random place, you're probably a good person to ask and go find it, even if you don't know what and where.",
		"points" => 1,
	],
	300013 => [
		"name" => "Bad Timing",
		"description" => "Argh! Not now! How is it that those multifunctional tools never fail when you're using them for something completely trivial like squeezing juice, but mess up when you desperately need to climb up a rope spot with a fire-breathing dragon chasing you?",
		"points" => 2,
	],
	300014 => [
		"name" => "Bane of the Hive",
		"description" => "Countless fights and never tiring effort in the war against the hive grant you the experience to finish your outfit with the last remaining part. Your chitin outfit is a testament of your skills and dedication for the cause.",
		"points" => 2,
	],
	300015 => [
		"name" => "Banebringers' Bane",
		"description" => "You sacrificed a lot of ingredients to create the protective brew of the witches and played a significant part in the efforts to repel the dreaded banebringers. The drawback is that even the banebringers may take notice of you ...",
		"points" => 2,
	],
	300016 => [
		"name" => "Beach Tamer",
		"description" => "You re-enacted the Taming of the Shrew on a beach setting and proved that you can handle capricious girls quite well. With or without fish tails.",
		"points" => 2,
	],
	300017 => [
		"name" => "Bearhugger",
		"description" => "Warm, furry and cuddly - though that same bear you just hugged would probably rip you into pieces if he had been conscious, he reminded you of that old teddy bear which always slept in your bed when you were still small.",
		"points" => 1,
	],
	300018 => [
		"name" => "Beautiful Agony",
		"description" => "Ethershreck's cry of agony kept ringing in your ear for hours after he had dissolved into thin air. He probably moved to another plane of existence... for a while.",
		"points" => 2,
	],
	300019 => [
		"name" => "Becoming a Bigfoot",
		"description" => "You did it! You convinced the reclusive gnomes to accept you as one of their Bigfoots. Now you are ready to help them. With big feet big missions seen to come.",
		"points" => 1,
	],
	300020 => [
		"name" => "Berserker",
		"description" => "RAWR! Strength running through your body, your heart racing faster and adrenaline fueling your every weapon swing. All in a little bottle. No refund for destroyed furniture. For further questions consult your healer or potion dealer.",
		"points" => 3,
	],
	300021 => [
		"name" => "Bibby's Bloodbath",
		"description" => "You lend a helping hand in defeating invading Orcs by destroying their warcamp along with their leader. Bibby's personal bloodbath...",
		"points" => 1,
		"secret" => true,
	],
	300022 => [
		"name" => "Blessed!",
		"description" => "You travelled the world for an almost meaningless prayer - but at least you don't have to do that again and can get a new blessed stake in the blink of an eye.",
		"points" => 2,
	],
	300023 => [
		"name" => "Blood-Red Snapper",
		"description" => "You've tainted the jungle floor with the Snapper's crimson blood.",
		"points" => 1,
	],
	300024 => [
		"name" => "Bluebarian",
		"description" => "You live the life of hunters and gatherers. Well, especially that of a gatherer, and especially of one who gathers lots of blueberries. Have you checked the colour of your tongue lately?",
		"points" => 2,
	],
	300025 => [
		"name" => "Bone Brother",
		"description" => "You've joined the undead bone brothers - making death your enemy and your weapon as well. Devouring what's weak and leaving space for what's strong is your primary goal.",
		"points" => 1,
	],
	300026 => [
		"name" => "Breaking the Ice",
		"description" => "You almost made friends with Shardhead... before he died. Poor guy only seems to attract violence with his frosty attitude.",
		"points" => 1,
	],
	300027 => [
		"name" => "Bunny Slipped",
		"description" => "Indeed, you have a soft spot for rabbits. Maybe the rabbits you saved today will be the rabbits that will save you tomorrow. When you are really hungry.",
		"points" => 2,
	],
	300028 => [
		"name" => "Cake Conqueror",
		"description" => "You have bravely stepped onto the cake isle. Is there any more beautiful, tasty place to be in the whole world?",
		"points" => 1,
	],
	300029 => [
		"name" => "Call Me Sparky",
		"description" => "Admittedly you enjoyed the killing as usual. But the part with the sparks still gives you shivers ... or is it that there is some charge left on you?",
		"points" => 1,
	],
	300030 => [
		"name" => "Chest Robber",
		"description" => "You've discovered three nomad camps and stole their supplies. Well, you can probably use them better then they can.",
		"points" => 1,
	],
	300031 => [
		"name" => "Choking on Her Venom",
		"description" => "The Old Widow fell prey to your supreme hunting skills.",
		"points" => 1,
	],
	300032 => [
		"name" => "Chorister",
		"description" => "Lalalala... you now know the cult's hymn sung in Liberty Bay",
		"points" => 1,
	],
	300033 => [
		"name" => "Clay Fighter",
		"description" => "You love getting your hands wet and dirty - and covered with clay. Your perfect sculpture of Brog, the raging Titan is your true masterpiece.",
		"points" => 3,
		"secret" => true,
	],
	300034 => [
		"name" => "Cocoon of Doom",
		"description" => "You helped bringing Devovorga's dangerous tentacles and her humongous cocoon down - not stopping her transformation, but ultimately completing a crucial step to her death.",
		"points" => 3,
		"secret" => true,
	],
	300035 => [
		"name" => "Commitment Phobic",
		"description" => "Longterm relationships are just not for you. And each time you think you're in love, you're proven wrong shortly afterwards. Or maybe you just end up with the wrong lover each time - exploited and betrayed. Staying single might just be better.",
		"points" => 2,
	],
	300036 => [
		"name" => "Confusion",
		"description" => "The destruction you have caused by now can be felt throughout the whole hive. The mayhem that follows your step caused significant confusion in the consciousness of the hive.",
		"points" => 3,
	],
	300037 => [
		"name" => "Cookie Monster",
		"description" => "You can easily be found by anyone if they just follow the cookie crumb trail. And for you, true love means to give away your last cookie.",
		"points" => 1,
	],
	300038 => [
		"name" => "Crawling Death",
		"description" => "You ripped the ancient scarab Fleshcrawler apart and made sure he didn't get under your skin.",
		"points" => 1,
	],
	300039 => [
		"name" => "Crystal Clear",
		"description" => "If the gnomes had told you that crystal armor is see-through you had probably changed your underwear in time.",
		"points" => 3,
	],
	300040 => [
		"name" => "Crystal Keeper",
		"description" => "So you repaired the light of some crystals for those gnomes. What's next? Sitting a week in a mushroom bed as a temporary mushroom?",
		"points" => 1,
	],
	300041 => [
		"name" => "Crystals in Love",
		"description" => "You brought two loving crystals together. Perhaps they might even name one of their children after you. To bad you forgot to leave your calling card.",
		"points" => 1,
	],
	300042 => [
		"name" => "Cursed!",
		"description" => "The wrath of the Noxious Spawn - you accidentally managed to incur it. Your days are counted and your death inevitable. Sometime. Someplace.",
		"points" => 3,
	],
	300043 => [
		"name" => "Daring Trespasser",
		"description" => "You've entered the lair of Devovorga and joined the crew trying to take her down - whether crowned with success or not doesn't matter, but they can't blame you for not trying!",
		"points" => 3,
	],
	300044 => [
		"name" => "Dark Voodoo Priest",
		"description" => "Sinister curses, evil magic - you don't shy away from punishing others by questionable means. Someone just gave you a strange look - now where's that needle again?",
		"points" => 2,
		"secret" => true,
	],
	300045 => [
		"name" => "Dazzler",
		"description" => "In the war against the hive, your efforts in blinding it begin to pay off. Your actions have blinded the hive severely and the entity seems to become aware that something dangerous is happening.",
		"points" => 3,
	],
	300046 => [
		"name" => "Death from Below",
		"description" => "The face of the enemy is unmasked. You have encountered one of 'those below' and survived. More than that, you managed to kill the beast and prove once and for all that the enemy can be beaten.",
		"points" => 2,
		"secret" => true,
	],
	300047 => [
		"name" => "Death Song",
		"description" => "You hushed the songs of war in the black depths by sliencing more than three hundred Deepling Spellsingers.",
		"points" => 3,
	],
	300048 => [
		"name" => "Deer Hunt",
		"description" => "You managed to kill more than four hundred white deer - it looks like you are one of the main reasons they will soon be considered extinct, way to go!",
		"points" => 1,
		"secret" => true,
	],
	300049 => [
		"name" => "Demonic Barkeeper",
		"description" => "Thick, red - shaken, not stirred - and with a straw in it: that's the way you prefer your demon blood. Served with an onion ring, the subtle metallic aftertaste is almost not noticeable. Beneficial effects on health or mana are welcome.",
		"points" => 3,
	],
	300050 => [
		"name" => "Depth Dwellers",
		"description" => "By eliminating at least three hundred Deepling Warriors you delivered quite a blow to the amassing armies of the deep.",
		"points" => 3,
	],
	300051 => [
		"name" => "Desert Fisher",
		"description" => "You managed to catch a fish in a surrounding that usually doesn't even carry water. Everything is subject to change, probably...",
		"points" => 1,
	],
	300052 => [
		"name" => "Do Not Disturb",
		"description" => "Urgh! Close the windows! Shut out the sun rearing its ugly yellow head, shut out the earsplitting laughter of your neighbour's corpulent children. Ahhh. Embrace sweet darkness and silence.",
		"points" => 1,
	],
	300053 => [
		"name" => "Doctor! Doctor!",
		"description" => "Did someone call a doctor? You delivered 100 medicine bags to Ottokar of the Venore poor house in times of dire need, well done!",
		"points" => 2,
	],
	300054 => [
		"name" => "Dog Sitter",
		"description" => "You showed Noodles the way home. How long will it take this time until he's on the loose again? That dog must be really bored in the throne room by now.",
		"points" => 1,
	],
	300055 => [
		"name" => "Down the Drain",
		"description" => "You've found a secret dungeon in the flooded plains and killed several of its inhabitants. And now you have wet feet.",
		"points" => 2,
	],
	300056 => [
		"name" => "Dream's Over",
		"description" => "No more fear and bad dreams. You stabbed Tormentor to death with its scythe leg.",
		"points" => 1,
	],
	300057 => [
		"name" => "Dungeon Cleaner",
		"description" => "Seen it all. Done it all. Your unstoppable force swept through the dungeons and you vanquished their masters. Not to forget the precious loot you took! Now stop reading this and continue hunting! Time is money after all!",
		"points" => 3,
	],
	300058 => [
		"name" => "Efreet Ally",
		"description" => "Even though the welcomed you only reluctantly and viewed you as \"only a human\" for quite some time, you managed to impress Malor and gained his respect and trade options with the green djinns.",
		"points" => 3,
	],
	300059 => [
		"name" => "Enter zze Draken!",
		"description" => "You gave zzze draken a tazte of your finizzzing move.",
		"points" => 2,
	],
	300060 => [
		"name" => "Exquisite Taste",
		"description" => "You love fish - but preferably those caught in the cold north. Even though they're hard to come by you never get tired of picking holes in ice sheets and hanging your fishing rod in.",
		"points" => 2,
	],
	300061 => [
		"name" => "Extreme Degustation",
		"description" => "Almost all the plants you tested for Chartan in Zao where inedible - you tasted them all, yet you're still standing! You should really get some fresh air now, though.",
		"points" => 2,
	],
	300062 => [
		"name" => "Eye of the Deep",
		"description" => "You didn't look into it - at least not for too long... but Groam did. And you relieved him. Just don't tell his friend Dronk.",
		"points" => 1,
	],
	300063 => [
		"name" => "Final Strike",
		"description" => "The mighty Deathstrike is dead! One legend is dead and you're on your way to become one yourself.",
		"points" => 2,
	],
	300064 => [
		"name" => "Fire Devil",
		"description" => "To keep the witches' fire burning, you trashed a lot of the wood the bane bringers animated. Some might find your fascination for fire ... disturbing.",
		"points" => 3,
	],
	300065 => [
		"name" => "Fire from the Earth",
		"description" => "You've survived the Hellgorge eruption and found a way through the flames and lava. You've even managed to kill a few fireborn on the way.",
		"points" => 2,
	],
	300066 => [
		"name" => "Fire Lighter",
		"description" => "You have helped to keep the witches fire burning. Just watch your fingers, it's hot!",
		"points" => 1,
	],
	300067 => [
		"name" => "Firefighter",
		"description" => "You extinguished 500 thornfires! You were there when the Firestarters took over Shadowthorn. You saved the day - and the home of some elves which will try to kill you nonetheless. Isn't it nice to see everything restored just as it was before..?",
		"points" => 2,
	],
	300068 => [
		"name" => "Fireworks in the Sky",
		"description" => "You love the moment right before your rocket takes off and explodes into beautiful colours - not only on new year's eve!",
		"points" => 2,
	],
	300069 => [
		"name" => "Fool at Heart",
		"description" => "And remember: Never try to teach a pig to sing. It wastes your time and annoys the pig.",
		"points" => 3,
	],
	300070 => [
		"name" => "Fountain of Life",
		"description" => "You found and took a sip from the Fountain of Life. Thought it didn't grant you eternal life, you feel changed and somehow at peace.",
		"points" => 1,
	],
	300071 => [
		"name" => "Free Items!",
		"description" => "Yay! Finders keepers, losers weepers! Who cares where all that stuff came from and if you had to crawl through garbage piles to get it? It's FREE!",
		"points" => 3,
	],
	300072 => [
		"name" => "Funghitastic",
		"description" => "Finally your dream to become a walking mushroom has come true ... No, wait a minute!",
		"points" => 3,
	],
	300073 => [
		"name" => "Gatherer",
		"description" => "By killing creatures of the hive and gaining weapons for further missions, you started a quite effective way of war. You gathered a lot of dissolved chitin to resupply the war effort.",
		"points" => 2,
	],
	300074 => [
		"name" => "Gem Cutter",
		"description" => "You cut your first gem - and it bears your own name! Now that would be a nice gift! This does not make it a \"true\" Heart of the Sea, however...",
		"points" => 1,
	],
	300075 => [
		"name" => "Ghost Sailor",
		"description" => "You have sailed the nether seas with the Ghost Captain. Despite the perils, you and your fellow crewmen have braved the challenge.",
		"points" => 1,
	],
	300076 => [
		"name" => "Ghostwhisperer",
		"description" => "You don't hunt them, you talk to them. You know that ghosts might keep secrets that have been long lost among the living, and you're skilled at talking them into revealing them to you.",
		"points" => 3,
	],
	300077 => [
		"name" => "Gnome Friend",
		"description" => "The gnomes are warming up to you. One or two of them might actually bother to remember your name. You're allowed to access their gnomebase alpha. You are prepared to boldly put your gib feet into areas few humans have walked before.",
		"points" => 2,
	],
	300078 => [
		"name" => "Gnome Little Helper",
		"description" => "You think the gnomes start to like you. A little step for a Bigfoot but a big step for humanity.",
		"points" => 1,
	],
	300079 => [
		"name" => "Gnomebane's Bane",
		"description" => "The fallen gnome is dead and justice served. But what was it that the gnome whispered with his last breath? He's your father???",
		"points" => 2,
	],
	300080 => [
		"name" => "Gnomelike",
		"description" => "You have become a household name in gnomish society! Your name is mentioned by gnomes more than once. Of course usually by gnomish mothers whose children refuse to eat their mushroom soup, but you are certainly making some tremendous progress.",
		"points" => 3,
	],
	300081 => [
		"name" => "Gnomish Art Of War",
		"description" => "You have unleashed your inner gnome and slain some of the most fearsome threats that gnomekind has ever faced. Now you can come and go to the warzones as it pleases you. The enemies of gnomekind will never be safe again.",
		"points" => 3,
	],
	300082 => [
		"name" => "Goo Goo Dancer",
		"description" => "Seeing a mucus plug makes your heart dance and you can't resist to see what it hides. Goo goo away!",
		"points" => 1,
	],
	300083 => [
		"name" => "Gravedigger",
		"description" => "Assisting Omrabas' sick plan to resurrect made you dig your way through the blood-soaked halls of Drefia. Maybe better he failed!",
		"points" => 3,
	],
	300084 => [
		"name" => "Greenhorn",
		"description" => "You wiped out Orcus the Cruel in the Arena of Svargrond. You're still a bit green behind the ears, but there's some great potential.",
		"points" => 2,
	],
	300085 => [
		"name" => "Grinding Again",
		"description" => "Burnt fingers and itching lungs are a small price for bringing those gnomes some lousy stone and getting almost killed! Your mother warned you to better become a farmer.",
		"points" => 1,
	],
	300086 => [
		"name" => "Guard Killer",
		"description" => "You have proven that you can beat the best of the hive. You have caused first promising breaches in the defence of the hive",
		"points" => 2,
	],
	300087 => [
		"name" => "Guinea Pig",
		"description" => "True scientists know their equipment. Testing new inventions is essential daily work for any hard working researcher. You showed no fear and took all the new equipment from Spectulus and Sinclair for a spin.",
		"points" => 2,
	],
	300088 => [
		"name" => "Happy Farmer",
		"description" => "Scythe swung over your shoulder, sun burning down on your back - you are a farmer at heart and love working in the fields. Or then again maybe you just create fancy crop circles to scare your fellow men.",
		"points" => 1,
	],
	300089 => [
		"name" => "Headache",
		"description" => "Even in the deepest structures of the hive, you began to strike against the mighty foe. Your actions probably already gave the hive a headache.",
		"points" => 2,
	],
	300090 => [
		"name" => "Heartburn",
		"description" => "Never-tiring, you attack the inner organs of the mighty hive. Your attacks on the hive's digestion system begin to cause some trouble.",
		"points" => 3,
	],
	300091 => [
		"name" => "Here, Fishy Fishy!",
		"description" => "Ah, the smell of the sea! Standing at the shore and casting a line is one of your favourite activities. For you, fishingis relaxing - and at the same time, providing easy food. Perfect!",
		"points" => 1,
	],
	300092 => [
		"name" => "Hickup",
		"description" => "You have grown accustomed to frequenting the hive's stomach system. Your actions have caused the hive some first digestion problems.",
		"points" => 2,
	],
	300093 => [
		"name" => "Hidden Powers",
		"description" => "You've discovered the Ancients' hidden powers - from now on, they will aid you in your adventures.",
		"points" => 2,
	],
	300094 => [
		"name" => "His True Face",
		"description" => "You're one of the few Tibians who Armenius chose to actually show his true face to - and he made you fight him. Either that means you're very lucky or very unlucky, but one thing's for sure - it's extremely rare.",
		"points" => 3,
	],
	300095 => [
		"name" => "Hissing Downfall",
		"description" => "You've vansquished the Noxious Spawn and his serpentine heart.",
		"points" => 2,
	],
	300096 => [
		"name" => "Hive Fighter",
		"description" => "You have participated that much in the hive war, that you are able to create some makeshift armor from the remains of dead hive born that can be found in the major hive, to show of your skill.",
		"points" => 1,
	],
	300097 => [
		"name" => "Hive Infiltrator",
		"description" => "The most powerful warriors of the hive were killed by you by the dozens. The hive is not safe anymore because of your actions.",
		"points" => 3,
	],
	300098 => [
		"name" => "Hive War Veteran",
		"description" => "Your invaluable experience in fighting the hive allows you to add another piece of armor to your chitin outfit to proove your dedication for the cause.",
		"points" => 1,
	],
	300099 => [
		"name" => "Homebrewed",
		"description" => "Yo-ho-ho and a bottle of rum - homebrewed, of course, made from handpicked and personally harvested sugar cane plants. Now, let it age in an oak barrel and enjoy it in about 10 years. Or for the impatient ones: Let's have a paaaarty right now!",
		"points" => 1,
	],
	300100 => [
		"name" => "Honest Finder",
		"description" => "You've stopped the bank robber and returned the bag full of gold. Good to know there are still lawful Tibians like you around.",
		"points" => 1,
	],
	300101 => [
		"name" => "Honorary Barbarian",
		"description" => "You've hugged bears, pushed mammoths and proved your drinking skills. And even though you have a slight hangover, a partially fractured rib and some greasy hair on your tongue, you're quite proud to call yourself a honorary barbarian from now on.",
		"points" => 1,
	],
	300102 => [
		"name" => "Howly Silence",
		"description" => "You muted the everlasting howling of Hemming.",
		"points" => 1,
	],
	300103 => [
		"name" => "Huntsman",
		"description" => "You're familiar with hunting tasks and have carried out quite a few already. A bright career as hunter for the Paw &amp; Fur society lies ahead!",
		"points" => 2,
	],
	300104 => [
		"name" => "I Did My Part",
		"description" => "Your world is lucky to have you! You don't hesitate to jump in and help when brave heroes are called to save the world.",
		"points" => 2,
	],
	300105 => [
		"name" => "I Like it Fancy",
		"description" => "You definitely know how to bring out the best in your furniture and decoration pieces. Beautiful.",
		"points" => 1,
	],
	300106 => [
		"name" => "I Need a Hug",
		"description" => "You and your stuffed furry friends are inseparable, and you're not ashamed to take them to bed with you - who knows when you will wake up in the middle of the night in dire need of a cuddle?",
		"points" => 2,
	],
	300107 => [
		"name" => "Ice Harvester",
		"description" => "You witnessed the thawing of Svargrond and harvested rare seeds from some strange icy plants. They must be good for something.",
		"points" => 1,
	],
	300108 => [
		"name" => "Ice Sculptor",
		"description" => "You love to hang out in cold surroundings and consider ice the best material to be shaped. What a waste to use ice cubes for drinks when you can create a beautiful mammoth statue from it!",
		"points" => 3,
	],
	300109 => [
		"name" => "Invader of the Deep",
		"description" => "Many creatures of the deep have lost their lives by your hand. Three hundred have entered the depths of eternity. You should probably fear the revenge of the Eyes of the Deep.",
		"points" => 2,
	],
	300110 => [
		"name" => "Jinx",
		"description" => "Sometimes you feel there's a gremlin in there. So many lottery tickets, so many blanks? That's just not fair! Share your misery with the world.",
		"points" => 2,
	],
	300111 => [
		"name" => "Joke's on You",
		"description" => "Well - the contents of that present weren't quite what you expected. With friends like these, who needs enemies?",
		"points" => 1,
	],
	300112 => [
		"name" => "Just Cracked Me Up!",
		"description" => "Stonecracker's head was much softer than the stones he threw at you.",
		"points" => 2,
	],
	300113 => [
		"name" => "Just in Time",
		"description" => "You're a fast runner and are good at delivering wares which are bound to decay just in the nick of time, even if you can't use any means of transportation or if your hands get cold or smelly in the process.",
		"points" => 1,
	],
	300114 => [
		"name" => "Kapow!",
		"description" => "No joke, you murdered the bat.",
		"points" => 1,
	],
	300115 => [
		"name" => "Keeper of the Flame",
		"description" => "One of the Lightbearers. One of those who helped to keep the basins burning and worked together against the darkness. The demonic whispers behind the thin veil between the worlds - they were silenced again thanks to your help.",
		"points" => 2,
	],
	300116 => [
		"name" => "King of the Ring",
		"description" => "Bretzecutioner's body just got slammed away. You are a true king of the ring!",
		"points" => 2,
	],
	300117 => [
		"name" => "King Tibianus Fan",
		"description" => "You're not sure what it is, but you feel drawn to royalty. Your knees are always a bit grazed from crawling around in front of thrones and you love hanging out in castles. Maybe you should consider applying as a guard?",
		"points" => 3,
	],
	300118 => [
		"name" => "Let the Sunshine In",
		"description" => "Rise and shine! It's a beautiful new day - open your windows, feel the warm sunlight, watch the birds singing on your windowsill and care for your plants. What reason is there not to be happy?",
		"points" => 1,
	],
	300119 => [
		"name" => "Loyal Subject",
		"description" => "You joined the Kingsday festivities and payed King Tibianus your respects. Now, off to party!",
		"points" => 1,
	],
	300120 => [
		"name" => "Lucid Dreamer",
		"description" => "Dreams - are your reality? Strange visions, ticking clocks, going to bed and waking up somewhere completely else - that was some trip, but you're almost sure you actually did enjoy it.",
		"points" => 2,
	],
	300121 => [
		"name" => "Mageslayer",
		"description" => "You killed the raging mage in his tower south of Zao. Again. But this one just keeps coming back. The dimensional portal collapsed once more and you know he will eventually return but hey - a raging mage, it's like asking for it...",
		"points" => 1,
	],
	300122 => [
		"name" => "Make a Wish",
		"description" => "But close your eyes and don't tell anyone what you wished for, or it won't come true!",
		"points" => 1,
	],
	300123 => [
		"name" => "Marblelous",
		"description" => "You're an aspiring marble sculptor with promising skills - proven by the perfect little Tibiasula statue you shaped. One day you'll be really famous!",
		"points" => 3,
	],
	300124 => [
		"name" => "Marid Ally",
		"description" => "You've proven to be a valuable ally to the Marid, and Gabel welcomed you to trade with Haroun and Nah'Bob whenever you want to. Though the Djinn war has still not ended, the Marid can't fail with you on their side.",
		"points" => 3,
	],
	300125 => [
		"name" => "Masquerader",
		"description" => "You probably don't know anymore how you really look like - usually when you look into a mirror, some kind of monster stares back at you. On the other hand - maybe that's an improvement?",
		"points" => 3,
	],
	300126 => [
		"name" => "Master Shapeshifter",
		"description" => "You have mastered Kuriks challenge in all possible shapes.",
		"points" => 2,
	],
	300127 => [
		"name" => "Mastermind",
		"description" => "You feel you could solve the hardest riddles within a minute or so. Plus, there's a nice boost on your spell damage. All in a little bottle. Aftereffects - feeling slightly stupid. For further questions consult your healer or potion dealer.",
		"points" => 3,
	],
	300128 => [
		"name" => "Matchmaker",
		"description" => "You don't believe in romance to be a coincidence or in love at first sight. In fact - love potions, bouquets of flowers and cheesy poems do the trick much better than ever could. Keep those hormones flowing!",
		"points" => 1,
	],
	300129 => [
		"name" => "Mathemagician",
		"description" => "Sometimes the biggest secrets of life can have a simple solution.",
		"points" => 1,
	],
	300130 => [
		"name" => "Meat Skewer",
		"description" => "You've impaled the big mammoth Bloodtusk with his own tusks.",
		"points" => 1,
	],
	300131 => [
		"name" => "Merry Adventures",
		"description" => "You went into the forest, met Rottin Wood and the Married Men and helped them out in their camp. Oh, and don't worry about those merchants. They won't dare mentioning the strangely large sums of gold they actually possessed which are missing now.",
		"points" => 2,
	],
	300132 => [
		"name" => "Ministrel",
		"description" => "You can handle any music instrument you're given - and actually manage to produce a pleasant sound with it. You're a welcome guest and entertainer in most taverns.",
		"points" => 2,
	],
	300133 => [
		"name" => "Minor Disturbance",
		"description" => "Your actions start to make a difference. You have blinded the antennae of the hive often enough to become an annoyance to it.",
		"points" => 2,
	],
	300134 => [
		"name" => "Mister Sandman",
		"description" => "Tired... so tired... curling up in a warm and cosy bed seems like the perfect thing to do right now. Sweet dreams!",
		"points" => 2,
	],
	300135 => [
		"name" => "Modest Guest",
		"description" => "You don't need much to sleep comfortably. A pile of straw and a roof over your head - with the latter being completely optional - is quite enough to relax. You don't even mind the rats nibbling on your toes.",
		"points" => 1,
	],
	300136 => [
		"name" => "Mutated Presents",
		"description" => "Muahahaha it's a... mutated pumpkin! After helping to take it down - you DID help, didn't you? - you claimed your reward and got a more or less weird present. Happy Halloween!",
		"points" => 1,
	],
	300137 => [
		"name" => "Natural Born Cowboy",
		"description" => "Oh, the joy of riding! You've just got your very first own mount. Conveniently enough you don't even need stables, but can summon it any time you like.",
		"points" => 1,
	],
	300138 => [
		"name" => "Natural Sweetener",
		"description" => "Liberty Bay is the perfect hangout for you and harvesting sugar cane quite a relaxing leisure activity. Would you like some tea with your sugar, hon?",
		"points" => 1,
	],
	300139 => [
		"name" => "Nestling",
		"description" => "You cleansed the land from an eight legged nuisance by defeating Mamma Longlegs three times. She won't be back soon... or will she?",
		"points" => 1,
	],
	300140 => [
		"name" => "Nether Pirate",
		"description" => "Not fearing death or ghosts you have traveled with the ghost captain several times and are a seasoned traveler of the netherworld. The dead and the living whisper about your exploits with appreciation.",
		"points" => 3,
	],
	300141 => [
		"name" => "Nightmare Knight",
		"description" => "You follow the path of dreams and that of responsibility without self-centered power. Free from greed and selfishness, you help others without expecting a reward.",
		"points" => 1,
	],
	300142 => [
		"name" => "No More Hiding",
		"description" => "You've found a well-hidden spider queen and caught her off guard in the middle of her meal.",
		"points" => 1,
	],
	300143 => [
		"name" => "Nomad Soul",
		"description" => "Home is where your current favourite hunting ground is, and though you might hold certain places more dear than others you never feel attached enough to really stay in one city for long. Pack all your stuff - it's time to move on again.",
		"points" => 2,
	],
	300144 => [
		"name" => "Nothing Can Stop Me",
		"description" => "You laugh at unprepared adventurers stuck in high grass or rush wood. Or maybe you actually do help them out. They call you... 'Machete'.",
		"points" => 1,
	],
	300145 => [
		"name" => "Number of the Beast",
		"description" => "Six. Six. Six.",
		"points" => 2,
	],
	300146 => [
		"name" => "One Foot Vs. Many",
		"description" => "One Bigfoot won over thousands of tiny feet. Perhaps the gnomes are wrong and size matters?",
		"points" => 1,
	],
	300147 => [
		"name" => "One Less",
		"description" => "The Many is no more, but how many more are there? One can never know.",
		"points" => 2,
	],
	300148 => [
		"name" => "Oops",
		"description" => "So much for your feathered little friend! Maybe standing in front of the birdcage, squeezing its neck and shouting 'Sing! Sing! Sing!' was a little too much for it?!",
		"points" => 2,
	],
	300149 => [
		"name" => "Party Animal",
		"description" => "Oh my god, it's a paaaaaaaaaaaarty! You're always in for fun, friends and booze and love being the center of attention. There's endless reasons to celebrate! Woohoo!",
		"points" => 1,
	],
	300150 => [
		"name" => "Passionate Kisser",
		"description" => "For you, a kiss is more than a simple touch of lips. You kiss maidens and deadbeats alike with unmatched affection and faced death and rebirth through the kiss of the banshee queen. Lucky are those who get to share such an intimate moment with you!",
		"points" => 3,
	],
	300151 => [
		"name" => "Perfect Fool",
		"description" => "You love playing jokes on others and tricking them into looking a little silly. Wagging tongues say that the moment of realisation in your victims' eyes is the reward you feed on, but you're probably just kidding and having fun with them... right??",
		"points" => 3,
	],
	300152 => [
		"name" => "Petrologist",
		"description" => "Stones have always fascinated you. So has the chance of finding something really precious inside one of them. Statistically you should've discovered a few nice treasures by now. But then again, most statistics are overriden by Mother Disfortune.",
		"points" => 2,
	],
	300153 => [
		"name" => "Piece of Cake",
		"description" => "Life can be so easy with the right cake at the right time - and you mastered baking many different ones, so you should be prepared for almost everything life decides to throw at you.",
		"points" => 1,
	],
	300154 => [
		"name" => "Pimple",
		"description" => "You are getting more and more experienced in destroying the supply of the enemy's forces. Your actions caused the hive some severe skin problems.",
		"points" => 3,
	],
	300155 => [
		"name" => "Planter",
		"description" => "The hive has to be fought with might and main, hampering its soldiers is only the first step. You diligently stopped the pores of the hive to spread its warriors.",
		"points" => 2,
	],
	300156 => [
		"name" => "Poet Laureate",
		"description" => "Poems, verses, songs and rhymes you've recited many times. You have passed the cryptic door, raconteur of ancient lore. Even elves you've left impressed, so it seems you're truly blessed.",
		"points" => 2,
	],
	300157 => [
		"name" => "Preservationist",
		"description" => "You are a pretty smart thinker and managed to create everlasting flowers. They might become a big hit with all the people who aren't blessed with a green thumb or just forgetful.",
		"points" => 1,
	],
	300158 => [
		"name" => "Quick as a Turtle",
		"description" => "There... is... simply... no... better... way - than to travel on the back of a turtle. At least you get to enjoy the beautiful surroundings of Laguna.",
		"points" => 2,
	],
	300159 => [
		"name" => "Recognised Trader",
		"description" => "You're a talented merchant who's able to handle wares with care, finds good offers and digs up rares every now and then. Never late to complete an order, you're a reliable trader - at least in Rashid's eyes.",
		"points" => 3,
	],
	300160 => [
		"name" => "Rock Me to Sleep",
		"description" => "Sleeping - you do it with style. You're chilling in your hammock, listening to the sound of the birds and crickets as you slowly drift away into the realm of dreams.",
		"points" => 1,
	],
	300161 => [
		"name" => "Rocket in Pocket",
		"description" => "Either you are not a fast learner or you find some pleasure in setting yourself on fire. Or you're just looking for a fancy title. In any case, you should know that passing gas during your little donkey experiments is not recommended.",
		"points" => 1,
	],
	300162 => [
		"name" => "Rockstar",
		"description" => "Music just comes to you naturally. You feel comfortable on any stage, at any time, and secretly hope that someday you will be able to defeat your foes by playing music only. Rock on!",
		"points" => 3,
	],
	300163 => [
		"name" => "Rollercoaster",
		"description" => "Up and down and up and down... and then the big looping! Wait - they don't build loopings in Kazordoon. But ore wagon rides are still fun!",
		"points" => 1,
	],
	300164 => [
		"name" => "Rootless Behaviour",
		"description" => "You've descended into the swampy depths of Deathbine's lair and made quick work of it.",
		"points" => 1,
	],
	300165 => [
		"name" => "Safely Stored Away",
		"description" => "Don't worry, no one will be able to take it from you. Probably.",
		"points" => 2,
	],
	300166 => [
		"name" => "Santa's Li'l Helper",
		"description" => "Christmas is your favourite time of the year, and boy, do you love presents. Buy some nice things for your friends, hide them away until - well, until you decide to actually unwrap them rather yourself.",
		"points" => 2,
	],
	300167 => [
		"name" => "Scorched Flames",
		"description" => "A mighty blaze went out today. It's Flameborn's turn to wait for his rebirth in the eternal cycle of life and death.",
		"points" => 1,
	],
	300168 => [
		"name" => "Scrapper",
		"description" => "You put out the Spirit of Fire's flames in the arena of Svargrond. Arena fights are for you - fair, square, with simple rules and one-on-one battles.",
		"points" => 3,
	],
	300169 => [
		"name" => "Sea Scout",
		"description" => "Not even the hostile underwater environment stops you from doing your duty for the Explorer Society. Scouting the Quara realm is a piece of cake for you.",
		"points" => 2,
	],
	300170 => [
		"name" => "Secret Agent",
		"description" => "Pack your spy gear and get ready for some dangerous missions in service of a secret agency. You've shown you want to - but can you really do it? Time will tell.",
		"points" => 1,
	],
	300171 => [
		"name" => "Shaburak Nemesis",
		"description" => "You are now the public archenemy of the Shaburak, prince slayer.",
		"points" => 1,
	],
	300172 => [
		"name" => "Sharpshooter",
		"description" => "Improved eyesight, arrows and bolts flying at the speed of light and pinning your enemies with extra damage. All in a little bottle. No consumption of carrots required. For further questions consult your healer or potion dealer.",
		"points" => 3,
	],
	300173 => [
		"name" => "Si, Ariki!",
		"description" => "You've found the oriental traveller Yasir and were able to trade with him - even if you didn't really understand his language.",
		"points" => 1,
	],
	300174 => [
		"name" => "Shell Seeker",
		"description" => "You found a hundred beautiful pearls in large sea shells. By now that necklace should be finished - and hopefully you didn't get your fingers squeezed too often during the process.",
		"points" => 3,
	],
	300175 => [
		"name" => "Silent Pet",
		"description" => "Awww. Your very own little goldfish friend - he's cute, he's shiny and he can't complain should you forget to feed him. He'll definitely brighten up your day!",
		"points" => 1,
	],
	300176 => [
		"name" => "Slayer of Anmothra",
		"description" => "Souls are like butterflies. The black soul of a living weapon yearning to strike lies shattered beneath your feet.",
		"points" => 2,
	],
	300177 => [
		"name" => "Slayer of Chikhaton",
		"description" => "Power lies in the will of her who commands it. You fought it with full force - and were stronger.",
		"points" => 2,
	],
	300178 => [
		"name" => "Slayer of Irahsae",
		"description" => "Few things equal the wild fury of a trapped and riven creature. You were a worthy opponent.",
		"points" => 2,
	],
	300179 => [
		"name" => "Slayer of Phrodomo",
		"description" => "Blind hatred took physical form, violently rebelling against the injustice it was born into. You were not able to bring justice - but at least temporary peace.",
		"points" => 2,
	],
	300180 => [
		"name" => "Slayer of Teneshpar",
		"description" => "The forbidden knowledge of aeons was never meant to invade this world. You silenced its voice before it could be made heard.",
		"points" => 2,
	],
	300181 => [
		"name" => "Slim Chance",
		"description" => "Okay, let's face it - as long as you believe it could potentially lead you to the biggest treasure ever, you won't let go of that map, however fishy it might look. There must be a secret behind all of this!",
		"points" => 1,
	],
	300182 => [
		"name" => "Slimer",
		"description" => "With the assistance of your friendly little helper, you gobbled more than 500 chunks of slime. Well done, Slimer.",
		"points" => 1,
	],
	300183 => [
		"name" => "Snowbunny",
		"description" => "Hopping, hopping through the snow - that's the funnest way to go! Making footprints in a flurry - it's more fun the more you hurry! Licking icicles all day - Winter, never go away!",
		"points" => 2,
	],
	300184 => [
		"name" => "Someone's Bored",
		"description" => "That was NOT a giant spider. There's some witchcraft at work here.",
		"points" => 1,
	],
	300185 => [
		"name" => "Something Smells",
		"description" => "You've exinguished the Sulphur Scuttler's gas clouds and made the air in his cave a little better... at least for a while.",
		"points" => 1,
	],
	300186 => [
		"name" => "Something's in There",
		"description" => "By the gods! What was that?",
		"points" => 1,
	],
	300187 => [
		"name" => "Spareribs for Dinner",
		"description" => "Ribstride is striding no more. He had quite a few ribs to spare though.",
		"points" => 1,
	],
	300188 => [
		"name" => "Spectral Traveler",
		"description" => "You have sailed the nether seas with the Ghost Captain several times. The dangers of the nether have become familiar to you and unexperienced travelers turn to you for advice.",
		"points" => 2,
	],
	300189 => [
		"name" => "Spore Hunter",
		"description" => "After hunting for the correct mushrooms and their spores you're starting to feel like a mushroom yourself. A few times more and you might start thinking like a mushroom, who knows?",
		"points" => 1,
	],
	300190 => [
		"name" => "Steampunked",
		"description" => "Travelling with the dwarven steamboats through the underground rivers is your preferred way of crossing the lands. No pesky seagulls, and good beer on board!",
		"points" => 2,
	],
	300191 => [
		"name" => "Stepped on a Big Toe",
		"description" => "This time you knocked out the big one.",
		"points" => 1,
	],
	300192 => [
		"name" => "Substitute Tinker",
		"description" => "Ring-a-ding! You have visited the golem workshop and lent a hand in repairing them. To know those golems are safe is worth all the bruises, isn't it?",
		"points" => 1,
	],
	300193 => [
		"name" => "Superstitious",
		"description" => "Fortune tellers and horoscopes guide you through your life. And you probably wouldn't dare going on a big game hunt without your trusty voodoo skull giving you his approval for the day.",
		"points" => 2,
	],
	300194 => [
		"name" => "Supplier",
		"description" => "The need for supplies often decides over loss or victory. Your tireless efforts to resupply the resources keeps the war against the hive going.",
		"points" => 3,
	],
	300195 => [
		"name" => "Sweet Tooth",
		"description" => "The famous 'Ode to a Molten Chocolate Cake' was probably written by you. Spending a rainy afternoon in front of the chimney, wrapped in a blanket while indulging in cocoa delights sounds just like something you'd do. Enjoy!",
		"points" => 2,
	],
	300196 => [
		"name" => "Talented Dancer",
		"description" => "You're a lord or lady of the dance - and not afraid to use your skills to impress tribal gods. One step to the left, one jump to the right, twist and shout!",
		"points" => 1,
	],
	300197 => [
		"name" => "Task Manager",
		"description" => "Helping a poor, stupid goblin to feed his starving children and wifes feels good ... if you'd only get rid of the strange feeling that you're missing something.",
		"points" => 2,
	],
	300198 => [
		"name" => "Teamplayer",
		"description" => "You don't consider yourself too good to do the dirty work while someone else might win the laurels for killing Devovorga. They couldn't do it without you!",
		"points" => 2,
	],
	300199 => [
		"name" => "Territorial",
		"description" => "Your map is your friend - always in your back pocket and covered with countless marks of interesting and useful locations. One could say that you might be lost without it - but luckily there's no way to take it from you.",
		"points" => 1,
	],
	300200 => [
		"name" => "The Cake's the Truth",
		"description" => "And anyone claiming otherwise is a liar.",
		"points" => 1,
	],
	300201 => [
		"name" => "The Day After",
		"description" => "Uhm... who's that person who you just woke up beside? Broken cocktail glasses on the floor, flowers all over the room, and why the heck are you wearing a ring? Yesterday must have been a long, weird day...",
		"points" => 2,
	],
	300202 => [
		"name" => "The Drowned Sea God",
		"description" => "As the killer of Leviathan, the giant sea serpent, his underwater kingdom is now under your reign.",
		"points" => 2,
	],
	300203 => [
		"name" => "The Gates of Hell",
		"description" => "It seems the gates to the underworld have to remain unprotected for a while. Kerberos, the mighty hellhound, lost his head. All three of them.",
		"points" => 2,
	],
	300204 => [
		"name" => "The Milkman",
		"description" => "Who's the milkman? You are!",
		"points" => 2,
	],
	300205 => [
		"name" => "The Picky Pig",
		"description" => "The gnomes decided their pigs need some exclusive diet and you had to do all the dirty work - but wasn't the piglet adorable?",
		"points" => 1,
	],
	300206 => [
		"name" => "The Serpent's Bride",
		"description" => "You made a knot with Gorgo's living curls and took her scalp. You couldn't save her countless petrified victims, but at least you didn't become one.",
		"points" => 2,
	],
	300207 => [
		"name" => "The Undertaker",
		"description" => "You and your shovel - a match made in heaven. Or hell, for that matter. Somewhere down below in any case. You're magically attracted by stone piles and love to open them up and see where those holes lead you. Good biceps as well.",
		"points" => 2,
	],
	300208 => [
		"name" => "Torn Treasures",
		"description" => "Wyda seems to be really, really bored. You also found out that she doesn't really need all those blood herbs that adventurers brought her. Still, she was nice enough to take one from you and gave you something quite cool in exchange.",
		"points" => 1,
	],
	300209 => [
		"name" => "Trail of the Ape God",
		"description" => "You've discovered a trail of giant footprints and Terrified Elephants running everywhere. Could it be that the mysterious Ape God is rambling in the jungle?",
		"points" => 1,
	],
	300210 => [
		"name" => "True Colours",
		"description" => "You and your friends showed the three wizards your loyalty three times - I am sure at least one of them is probably eternally thankful and exceedingly proud of you.",
		"points" => 3,
	],
	300211 => [
		"name" => "Truth Be Told",
		"description" => "You told Jack the truth by explaining you and Spectulus made a mistake when trying to convince him of being a completely different person.",
		"points" => 2,
	],
	300212 => [
		"name" => "Twisted Mutation",
		"description" => "You've slain Esmeralda, the most hideous and aggressive of the mutated rats. No one will know that you almost lost a finger in the process.",
		"points" => 1,
	],
	300213 => [
		"name" => "Vanity",
		"description" => "Aren't you just perfectly, wonderfully, beautifully gorgeous? You can't pass a mirror without admiring your looks. Or maybe doing a quick check whether something's stuck in your teeth, perhaps?",
		"points" => 3,
	],
	300214 => [
		"name" => "Vive la Resistance",
		"description" => "You've always been a rebel - admit it! Supplying prisoners, caring for outcasts, stealing from the rich and giving to the poor - no wait, that was another story.",
		"points" => 2,
	],
	300215 => [
		"name" => "Wayfarer",
		"description" => "Dragon dreams are golden.",
		"points" => 3,
	],
	300216 => [
		"name" => "Whistle-Blower",
		"description" => "You can't keep a secret, can you? Then again, you're just fulfilling your duty to the Queen of Carlin as a lawful citizen. That's a good thing, isn't it...?",
		"points" => 1,
	],
	300217 => [
		"name" => "Witches Lil' Helper",
		"description" => "You sacrificed ingredients to create the protective brew of the witches.",
		"points" => 1,
	],
	300218 => [
		"name" => "With a Cherry on Top",
		"description" => "You like your cake soft, with fruity bits and a nice sugar icing. And you prefer to make them by yourself. Have you ever considered opening a bakery? You must be really good by now!",
		"points" => 1,
	],
	300219 => [
		"name" => "Worm Whacker",
		"description" => "Weehee! Whack those worms! You sure know how to handle a big hammer.",
		"points" => 1,
	],
	300220 => [
		"name" => "Yalahari of Power",
		"description" => "You defend Yalahar with brute force and are ready to lead it into a glorious battle, if necessary. Thanks to you, Yalahar will be powerful enough to stand up against any enemy.",
		"points" => 3,
	],
	300221 => [
		"name" => "Yalahari of Wisdom",
		"description" => "Your deeds for Yalahar are usually characterised by deep insight and thoughtful actions. Thanks to you, Yalahar might have a chance to grow peacefully and with happy people living in it.",
		"points" => 3,
	],
	300222 => [
		"name" => "You Don't Know Jack",
		"description" => "You did not tell Jack the truth about the mistake you and Spectulus made when trying to convince him about being a completely different person. He will live in doubt until the end of his existence.",
		"points" => 2,
	],
	300223 => [
		"name" => "Zzztill Zzztanding!",
		"description" => "You wiped Fazzrah away - zzeemzz like now you're the captain.",
		"points" => 1,
	],
	300224 => [
		"name" => "Alumni",
		"description" => "You're considered a first-rate graduate of the Magic Academy in Edron due to your pioneering discoveries and successful studies in the field of experimental magic and spell development. Ever considered teaching the Armageddon spell?",
		"points" => 6,
	],
	300225 => [
		"name" => "Annihilator",
		"description" => "You've daringly jumped into the infamous Annihilator and survived - taking home fame, glory and your reward.",
		"points" => 5,
	],
	300226 => [
		"name" => "Aristocrat",
		"description" => "You begin your day by bathing in your pot of gold and you don't mind showing off your wealth while strolling the streets in your best clothes - after all it's your hard-earned money! You prefer to be addressed with 'Your Highness'.",
		"points" => 4,
	],
	300227 => [
		"name" => "Ashes to Dust",
		"description" => "Staking vampires and demons has almost turned into your profession. You make sure to gather even the tiniest amount of evil dust particles. Beware of silicosis.",
		"points" => 4,
	],
	300228 => [
		"name" => "Beak Doctor",
		"description" => "You significantly helped the afflicted citizens of Venore in times of dire need. Somehow you still feel close to the victims of the fever outbreak. Your clothes make you one of them, one poor soul amongst the countless afflicted.",
		"points" => 4,
	],
	300229 => [
		"name" => "Berry Picker",
		"description" => "The Combined Magical Winterberry Society hereby honours continued selfless dedication and extraordinary efforts in the Annual Autumn Vintage.",
		"points" => 4,
	],
	300230 => [
		"name" => "Brutal Politeness",
		"description" => "What is best in life? To crush your enemies. To see them driven before you. And to maybe have a nice cup of tea afterwards.",
		"points" => 6,
	],
	300231 => [
		"name" => "Castlemania",
		"description" => "You have an eye for suspicious places and love to read other people's diaries, especially those with vampire stories in it. You're also a dedicated token collector and explorer. Respect!",
		"points" => 5,
	],
	300232 => [
		"name" => "Champion of Chazorai",
		"description" => "You won the merciless 2 vs. 2 team tournament on the Isle of Strife and wiped out wave after wave of fearsome opponents. Death or victory - you certainly chose the latter.",
		"points" => 4,
	],
	300233 => [
		"name" => "Chitin Bane",
		"description" => "You have become competent and efficient in gathering the substance that is needed to fight the hive. You almost smell like dissolved chitin and the Hive Born would tell their children scary stories about you if they could speak.",
		"points" => 4,
	],
	300234 => [
		"name" => "Clay to Fame",
		"description" => "Sculpting Brog, the raging Titan, is your secret passion. Numerous perfect little clay statues with your name on them can be found everywhere around Tibia.",
		"points" => 6,
	],
	300235 => [
		"name" => "Culinary Master",
		"description" => "Simple hams and bread merely make you laugh. You're the master of the extra-ordinaire, melter of cheese, fryer of bat wings and shaker of shakes. Delicious!",
		"points" => 4,
	],
	300236 => [
		"name" => "Death on Strike",
		"description" => "Again and again Deathstrike has fallen to your prowess. Perhaps it's time for people calling YOU Deathstrike from now on.",
		"points" => 4,
	],
	300237 => [
		"name" => "Deep Sea Diver",
		"description" => "Under the sea - might not be your natural living space, but you're feeling quite comfortable on the ocean floor. Quara don't scare you anymore and sometimes you sleep with your helmet of the deep still equipped.",
		"points" => 4,
	],
	300238 => [
		"name" => "Demonbane",
		"description" => "You don't carry that stake just for decoration - you're prepared to use it. Usually you're seen hightailing through the deepest dungeons leaving a trail of slain demons. Whoever dares stand in your way should prepare to die.",
		"points" => 6,
	],
	300239 => [
		"name" => "Devovorga's Nemesis",
		"description" => "One special hero among many. This year - it was you. Devovorga withdrew in a darker realm because she could not withstand your power - and that of your comrades. Time will tell if the choice you made was good - but for now, it saved your world.",
		"points" => 5,
	],
	300240 => [
		"name" => "Diplomatic Immunity",
		"description" => "You killed the ambassador of the abyss that often that they might consider sending another one. Perhaps that will one day stop further intrusions.",
		"points" => 4,
	],
	300241 => [
		"name" => "Elite Hunter",
		"description" => "You jump at every opportunity for a hunting challenge that's offered to you and carry out those tasks with deadly precision. You're a hunter at heart and a valuable member of the Paw &amp; Fur Society.",
		"points" => 5,
	],
	300242 => [
		"name" => "Exemplary Citizen",
		"description" => "Every city should be proud to call someone like you its inhabitant. You're keeping the streets clean and help settling the usual disputes in front of the depot. Also, you probably own a cat and like hiking.",
		"points" => 4,
	],
	300243 => [
		"name" => "Explorer",
		"description" => "You've been to places most people don't even know the names of. Collecting botanic, zoologic and ectoplasmic samples is your daily business and you're always prepared to discover new horizons.",
		"points" => 4,
	],
	300244 => [
		"name" => "Exterminator",
		"description" => "Efficient and lethal, you have gained significant experience in fighting the elite forces of the hive. Almost single-handed, you have slain the best of the Hive Born and live to tell the tale.",
		"points" => 4,
	],
	300245 => [
		"name" => "Fall of the Fallen",
		"description" => "Have you ever wondered how he reappears again and again? You only care for the loot, do you? Gotcha!",
		"points" => 4,
	],
	300246 => [
		"name" => "Follower of Azerus",
		"description" => "When you do something, you do it right. You have an opinion and you stand by it - and no one will be able to convince you otherwise. On a sidenote, you're a bit on the brutal and war-oriented side, but that's not a bad thing, is it?",
		"points" => 4,
	],
	300247 => [
		"name" => "Follower of Palimuth",
		"description" => "You're a peacekeeper and listen to what the small people have to say. You've made up your mind and know who to help and for which reasons - and you do it consistently. Your war is fought with reason rather than weapons.",
		"points" => 4,
	],
	300248 => [
		"name" => "Friend of the Apes",
		"description" => "You know Banuta like the back of your hand and are good at destroying caskets and urns. The sight of giant footprints doesn't keep you from exploring unknown areas either.",
		"points" => 4,
	],
	300249 => [
		"name" => "Godslayer",
		"description" => "You have defeated the Snake God's incarnations and, with a final powerful swing of the snake sceptre, cut off his life force supply. The story of power, deceit and corruption has come to an end - or... not?",
		"points" => 4,
	],
	300250 => [
		"name" => "Gold Digger",
		"description" => "Hidden treasures below the sand dunes of the desert - you have a nose for finding them and you know where to dig. They might not make you filthy rich, but they're shiny and pretty anyhow.",
		"points" => 4,
	],
	300251 => [
		"name" => "Golem in the Gears",
		"description" => "You're an aspiring mago-mechanic. Science and magic work well together in your eyes - and even though you probably delivered countless wrong charges while working for Telas, you might just have enough knowledge to build your own golem now.",
		"points" => 4,
	],
	300252 => [
		"name" => "Green Thumb",
		"description" => "If someone gives you seeds, you usually grow a beautiful plant from it within a few days. You like your house green and decorated with flowers. Probably you also talk to them.",
		"points" => 4,
	],
	300253 => [
		"name" => "Guardian Downfall",
		"description" => "You ended the life of over three hundred Deepling Guards. Not quite the guardian of the Deeplings, are you?",
		"points" => 4,
	],
	300254 => [
		"name" => "High Inquisitor",
		"description" => "You're the one who poses the questions around here, and you know how to get the answers you want to hear. Besides, you're a famous exorcist and slay a few vampires and demons here and there. You and your stake are a perfect team.",
		"points" => 5,
	],
	300255 => [
		"name" => "High-Flyer",
		"description" => "The breeze in your hair, your fingers clutching the rim of your Carpet - that's how you like to travel. Faster! Higher! And a looping every now and then.",
		"points" => 4,
	],
	300256 => [
		"name" => "Hive Blinder",
		"description" => "You have put a lot of time and energy into keeping the hive unaware of what is happening on Quirefang. The hive learnt to fear your actions. It would surely crush you with all its might ... if it could only find you!",
		"points" => 4,
	],
	300257 => [
		"name" => "Honorary Gnome",
		"description" => "You accomplished what few humans ever will: you truly impressed the gnomes. This might not change their outlook on humanity as a whole, but at least you can bathe in gnomish respect! And don't forget you're now allowed to enter the warzones!",
		"points" => 4,
	],
	300258 => [
		"name" => "Honorary Witch",
		"description" => "Your efforts in fighting back the banebringers has not gone unnoticed. You are a legend amongst the witches and your name is whispered with awe and admiration.",
		"points" => 4,
	],
	300259 => [
		"name" => "Hunting with Style",
		"description" => "At daytime you can be found camouflaged in the woods laying traps or chasing big game, at night you're sitting by the campfire and sharing your hunting stories. You eat what you hunted and wear what you skinned. Life could go on like that forever.",
		"points" => 6,
	],
	300260 => [
		"name" => "In Shining Armor",
		"description" => "With edged blade and fully equipped in a sturdy full plate armor, you charge at your enemies with both strength and valour. There's always a maiden to save and a dragon to slay for you.",
		"points" => 6,
	],
	300261 => [
		"name" => "Interior Decorator",
		"description" => "Your home is your castle - and the furniture in it is just as important. Your friends ask for your advice when decorating their Houses and your probably own every statue, rack and bed there is.",
		"points" => 4,
	],
	300262 => [
		"name" => "Jamjam",
		"description" => "When it comes to interracial understanding, you're an expert. You've mastered the language of the Chakoya and made someone really happy with your generosity. Achuq!",
		"points" => 5,
	],
	300263 => [
		"name" => "Life on the Streets",
		"description" => "You're a beggar, homeless, wearing filthy and ragged clothes. But that doesn't mean you have to beg anyone for stuff - and you still kept your pride. Fine feathers do not necessarily make fine birds - what's under them is more important.",
		"points" => 4,
	],
	300264 => [
		"name" => "Lord of the Elements",
		"description" => "You travelled the surreal realm of the elemental spheres, summoned and slayed the Lord of the Elements, all in order to retrieve neutral matter. And as brave as you were, you couldn't have done it without your team!",
		"points" => 5,
	],
	300265 => [
		"name" => "Lucky Devil",
		"description" => "That's almost too much luck for one person. If something's really, really rare - it probably falls into your lap sooner or later. Congratulations!",
		"points" => 4,
	],
	300266 => [
		"name" => "Manic",
		"description" => "You have destroyed a significant amount of the hive's vital nerve centres and caused massive destruction to the hive's awareness. You are probably causing the hive horrible nightmares.",
		"points" => 4,
	],
	300267 => [
		"name" => "Marble Madness",
		"description" => "Your little statues of Tibiasula have become quite famous around Tibia and there's few people with similar skills when it comes to shaping marble.",
		"points" => 6,
	],
	300268 => [
		"name" => "Master of the Nexus",
		"description" => "You were able to fight your way through the countless hordes in the Demon Forge. Once more you proved that nothing is impossible.",
		"points" => 6,
	],
	300269 => [
		"name" => "Master of War",
		"description" => "You're not afraid to show your colours in the heat of battle. Enemies fear your lethal lance and impenetrable armor. The list of the wars you've won is impressive. Hail and kill!",
		"points" => 6,
	],
	300270 => [
		"name" => "Master Thief",
		"description" => "Robbing, inviting yourself to VIP parties, faking contracts and pretending to be someone else - you're a jack of all trades when it comes to illegal activities. You take no prisoners, except for the occasional goldfish now and then.",
		"points" => 4,
	],
	300271 => [
		"name" => "Mystic Fabric Magic",
		"description" => "You vanquished the mad mage, you subdued the raging mage - no spellweaving self-exposer can stand in your way. Yet you are quite absorbed in magical studies yourself. This very fabric reflects this personal approval of the magic arts.",
		"points" => 4,
	],
	300272 => [
		"name" => "Navigational Error",
		"description" => "You confronted the Navigator.",
		"points" => 5,
	],
	300273 => [
		"name" => "Nightmare Walker",
		"description" => "You do not fear nightmares, you travel in them - facing countless horrors and fighting the fate they're about to bring. Few believe the dark prophecies you bring back from those dreams, but those who do fight alongside you as Nightmare Knights.",
		"points" => 6,
	],
	300274 => [
		"name" => "Of Wolves and Bears",
		"description" => "One with nature, one with wildlife. Raw and animalistic power, sharpened senses, howling on the highest cliffs and roaring in the thickest forests - that's you.",
		"points" => 6,
	],
	300275 => [
		"name" => "One Thousand and One",
		"description" => "You feel at home under the hot desert sun with sand between your toes, and your favourite means of travel is a flying carpet. Also, you can probably do that head isolation dance move.",
		"points" => 6,
	],
	300276 => [
		"name" => "Out in the Snowstorm",
		"description" => "Snow heaps and hailstorms can't keep you from where you want to go. You're perfectly equipped for any expedition into the perpetual ice and know how to keep your feet warm. If you're a woman, that's quite an accomplishment, too.",
		"points" => 4,
	],
	300277 => [
		"name" => "Peazzekeeper",
		"description" => "You're a humble warrior who doesn't need wealth or specialised equipment for travelling and fighting. You feel at home in the northern lands of Zao and did your part in fighting its corruption.",
		"points" => 6,
	],
	300278 => [
		"name" => "Polisher",
		"description" => "If you see a rusty item, you can't resist polishing it. There's always a little flask of rust remover in your inventory - who knows, there might be a golden armor beneath all that dirt!",
		"points" => 4,
	],
	300279 => [
		"name" => "Potion Addict",
		"description" => "Your local magic trader considers you one of his best customers - you usually buy large stocks of potions so you won't wake up in the middle of the night craving for more. Yet, you always seem to run out of them too fast. Cheers!",
		"points" => 4,
	],
	300280 => [
		"name" => "Ritualist",
		"description" => "You could be the author of the magnum opus 'How to Summon the Ultimate Beast from the Infernal Depths, Volume I'. Or, if your mind and heart are pure, you rather summon beings to help others. Or maybe just a little cat to have someone to cuddle.",
		"points" => 6,
	],
	300281 => [
		"name" => "Ruthless",
		"description" => "You've touched all thrones of The Ruthless Seven and absorbed some of their evil spirit. It may have changed you forever.",
		"points" => 5,
	],
	300282 => [
		"name" => "Scourge of Death",
		"description" => "You are a master of the nether sea and have traveled with the ghost captain so many times that you know his ship and the perils of the nether sea inside out. You laugh in the face of death and may return as a ghost pirate yourself in the afterlife!",
		"points" => 5,
	],
	300283 => [
		"name" => "Ship's Kobold",
		"description" => "You've probably never gotten seasick in your life - you love spending your free time on the ocean and covered quite a lot of miles with ships. Aren't you glad you didn't have to swim all that?",
		"points" => 4,
	],
	300284 => [
		"name" => "Skin-Deep",
		"description" => "You always carry your obsidian knife with you and won't hesitate to use it. You've skinned countless little - and bigger - critters and yeah: they usually don't get any more beautiful on the inside. It's rather blood and gore and all that...",
		"points" => 4,
	],
	300285 => [
		"name" => "Skull and Bones",
		"description" => "Wearing the insignia and dark robes of the Brotherhood of Bones you roam the lands spreading fear and pain, creating new soldiers for the necromantic army which is about to rise soon. Hail the Brotherhood.",
		"points" => 6,
	],
	300286 => [
		"name" => "Spolium Profundis",
		"description" => "You travelled the depths of this very world. You entered the blackness of the deep sea to conquer the realm of the Deeplings. May this suit remind you of the strange beauty below.",
		"points" => 4,
	],
	300287 => [
		"name" => "Stomach Ulcer",
		"description" => "You severely disrupted the digestion of the hive. The hive should for sure see a doctor. It seems you proved to be more than it can swallow.",
		"points" => 4,
	],
	300288 => [
		"name" => "Suppressor",
		"description" => "A war is won by those who have the best supply of troops. The hive's troops have been dealt a significant blow by your actions. You interrupted the hive's replenishment of troops lastingly and severely.",
		"points" => 4,
	],
	300289 => [
		"name" => "Swashbuckler",
		"description" => "Ye be a gentleman o' fortune, fightin' and carousin' on the high seas, out fer booty and lassies! Ye no be answerin' to no man or blasted monarchy and yer life ain't fer the lily-livered. Aye, matey!",
		"points" => 6,
	],
	300290 => [
		"name" => "Swift Death",
		"description" => "Stealth kills and backstabbing are you specialty. Your numerous victims are usually unaware of their imminent death, which you bring to them silently and swiftly. Everything is permitted.",
		"points" => 6,
	],
	300291 => [
		"name" => "Top AVIN Agent",
		"description" => "You've proven yourself as a worthy member of the 'family' and successfully carried out numerous spy missions for your 'uncle' to support the Venorean traders and their goals.",
		"points" => 4,
	],
	300292 => [
		"name" => "Top CGB Agent",
		"description" => "Girl power! Whether you're female or not, you've proven absolute loyalty and the willingness to put your life at stake for the girls brigade of Carlin.",
		"points" => 4,
	],
	300293 => [
		"name" => "Top TBI Agent",
		"description" => "Conspiracies and open secrets are your daily bread. You've shown loyalty to the Thaian crown through your courage when facing enemies and completing spy missions. You're an excellent field agent of the TBI.",
		"points" => 4,
	],
	300294 => [
		"name" => "True Dedication",
		"description" => "You conquered the demon challenge and prevailed... now show off your success in style!",
		"points" => 5,
	],
	300295 => [
		"name" => "True Lightbearer",
		"description" => "You're one of the most dedicated Lightbearers - without you, the demons would have torn the veil between the worlds for sure. You've lit each and every basin, travelling high and low, pushing back the otherworldly forces. Let there be light!",
		"points" => 5,
	],
	300296 => [
		"name" => "Turncoat",
		"description" => "You served Yalahar - but you didn't seem so sure whom to believe on the way. Both Azerus and Palimuth had good reasons for their actions, and thus you followed your gut instinct in the end, even if you helped either of them. May Yalahar prosper!",
		"points" => 4,
	],
	300297 => [
		"name" => "Warlock",
		"description" => "You're proficient in the darker ways of magic and are usually found sitting inside a circle of candles and skulls muttering unspeakable words. Don't carry things too far or the demons might come get you.",
		"points" => 6,
	],
	300298 => [
		"name" => "Warlord of Svargrond",
		"description" => "You sent the Obliverator into oblivion in the arena of Svargrond and defeated nine other dangerous enemies on the way. All hail the Warlord of Svargrond!",
		"points" => 5,
	],
	300299 => [
		"name" => "Way of the Shaman",
		"description" => "Shaking your rattle and dancing around the fire to jungle drums sounds like something you like doing. Besides, dreadlocks are a convenient way to wear your hair - no combing required!",
		"points" => 6,
	],
	300300 => [
		"name" => "Wild Warrior",
		"description" => "Valour is for weaklings - it doesn't matter how you win the battle, as long as you're victorious. Thick armor would just hinder your movements, thus you keep it light and rely on speed and skill instead of hiding in an uncomfortable shell.",
		"points" => 6,
	],
	300301 => [
		"name" => "Dread Lord",
		"description" => "You don't care for rules that others set up and shape the world to your liking. Having left behind meaningless conventions and morals, you prize only the power you wield. You're a master of your fate and battle to cleanse the world.",
		"points" => 8,
	],
	300302 => [
		"name" => "Herbicide",
		"description" => "You're one of the brave heroes to face and defeat the mysterious demon oak and all the critters it threw in your face. Wielding your blessed axe no tree dares stand in your way - demonic or not.",
		"points" => 8,
	],
	300303 => [
		"name" => "Lord Protector",
		"description" => "You proved yourself - not only in your dreams - and possess a strong and spiritual mind. Your valorous fight against demons and the undead plague has granted you the highest and most respected rank among the Nightmare Knights.",
		"points" => 8,
	],
	300304 => [
		"name" => "Pwned a Lot of Fur",
		"description" => "You've faced and defeated a lot of the mighty bosses the Paw and Fur society sent you out to kill. All by yourself. What a hunt!",
		"points" => 8,
	],
	300305 => [
		"name" => "Pwned All Fur",
		"description" => "You've faced and defeated each of the mighty bosses the Paw and Fur society sent you out to kill. All by yourself. What a hunt!",
		"points" => 8,
	],
	300306 => [
		"name" => "Dream Warden",
		"description" => "It doesn't matter what noise you would hear... dream, nightmare, illusion - there is nothing you can't vanquish. You are a true Dream Warden.",
		"points" => 5,
	],
	300307 => [
		"name" => "Dream Wright",
		"description" => "You have mended many a broken dream and so, the dream of Roshamuul is safely being told over and over again.",
		"points" => 1,
	],
	300308 => [
		"name" => "Ending the Horror",
		"description" => "You have cleansed the lands of many retching horrors. You sure know how to end a bad dream: forcefully, that's how!",
		"points" => 2,
	],
	300309 => [
		"name" => "Luring Silence",
		"description" => "What a scientific discovery - they really DO communicate! Using their own communication habits against them, you lured a large pack of silencers away from the walls of Roshamuul.",
		"points" => 2,
	],
	300310 => [
		"name" => "Never Surrender",
		"description" => "You did not show any signs of surrender to any sight of... you get the picture. Even a hundred of them did not pose a threat to you.",
		"points" => 3,
	],
	300311 => [
		"name" => "Nevermending Story",
		"description" => "You collected all of the mysterious bottle messages around the island of Roshamuul and located the remains of the first mate. Time will tell if his tale of mending an evil ring holds true.",
		"points" => 3,
	],
	300312 => [
		"name" => "Noblesse Obliterated",
		"description" => "After a battle like this you know who your friends are.",
		"points" => 0,
	],
	300313 => [
		"name" => "Prison Break",
		"description" => "Gaz'haragoth... a day to remember! Your world accomplished someting really big - and you have been part of it!",
		"points" => 8,
	],
	300314 => [
		"name" => "Sleepwalking",
		"description" => "You know your way, in dream and waking. And how to make tea that transcends the boundaries of conscience.",
		"points" => 1,
	],
	300315 => [
		"name" => "Umbral Archer",
		"description" => "You managed to transform, improve and sacrify your bow into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300316 => [
		"name" => "Umbral Berserker",
		"description" => "You managed to transform, improve and sacrify your hammer into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300317 => [
		"name" => "Umbral Bladelord",
		"description" => "You managed to transform, improve and sacrify your slayer into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300318 => [
		"name" => "Umbral Brawler",
		"description" => "You managed to transform, improve and sacrify your mace into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300319 => [
		"name" => "Umbral Executioner",
		"description" => "You managed to transform, improve and sacrify your chopper into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300320 => [
		"name" => "Umbral Harbringer",
		"description" => "You managed to transform, improve and sacrify your spellbook into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300321 => [
		"name" => "Umbral Headsman",
		"description" => "You managed to transform, improve and sacrify your axe into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300322 => [
		"name" => "Umbral Marksman",
		"description" => "You managed to transform, improve and sacrify your crossbow into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300323 => [
		"name" => "Umbral Master",
		"description" => "You managed to transform, improve and sacrify all kinds of weapons into a master state and have proven yourself worthy in a nightmarish world. Respect!",
		"points" => 8,
	],
	300324 => [
		"name" => "Umbral Swordsman",
		"description" => "You managed to transform, improve and sacrify your blade into a master state and have proven yourself worthy in a nightmarish world.",
		"points" => 6,
	],
	300325 => [
		"name" => "Combo Master",
		"description" => "You accomplished 10 or more consecutive chains in a row! That's killing at least 39 creatures in the correct order - now that's combinatorics!",
		"points" => 1,
	],
	300326 => [
		"name" => "Elementary, My Dear",
		"description" => "Through the spirit of science and exploration, you have discovered how to enter the secret hideout of the renowned Dr Merlay.",
		"points" => 1,
	],
	300327 => [
		"name" => "Glooth Engineer",
		"description" => "Though you might have averted a dire threat for Rathleton, this relative peace may only hold for a while. At least you've scavenged an outfit from some of the poor fellows that have fallen prey to death priest Shagron.",
		"points" => 0,
	],
	300328 => [
		"name" => "Rathleton Citizen",
		"description" => "By having rendered numerous services to the city of Rathleton you have been promoted to the rank of Citizen.",
		"points" => 0,
	],
	300329 => [
		"name" => "Rathleton Commoner",
		"description" => "By having rendered numerous services to the city of Rathleton you have been promoted to the rank of Commoner.",
		"points" => 1,
	],
	300330 => [
		"name" => "Rathleton Inhabitant",
		"description" => "By having rendered numerous services to the city of Rathleton you have been promoted to the rank of Inhabitant.",
		"points" => 1,
	],
];
