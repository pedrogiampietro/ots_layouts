<?php
if(!defined('INITIALIZED'))
    exit;
    
    $playersOnline = $config['status']['serverStatus_players'];

    $main_content .= '

    <div style="width:100%;line-height:30px;margin-bottom: -2px; margin-top: 10px;">
        <div style="width:100%;margin: 0 auto;position:relative;left:50%;font-family: \'Ubuntu\', sans-serif;font-weight: 700;text-shadow:0 0 10px #555;">
            <div style="width:200px;text-align:right;font-size:16px;position:absolute;left:-240px;">There are currently</div>
            <div style="width:200px;text-align:center;font-size:35px;position:absolute;left:-100px;" id="onlinecount-news">' . $playersOnline . '</div>
            <div style="width:200px;text-align:left;font-size:16px;position:absolute;left:40px;">players online.</div>
        </div>
    </div>

    <a href="?view=register" class="btn btn-secondary"><i class="fa fa-user-plus fa-sm"></i> Create an account</a>
    <a href="#" class="btn btn-secondary pull-right"><i class="fa fa-download fa-sm"></i> Download Client</a>
    <br/>

    <br/>
    <!-- coutdown <div id="launchCountdown" class="alert text-center" style="font-size: 18px; font-family: \'verdana\'; border-color: var(--shark-main); background-color: var(--cream-d2); margin: 20px 0 0;"></div> -->

    <br/>
    <br/>

    <!--<div class="contbox" style="padding-bottom:0;padding-top:0;">
        <legend style="margin-bottom:0;">Monthly Top Guilds
            <span class="pull-right">Prize Pool: 6000 Points <a href="/topguilds" style="font-size: 85%; margin-top: 5px;">(More)</a></span></legend>
        <table width="100%">
            <tr>
                <td>
                    <div class="top-area">
                        <b>1st<br/>
            <a href="/guilds/view/4">
                <img src="../layouts/custom/assets/img/1.png" class="top-icons" alt="Rank #1 Guild"><br/>
                <div class="top-names">FUCK SOCIETY</div>
            </a>
        </b> 18 War Frags
                    </div>
                </td>
                <td>
                    <div class="top-area">
                        <b>2nd<br/>
            <a href="/guilds/view/15">
                <img src="../layouts/custom/assets/img/2.png" class="top-icons" alt="Rank #2 Guild"><br/>
                <div class="top-names">High AF</div>
            </a>
        </b> 5 War Frags
                    </div>
                </td>
            </tr>
        </table>
    </div> -->
    <h2>News</h2>

    ';
    



function replaceSmile($text, $smile)
{
    $smileys = array(';D' => 1, ':D' => 1, ':cool:' => 2, ';cool;' => 2, ':ekk:' => 3, ';ekk;' => 3, ';o' => 4, ';O' => 4, ':o' => 4, ':O' => 4, ':(' => 5, ';(' => 5, ':mad:' => 6, ';mad;' => 6, ';rolleyes;' => 7, ':rolleyes:' => 7, ':)' => 8, ';d' => 9, ':d' => 9, ';)' => 10);
    if($smile == 1)
        return $text;
    else
    {
        foreach($smileys as $search => $replace)
            $text = str_replace($search, '<img src="images/forum/smile/'.$replace.'.gif" />', $text);
        return $text;
    }
}

function replaceAll($text, $smile)
{
    $rows = 0;
    while(stripos($text, '[code]') !== false && stripos($text, '[/code]') !== false )
    {
        $code = substr($text, stripos($text, '[code]')+6, stripos($text, '[/code]') - stripos($text, '[code]') - 6);
        if(!is_int($rows / 2)) { $bgcolor = 'ABED25'; } else { $bgcolor = '23ED25'; } $rows++;
        $text = str_ireplace('[code]'.$code.'[/code]', '<i>Code:</i><br /><table cellpadding="0" style="background-color: #'.$bgcolor.'; width: 480px; border-style: dotted; border-color: #CCCCCC; border-width: 2px"><tr><td>'.$code.'</td></tr></table>', $text);
    }
    $rows = 0;
    while(stripos($text, '[quote]') !== false && stripos($text, '[/quote]') !== false )
    {
        $quote = substr($text, stripos($text, '[quote]')+7, stripos($text, '[/quote]') - stripos($text, '[quote]') - 7);
        if(!is_int($rows / 2)) { $bgcolor = 'AAAAAA'; } else { $bgcolor = 'CCCCCC'; } $rows++;
        $text = str_ireplace('[quote]'.$quote.'[/quote]', '<table cellpadding="0" style="background-color: #'.$bgcolor.'; width: 480px; border-style: dotted; border-color: #007900; border-width: 2px"><tr><td>'.$quote.'</td></tr></table>', $text);
    }
    $rows = 0;
    while(stripos($text, '[url]') !== false && stripos($text, '[/url]') !== false )
    {
        $url = substr($text, stripos($text, '[url]')+5, stripos($text, '[/url]') - stripos($text, '[url]') - 5);
        $text = str_ireplace('[url]'.$url.'[/url]', '<a href="'.$url.'" target="_blank">'.$url.'</a>', $text);
    }
    while(stripos($text, '[player]') !== false && stripos($text, '[/player]') !== false )
    {
        $player = substr($text, stripos($text, '[player]')+8, stripos($text, '[/player]') - stripos($text, '[player]') - 8);
        $text = str_ireplace('[player]'.$player.'[/player]', '<a href="?view=characters&name='.urlencode($player).'">'.$player.'</a>', $text);
    }
    while(stripos($text, '[img]') !== false && stripos($text, '[/img]') !== false )
    {
        $img = substr($text, stripos($text, '[img]')+5, stripos($text, '[/img]') - stripos($text, '[img]') - 5);
        $text = str_ireplace('[img]'.$img.'[/img]', '<img src="'.$img.'">', $text);
    }
    while(stripos($text, '[b]') !== false && stripos($text, '[/b]') !== false )
    {
        $b = substr($text, stripos($text, '[b]')+3, stripos($text, '[/b]') - stripos($text, '[b]') - 3);
        $text = str_ireplace('[b]'.$b.'[/b]', '<b>'.$b.'</b>', $text);
    }
    while(stripos($text, '[i]') !== false && stripos($text, '[/i]') !== false )
    {
        $i = substr($text, stripos($text, '[i]')+3, stripos($text, '[/i]') - stripos($text, '[i]') - 3);
        $text = str_ireplace('[i]'.$i.'[/i]', '<i>'.$i.'</i>', $text);
    }
    while(stripos($text, '[u]') !== false && stripos($text, '[/u]') !== false )
    {
        $u = substr($text, stripos($text, '[u]')+3, stripos($text, '[/u]') - stripos($text, '[u]') - 3);
        $text = str_ireplace('[u]'.$u.'[/u]', '<u>'.$u.'</u>', $text);
    }
    return replaceSmile($text, $smile);
}

function showPost($topic, $text, $smile)
{
    $text = $text;
    $post = '';
    if(!empty($topic))
        $post .= '<b>'.replaceSmile($topic, $smile).'</b>';
    $post .= replaceAll($text, $smile);
    return $post;
}




$last_threads = $SQL->query('SELECT ' . $SQL->tableName('players') . '.' . $SQL->fieldName('name') . ', ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('post_text') . ', ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('post_topic') . ', ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('post_smile') . ', ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('id') . ', ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('replies') . ', ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('post_date') . ' FROM ' . $SQL->tableName('players') . ', ' . $SQL->tableName('z_forum') . ' WHERE ' . $SQL->tableName('players') . '.' . $SQL->fieldName('id') . ' = ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('author_guid') . ' AND ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('section') . ' = 1 AND ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('first_post') . ' = ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('id') . ' ORDER BY ' . $SQL->tableName('z_forum') . '.' . $SQL->fieldName('last_post') . ' DESC LIMIT ' . $config['site']['news_limit'])->fetchAll();
if (isset($last_threads[0])) {
    foreach($last_threads as $thread) {
        $main_content .= '
        <div class="contbox" style="margin-bottom: 22px;">
        <a href="/news/node/1576397353" style="font-size:18px;font-family: \'Ubuntu\', sans-serif;text-shadow:1px 1px 2px black;">' . htmlspecialchars($thread['post_topic']) . '</a>
        <span class="active pull-right" style="font-size:14px;font-family: \'Ubuntu\', sans-serif;text-shadow:1px 1px 2px gray;font-weight: 400;line-height:14px;position:relative;top:6px;"><i><i class="fa fa-clock-o"></i> ' . date("H:i - F j, Y", $thread['post_date']) . '</i></span>
        <hr style="margin-top: 2px !important;margin-bottom: 4px !important;">
        <span style="float:right;position:relative;top:-30px;"></span>
        <p>' . showPost('', $thread['post_text'], $thread['post_smile']) . '</p>
    </div>
    <br>
';
    }
} else {
    $main_content .= '<div class="alert alert-info">No newsletters found.</div>';
}

    $main_content .= '

    <div class="pagination pagination-centered">
    <ul>
        <li class="diabled"><span>&larr; Previous</span></li>
        <li class="active" style="width:100px;"><span style="text-shadow:0 0 5px #999;"><b><a href="/news/1">1</a></b></span></li>
        <li><a href="/news/2">2</a></li>
        <li><a href="/news/3">3</a></li>
        <li><a href="/news/4">4</a></li>
        <li><a href="/news/5">5</a></li>
        <li><a href="/news/6">6</a></li>
        <li><a href="/news/7">7</a></li>
        <li><a href="/news/8">8</a></li>
        <li><a href="/news/9">9</a></li>
        <li class="diabled"><span>Next &rarr;</span></li>
        </li>
    </ul>
</div>
<br/>

    ';