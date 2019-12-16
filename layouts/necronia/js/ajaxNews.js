//Add and delete tickers ;)
$(document).ready(function() {
	$('#insertTicker').click(function(event){
		//vars
		var tickerText = $('input[name=tickerText]').val();
		var tickerIcon = $('select[name=tickerIcon]').val();
		
		if (tickerText == "" || tickerIcon == "") {
			alert('All fields are required!');
			return false;
		}
		$.ajax({
			url: 'ajax.php',
			type: 'POST',
			data: {
				acao:"addTicker",
				ticker:tickerText,
				icon:tickerIcon
			},
			dataType:"json",
			success: function(data) {
				if (data.status == "success") {
					location.reload();
				}
			}
		});
		event.preventDefault();
	});
	
	//$('#delTicker').live('click',function(e){
	$('#delTicker').on('click', function() {
		//var
		var tickerID = $(this).parent().find('input[name=tickerID]').val();
		var del = confirm('Do you really want delete this ticker ?');
		if (del) {
			$.ajax({
				url: 'ajax.php',
				type: 'POST',
				data: {
					acao:"delTicker",
					tickerID:tickerID
				},
				dataType:"json",
				success: function(data) {
					if (data.status == "success") {
						location.reload();
					}
				}
			});
		}
		e.preventDefault();
	});
});

function refreshPage() {
	location.reload();
}


