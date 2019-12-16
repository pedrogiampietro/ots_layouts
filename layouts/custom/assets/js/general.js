$(document).ready(function() 
{
	$('.ttip').tooltip();
	timeago().render($('.timeago'));
});

var popoverWhitelist = $.fn.tooltip.Constructor.DEFAULTS.whiteList;
popoverWhitelist.table = ['class', 'style', 'width'];
popoverWhitelist.tbody = ['class', 'style', 'width'];
popoverWhitelist.td = ['class', 'style', 'width'];
popoverWhitelist.tr = ['class', 'style', 'width'];