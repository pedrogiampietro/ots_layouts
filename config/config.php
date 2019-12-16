<?PHP
# Account Maker Config
$config['site']['url'] = 'https://aldora.net';
$config['site']['serverPath'] = "C:\otserv/";
$config['site']['useServerConfigCache'] = false;
$towns_list = array(1 => 'Venore', 2 => 'Thais', 3 => 'Kazordoon', 4 => 'Carlin', 5 => 'Ab Dendriel', 6 => 'Rookgaard', 7 => 'Liberty Bay', 8 => 'Port Hope', 9 => 'Ankrahmun', 10 => 'Darashia', 11 => 'Edron');

$config['site']['outfit_images_url'] = 'http://outfit-images.ots.me/outfit.php';
$config['site']['item_images_url'] = '/images/shop/';
$config['site']['item_images_extension'] = '.gif';
$config['site']['flag_images_url'] = 'http://flag-images.ots.me/';
$config['site']['flag_images_extension'] = '.png';

# Create Account Options
$config['site']['one_email'] = false;
$config['site']['create_account_verify_mail'] = false;
$config['site']['verify_code'] = false;
$config['site']['email_days_to_change'] = 3;
$config['site']['newaccount_premdays'] = 999;
$config['site']['send_register_email'] = false;

# Create Character Options
$config['site']['newchar_vocations'] = array(1 => 'Rook Sample');
//$config['site']['newchar_vocations'] = array(1 => 'Sorcerer Sample', 2 => 'Druid Sample', 3 => 'Paladin Sample', 4 => 'Knight Sample');
$config['site']['newchar_towns'] = array(11);
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
$config['site']['show_skills_info'] = false;
$config['site']['show_vip_storage'] = 0;
$config['site']['showTasks'] = true;
$config['site']['showQuests'] = true;

$config["site"]["quests"] = array(
        "Addon Doll Quest"     => array("storageid" => 24331,     "startvalue" => 0,     "endvalue" => 1),
        "Mount Doll Quest"     => array("storageid" => 24316,     "startvalue" => 0,     "endvalue" => 1),		
		"Ferumbras Hat"     => array("storageid" => 5903,     "startvalue" => 0,     "endvalue" => 1),		
		"Critical Ring 10%"     => array("storageid" => 26187,     "startvalue" => 0,     "endvalue" => 1),		
);
$config["site"]["tasks"] = array(
					"Fairus" => array("storageid" => 23122, "startvalue" => 0, "endvalue" => 40000),
					"Soul Dead" => array("storageid" => 23123, "startvalue" => 0, "endvalue" => 15000),
					"Soul Guard" => array("storageid" => 23124, "startvalue" => 0, "endvalue" => 30000),
					"Comander Nomad" => array("storageid" => 23125, "startvalue" => 0, "endvalue" => 7000)
			);

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
$config['site']['layout'] = 'metro';
$config['site']['vdarkborder'] = '#505050';
$config['site']['darkborder'] = '#D4C0A1';
$config['site']['lightborder'] = '#F1E0C6';
$config['site']['download_page'] = false;
$config['site']['serverinfo_page'] = true;

